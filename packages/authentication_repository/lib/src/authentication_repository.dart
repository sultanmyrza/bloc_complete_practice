import 'dart:async';

enum AuththentictationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuththentictationStatus>();

  void dispose() => _controller.close();

  Stream<AuththentictationStatus> get status async* {
    await Future.delayed(Duration(seconds: 1));
    yield AuththentictationStatus.unknown;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      Duration(milliseconds: 300),
      () => _controller.add(AuththentictationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuththentictationStatus.unauthenticated);
  }
}
