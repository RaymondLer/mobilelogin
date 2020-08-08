import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilelogin/bloc/authentication/AuthenticationBloc.dart';
import 'package:mobilelogin/screens/firstUI.dart';
import 'package:mobilelogin/user.repository.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => AuthenticationBloc(UserRepository()),
      child: FirstUI(),
    ),
  ));
}
