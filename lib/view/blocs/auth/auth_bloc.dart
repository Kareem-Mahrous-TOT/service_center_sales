import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/config.dart';
import '../../../app/usecases.dart';
import '../../../core/core.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;

  AuthBloc({
    required LoginUsecase loginUsecase,
  })  : _loginUsecase = loginUsecase,
        super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await _loginUsecase.call((event.inputs));

      final resultingState = result.fold(
        (failure) => AuthFailure(msg: failure.msg),
        (isSuccess) => isSuccess
            ? LoginSuccess()
            : AuthFailure(
                msg: navigatorKey.currentContext!.tr.somethingWentWrongMsg),
      );

      emit(resultingState);
    });
  }
}
