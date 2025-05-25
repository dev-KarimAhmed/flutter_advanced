

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/functions/build_custom_loading.dart';
import 'package:flutter_complete_application/core/helpers/extensions.dart';
import 'package:flutter_complete_application/core/routing/routes.dart';
import 'package:flutter_complete_application/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:flutter_complete_application/features/sign_up/logic/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupCubitState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
       switch (state) {
         case Loading():
            buildCustomLoading(context);
          case Error():
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          case Success():
            context.pushReplacmentNamed(Routes.homeScreen , arguments: state.signupResponse);  
         default:
         
       }
      },
      child: SizedBox.shrink(),
    );
  }
}
