import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/login_bloc.dart';
import 'presentation/pages/login_page.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'application/use_cases/login_usecase.dart';

void main() {
  final remoteDataSource = AuthRemoteDataSource();
  print('✅ Created AuthRemoteDataSource');

  final authRepo = AuthRepositoryImpl(remoteDataSource);
  print('✅ Created AuthRepositoryImpl');

  final loginUseCase = LoginUseCase(authRepo);
  print('✅ Created LoginUseCase');

  runApp(MyApp(loginUseCase: loginUseCase));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;
  const MyApp({required this.loginUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => LoginBloc(loginUseCase),
        child: LoginPage(),
      ),
    );
  }
}
