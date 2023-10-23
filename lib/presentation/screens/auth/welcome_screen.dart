import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/presentation/core/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../../../utils/constants.dart';
import '../../../utils/k_images.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(KImages.whatsappWelcome),
              Text(
                KStrings.welcomeTitle,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Utils.verticalSpace(20),
              Text.rich(
                  textAlign: TextAlign.center,
                  selectionColor: Colors.blue,
                  TextSpan(
                      text: KStrings.read,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: subTitleTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: KStrings.privacyPolicy,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: KStrings.tapAgree,
                          style: TextStyle(
                            color: subTitleTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: KStrings.termsService,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        )
                      ])),
              Utils.verticalSpace(30),
              GestureDetector(
                onTap: () {
                  openBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        KImages.world,
                        color: primaryColor,
                        height: 24,
                      ),
                      Utils.horizontalSpace(16),
                      Text(
                        "English",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      Utils.horizontalSpace(10),
                      Icon(
                        Icons.expand_more,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                text: KStrings.agreeContinue,
                press: () {
                  Navigator.pushNamed(context, RouteNames.auth);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        enableDrag: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                StateSetter setState /*You can rename this!*/) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.clear,
                            color: subTitleTextColor,
                          ),
                          Utils.horizontalSpace(20),
                          Text(
                            "App language",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Utils.verticalSpace(10),
                      ...List.generate(
                          10,
                          (index) => RadioListTile(
                                value: 1,
                                groupValue: "groupValue",
                                onChanged: (v) {},
                                title: Text("English"),
                                subtitle: Text("(Device language)"),
                              )),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
