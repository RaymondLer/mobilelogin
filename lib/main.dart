import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilelogin/bloc/login_bloc.dart';
import 'package:mobilelogin/data/user_repository.dart';
import 'package:mobilelogin/screens/first_ui/firstUI.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => LoginBloc(UserRepository()),
      child: FirstUI(),
    ),
  ));
}
