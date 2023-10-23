import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../core/routes/routes_name.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: scaffoldBgColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          KStrings.enterPhoneTitle,
          style: TextStyle(
            fontSize: 16.sp,
            color: primaryColor,
          ),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert, color: subTitleTextColor),
              color: scaffoldBgColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text("Link as companion device"),
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                  ),
                ];
              })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text.rich(
                  textAlign: TextAlign.center,
                  selectionColor: Colors.blue,
                  TextSpan(
                      text: KStrings.verifyAccountText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: textColor,
                      ),
                      children: [
                        TextSpan(
                          text: KStrings.myNumber,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ])),
              Utils.verticalSpace(10),
              SizedBox(
                width: size.width * 0.7,
                child: DropdownButton<String>(
                    hint: Text("Bangladesh"),
                    isExpanded: true,
                    alignment: Alignment.center,
                    items: [
                      DropdownMenuItem(
                        child: Text("Bangladesh"),
                        value: "bangladesh",
                      )
                    ],
                    onChanged: (v) {}),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        // prefixIcon: Icon(
                        //   Icons.add,
                        //   size: 20,
                        // ),
                        hintText: "+880",
                      ),
                    )),
                    Utils.horizontalSpace(10),
                    Expanded(
                        flex: 3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: KStrings.phontHint,
                          ),
                        ))
                  ],
                ),
              ),
              Utils.verticalSpace(20),
              Text(
                KStrings.carrierCharge,
                style: TextStyle(
                  color: subTitleTextColor,
                ),
              ),
              Spacer(),
              SizedBox(
                  width: 100,
                  child: CustomButton(
                      text: "Next",
                      textSize: 16,
                      press: () {
                        Navigator.pushNamed(context, RouteNames.mainScreen);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
