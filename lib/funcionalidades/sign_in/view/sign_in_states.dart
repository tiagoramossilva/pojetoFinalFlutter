import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_states.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.inicial() = SignInStateInicial;

  const factory SignInState.erro() = SignInStateErro;

  const factory SignInState.successo() = SignInStateSuccesso;
}
