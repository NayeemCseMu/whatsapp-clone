import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/dummy_data.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/utils.dart';
import '../../../core/routes/routes_name.dart';

class StatusHorizontal extends StatelessWidget {
  const StatusHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          .copyWith(right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                KStrings.story,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: hTextColor,
                ),
              ),
              PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.more_vert,
                    color: subTitleTextColor,
                  ),
                  offset: Offset(0, 35),
                  color: scaffoldBgColor,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  itemBuilder: (context) {
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Text("Muted updates"),
                      ),
                      PopupMenuItem(
                        child: Text("Status privacy"),
                      ),
                    ];
                  })
            ],
          ),
          Utils.verticalSpace(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(KImages.chatAvatar1),
                      ),
                      Positioned(
                        right: -10,
                        bottom: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Container(
                              height: 20,
                              width: 20,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: primaryColor, shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Utils.verticalSpace(4),
                  Text("My Status"),
                ],
              ),
              Utils.horizontalSpace(20),
              SingleChildScrollView(
                child: Row(
                  children: [
                    ...List.generate(
                      KDummyData.storyList.length,
                      (index) => Story(index: index),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.storyPage);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DottedBorder(
              dashPattern: [10, 4],
              strokeWidth: 2,
              borderType: BorderType.Circle,
              color: primaryColor,
              strokeCap: StrokeCap.round,
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage(KDummyData.storyList[index]['avatar']!)),
            ),
            Utils.verticalSpace(4),
            Text(
              KDummyData.storyList[index]['user']!.split(" ").first,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
