
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grduation_proj/default/default_text.dart';
import 'package:grduation_proj/shared/enum.dart';
import 'package:grduation_proj/shared/cache_helper.dart';
import 'package:grduation_proj/view/OnboardingPage/onboarding_builder.dart';
import 'package:grduation_proj/view/OnboardingPage/onboarding_model.dart';
import 'package:grduation_proj/view/login_page.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var pageController = PageController();

  bool isLast = false;
  bool isSigned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.grey[600]),
        backgroundColor: Colors.grey[100],
        shadowColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false);
                    isSigned = true;
                    CacheHelper.putBool(key: SharedKey.isSigned, value: isSigned);
              },
              child: DefaultText(
                text: 'Skip',
                fontSize: 17.sp,
                color: Colors.indigo,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Expanded(
              flex: 8,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: OnboardingItem.length,
                  itemBuilder: (context, index) {
                    return OnboardingPageBuilder(
                      onboardingModel: OnboardingItem[index],
                    );
                  },
                  onPageChanged: (int index){
                    if(index == OnboardingItem.length-1){
                      setState(() {
                        isLast = true;
                        CacheHelper.putBool(value: isLast, key: SharedKey.OnboardingIsLast);
                      });
                    }
                    else{setState(() {
                      isLast = false;
                    });}
                  },),
            ),
            Expanded(
              child: SmoothPageIndicator(
                controller: pageController,
                count: OnboardingItem.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey.shade400,
                    activeDotColor: Colors.indigo),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: isLast,
                  replacement: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                        onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (_) => const LoginPage()),
                    //     (route) => false);
                                },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.sp),
                                      ),
                                      ),
                            
                        child: Container(
                          width: 16.w,
                          child: Row(
                            children: [
                              DefaultText(text: 'Next', fontSize: 15.sp),
                              SizedBox(width: 1.5.w,),
                              Icon(Icons.arrow_right_alt, size: 0.35.dp,)
                            ],
                          ),
                        )
                      ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false);
                      isSigned = true;
                      CacheHelper.putBool(key: SharedKey.isSigned, value: isSigned);
                },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.sp),
                                    ),
                                    ),
                          
                      child: DefaultText(text: 'Lets go !', fontSize: 15.sp),
                    ),
                    
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
