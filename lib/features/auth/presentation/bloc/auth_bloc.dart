import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/utils/enums/enums.dart';
import 'package:flutter_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:flutter_task/features/auth/presentation/bloc/auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(AuthState.initial()){
    on<SignIn>(_onSignIn);
  }


  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final Map<String, dynamic> params = {
      "username": event.username,
      "password": event.password
    };
    var result = await sl<SignInUseCase>().call(params: params);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, isSignedIn: data))
    );
  }

}