
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/functions/build_custom_loading.dart';
import 'package:flutter_complete_application/core/helpers/extensions.dart';
import 'package:flutter_complete_application/core/routing/routes.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/features/login/data/models/login_response.dart';
import 'package:flutter_complete_application/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_application/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Error || current is Success || current is Loading,
      listener: (context, state) {
        switch (state) {
          case Loading():
            buildCustomLoading(context);
          case Error():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text((state).error),
                backgroundColor: Colors.red,
              ),
            );
          case Success():
            Success success = state;
            LoginResponse loginResponse = success.data as LoginResponse;
            context.pushReplacmentNamed(Routes.homeScreen , arguments: loginResponse);
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }


}
