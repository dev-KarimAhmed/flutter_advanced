import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_application/features/home/logic/cubit/home_state.dart';
import 'package:flutter_complete_application/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:flutter_complete_application/features/home/ui/widgets/doctor_list_view.dart';
import 'package:flutter_complete_application/features/home/ui/widgets/doctor_speciality_list.dart';
import 'package:flutter_complete_application/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_complete_application/features/home/ui/widgets/social_speciality_seeall.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24.h),
              const DoctorsSpecialitySeeAll(),
              BlocBuilder<HomeCubit, HomeState>(
                // buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  switch (state) {
                    case SpecializationLoading():
                    return  const Center(child: CircularProgressIndicator());
                    case SpecializationError():
                    return  Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    case SpecializationSuccess():
                      return state.specialization.specializations!.isEmpty || state.specialization.specializations == null ? const Center(child: Text('Empty')) : Expanded(
                        child: Column(
                          children: [
                            verticalSpace(18),
                            DoctorsSpecialityListView(
                              specializationList:
                                  state.specialization.specializations ?? [],
                            ),
                            verticalSpace(8),
                            DoctorsListView(
                              doctorsModel:
                                  state
                                      .specialization
                                      .specializations?[0]
                                      .doctorsList ??
                                  [],
                            ),
                          ],
                        ),
                      );
                    default:
                      const Center(child: Text('Default'));
                      break;
                  }
                  return const Center(child: Text('Default!!'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
