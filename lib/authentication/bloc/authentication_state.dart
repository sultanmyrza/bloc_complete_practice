part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuththentictationStatus status;
  final User user;

  const AuthenticationState._({
    this.status = AuththentictationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknow() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuththentictationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuththentictationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
