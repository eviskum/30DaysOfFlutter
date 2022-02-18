part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final User user;
  final bool isCurrentUser;
  final String? avatarPath;
  late final String? userDescription;

  String get username => user.username;
  String get email => user.email ?? '';

  final FormStatus formStatus;
  bool imageSourceActionSheetIsVisible;

  ProfileState(
      {required this.user,
      required this.isCurrentUser,
      this.avatarPath,
      String? userDescription,
      this.formStatus = const InitialFormStatus(),
      this.imageSourceActionSheetIsVisible = false}) {
    this.userDescription = userDescription ?? user.description;
  }

  ProfileState copyWith(
      {User? user,
      String? avatarPath,
      String? userDescription,
      FormStatus? formStatus,
      bool? imageSourceActionSheetIsVisible}) {
    return ProfileState(
      user: user ?? this.user,
      isCurrentUser: isCurrentUser,
      avatarPath: avatarPath ?? this.avatarPath,
      userDescription: userDescription ?? this.userDescription,
      formStatus: formStatus ?? this.formStatus,
      imageSourceActionSheetIsVisible: imageSourceActionSheetIsVisible ?? this.imageSourceActionSheetIsVisible,
    );
  }
}
