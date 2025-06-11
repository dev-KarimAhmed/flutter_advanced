import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_complete_application/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationList,
  });
  final List<SpecializationModel> specializationList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationList.length,
        itemBuilder: (context, index) {
          return DoctorListItem(
            itemIdx: index,
            specializationModel: specializationList[index],
          );
        },
      ),
    );
  }
}

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({super.key, required this.itemIdx, required this.specializationModel});
  final int itemIdx;
  final SpecializationModel specializationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIdx == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManger.mainBlue,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationModel.name ?? "Specialized !",
            style: TextStyles.font13GreyRegular.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
