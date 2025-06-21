import 'package:flutter/widgets.dart';
import 'package:flutter_complete_application/core/networking/dio_factory.dart';
import 'package:flutter_complete_application/core/services/pref_keys.dart';
import 'package:flutter_complete_application/core/services/shared_prefs.dart';
import 'package:flutter_complete_application/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_application/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_application/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  final LoginRepo _loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold((failure) {
      emit(LoginState.error(error: failure.errMessage));
    }, (response) async{
      await saveToken(response.userData?.token ?? '');
      emit(LoginState.success(response));
    });
  }

  Future<void> saveToken(String token) async {
    await SharedPref.preferences.setString(SharedPrefKeys.userToken, token);
    DioFactory.setDioHeadersAfterLogin(token);
  }
}
