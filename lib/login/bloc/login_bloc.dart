import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_complete_practice/login/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      yield _mapLoginUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapLoginPasswordChangedToState(event, state);
    } else if (event is LoginFormSubmitted) {
      yield* _mapLoginFormSubmittedToState(event, state);
    }
  }

  LoginState _mapLoginUsernameChangedToState(
    LoginUsernameChanged event,
    LoginState state,
  ) {
    final username = Username.dirty(event.username);
    return state.copyWith(
        username: username, status: Formz.validate([username, state.password]));
  }

  LoginState _mapLoginPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
        password: password, status: Formz.validate([password, state.username]));
  }

  Stream<LoginState> _mapLoginFormSubmittedToState(
    LoginFormSubmitted event,
    LoginState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (e) {
        print(e.toString());
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
