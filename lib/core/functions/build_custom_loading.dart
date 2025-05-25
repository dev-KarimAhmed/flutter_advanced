  import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';

Future<dynamic> buildCustomLoading(BuildContext context) {
    return showDialog(
            context: context,
            builder:
                (_) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.mainBlue,
                  ),
                ),
          );
  }