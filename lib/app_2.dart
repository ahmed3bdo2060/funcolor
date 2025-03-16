import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app_view.dart';
import 'bloc/authentication_bloc/authentication_bloc.dart';

class MyApp2 extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp2(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
          userRepository: userRepository
      ),
      child: const MyAppView(),
    );
  }
}