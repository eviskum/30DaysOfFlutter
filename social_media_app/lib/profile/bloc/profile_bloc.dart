import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/repositories/data_repository.dart';
import 'package:social_media_app/form/bloc/form_state.dart';
import 'package:social_media_app/image_url_cache.dart';
import 'package:social_media_app/repositories/storage_repository.dart';

import '../../models/User.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DataRepository dataRepo;
  final StorageRepository storageRepo;
  final _picker = ImagePicker();

  ProfileBloc({required User user, required bool isCurrentUser, required this.dataRepo, required this.storageRepo})
      : super(ProfileState(user: user, isCurrentUser: isCurrentUser)) {
    on<ChangeAvatarRequest>(_onChangeAvatarRequest);
    on<DismissChangeAvatarRequest>(_onDismissChangeAvatarRequest);
    on<OpenImagePicker>(_onOpenImagePicker);
    on<ProvideImagePath>(_onProvideImagePath);
    on<ProfileDescriptionChanged>(_onProfileDescriptionChanged);
    on<SaveProfileChanges>(_onSaveProfileChanges);

    if (user.avatarKey != null) {
      ImageUrlCache.instance.getUrl(user.avatarKey!).then((url) => add(ProvideImagePath(avatarPath: url!)));
    }
  }

  void _onChangeAvatarRequest(ChangeAvatarRequest event, Emitter<ProfileState> emit) {
    emit(state.copyWith(imageSourceActionSheetIsVisible: true));
  }

  void _onDismissChangeAvatarRequest(DismissChangeAvatarRequest event, Emitter<ProfileState> emit) {
    emit(state.copyWith(imageSourceActionSheetIsVisible: false));
  }

  void _onOpenImagePicker(OpenImagePicker event, Emitter<ProfileState> emit) async {
    // emit(state.copyWith(imageSourceActionSheetIsVisible: false));
    final XFile? image = await _picker.pickImage(source: event.imageSource);
    if (image == null) return;
    try {
      final imageKey = await storageRepo.uploadFile(image);
      print('S3 imagekey: ${imageKey.toString()}');
      final updatedUser = state.user.copyWith(avatarKey: imageKey);
      final results = await Future.wait([
        dataRepo.updateUser(updatedUser),
        storageRepo.getUrlForFile(imageKey),
      ]);
      emit(state.copyWith(avatarPath: results.last as String));
    } catch (e) {
      print('Image picker fejl fejl');
      print(e.toString());
    }
  }

  void _onProvideImagePath(ProvideImagePath event, Emitter<ProfileState> emit) {
    print('Vi Provider image path');
    emit(state.copyWith(avatarPath: event.avatarPath));
  }

  void _onProfileDescriptionChanged(ProfileDescriptionChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith(userDescription: event.description));
  }

  void _onSaveProfileChanges(SaveProfileChanges event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final updatedUser = state.user.copyWith(description: state.userDescription);
    try {
      await dataRepo.updateUser(updatedUser);
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }
}
