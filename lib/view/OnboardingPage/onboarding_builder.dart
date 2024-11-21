import 'package:flutter/material.dart';
import 'package:grduation_proj/default/default_text.dart';
import 'package:grduation_proj/view/OnboardingPage/onboarding_model.dart';
import 'package:sizer/sizer.dart';


// ignore: must_be_immutable
class OnboardingPageBuilder extends StatelessWidget {
  OnboardingModel onboardingModel;
  OnboardingPageBuilder({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, right: 2.w, left: 2.w),
      child: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(onboardingModel.image),
            SizedBox(height: 4.h,),
             DefaultText(text: onboardingModel.disc, fontSize: 20.sp, fontStyle: FontStyle.italic,),
          ],
        ),
      ),
    );
  }
}