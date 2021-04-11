import 'package:bloc_complete_practice/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
 * The LoginForm handles notifying the LoginBloc of user events and 
 * also responds to state changes using BlocBuilder and BlocListener.
 */
class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {}
      },
    );
  }
}
