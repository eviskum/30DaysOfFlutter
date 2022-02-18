part of 'confirmation_bloc.dart';

// @immutable
// abstract class ConfirmationState {}

// class ConfirmationInitial extends ConfirmationState {}

class ConfirmationState {
  final String confirmationCode;
  final FormStatus formState;

  bool get isValidUsername => confirmationCode.length == 6;

  ConfirmationState({this.confirmationCode = '', this.formState = const InitialFormStatus()});

  ConfirmationState copyWith({String? confirmationCode, FormStatus? formState}) {
    return ConfirmationState(
      confirmationCode: confirmationCode ?? this.confirmationCode,
      formState: formState ?? this.formState,
    );
  }
}
