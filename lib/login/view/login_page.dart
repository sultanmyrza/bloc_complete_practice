import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_complete_practice/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';

/*
 * The LoginPage is responsible for exposing the Route as well as 
 * creating and providing the LoginBloc to the LoginForm
 */
class LoginPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context));
        },
        child: LoginForm(),
      ),
    );
  }
}
