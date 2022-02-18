import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/profile/bloc/profile_bloc.dart';
import '../repositories/data_repository.dart';
import '../form/bloc/form_state.dart';
import '../session/cubit/session_cubit.dart';
import '../repositories/storage_repository.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCubit = context.read<SessionCubit>();
    final storageRepo = context.read<StorageRepository>();
    final dataRepo = context.read<DataRepository>();
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(
        user: sessionCubit.selectedUser ?? sessionCubit.currentUser,
        isCurrentUser: sessionCubit.isCurrentUserSelected,
        dataRepo: dataRepo,
        storageRepo: storageRepo,
      ),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.imageSourceActionSheetIsVisible) _showImageSourceActionSheet(context);
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFF2F2F7),
            appBar: _appBar(state),
            body: _profilePage(context, state),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(ProfileState profileState) {
    return AppBar(
      title: Text('Profile'),
      actions: [
        if (profileState.isCurrentUser) IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
      ],
    );
  }

  Widget _profilePage(BuildContext context, ProfileState profileState) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            _avatar(profileState),
            if (profileState.isCurrentUser) _changeAvatarButton(context, profileState),
            SizedBox(height: 30),
            _usernameTile(profileState),
            _emailTile(profileState),
            _descriptionTile(context, profileState),
            if (profileState.isCurrentUser) _saveProfileChangesButton(context, profileState),
          ],
        ),
      ),
    );
  }

  Widget _avatar(ProfileState profileState) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      width: 100,
      height: 100,
      child: profileState.avatarPath == null
          ? Icon(Icons.person, size: 50)
          // : CircleAvatar(radius: 50, backgroundImage: NetworkImage(profileState.avatarPath!))
          : ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: profileState.avatarPath!,
                fit: BoxFit.cover,
              ),
            ),
    );
    // return profileState.avatarPath == null
    //     ? Container(
    //         decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
    //         width: 100,
    //         height: 100,
    //         child: Icon(Icons.person, size: 50),
    // )
    // : CircleAvatar(radius: 50, backgroundImage: NetworkImage(profileState.avatarPath!));
  }

  Widget _changeAvatarButton(BuildContext context, ProfileState profileState) {
    return TextButton(
        onPressed: () {
          context.read<ProfileBloc>().add(ChangeAvatarRequest());
        },
        child: Text('Change Avatar'));
  }

  Widget _usernameTile(ProfileState profileState) {
    return ListTile(tileColor: Colors.white, leading: Icon(Icons.person), title: Text(profileState.username));
  }

  Widget _emailTile(ProfileState profileState) {
    return ListTile(tileColor: Colors.white, leading: Icon(Icons.mail), title: Text(profileState.email));
  }

  Widget _descriptionTile(BuildContext context, ProfileState profileState) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.edit),
      title: TextFormField(
        initialValue: profileState.userDescription,
        decoration: InputDecoration.collapsed(
          hintText:
              profileState.isCurrentUser ? 'Save something about yourself' : 'This user hasn\'t updated their profile',
        ),
        maxLines: null,
        readOnly: !profileState.isCurrentUser,
        toolbarOptions: ToolbarOptions(
          copy: profileState.isCurrentUser,
          cut: profileState.isCurrentUser,
          paste: profileState.isCurrentUser,
          selectAll: profileState.isCurrentUser,
        ),
        onChanged: (value) => context.read<ProfileBloc>().add(ProfileDescriptionChanged(description: value)),
      ),
    );
  }

  Widget _saveProfileChangesButton(BuildContext context, ProfileState profileState) {
    return profileState.formStatus is FormSubmitting
        ? CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () => context.read<ProfileBloc>().add(SaveProfileChanges()), child: Text('Save Changes'));
  }

  void _showImageSourceActionSheet(BuildContext context) {
    Function(ImageSource) selectImageSource = (imageSource) {
      context.read<ProfileBloc>().add(OpenImagePicker(imageSource: imageSource));
    };

    Function dismissModalSheet = () {
      print('Dismiss modalsheet');
      context.read<ProfileBloc>().add(DismissChangeAvatarRequest());
    };

    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
              child: Text('Camera'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
          ],
        ),
      ).whenComplete(() {
        dismissModalSheet();
      });
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt,
              ),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            ),
          ],
        ),
      ).whenComplete(() {
        dismissModalSheet();
      });
      ;
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
