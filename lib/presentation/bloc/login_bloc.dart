import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/use_cases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;
  LoginBloc(this.useCase) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      final user = await useCase.execute(event.email, event.password);
      if (user != null) {
        emit(LoginSuccess(user.email));
      } else {
        emit(LoginFailure("Invalid credentials"));
      }
    });
  }
}