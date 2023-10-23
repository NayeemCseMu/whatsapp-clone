import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/dummy_data.dart';
import '../../../utils/constants.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select contact",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  )),
              Text("299 contacts",
                  style: TextStyle(
                    fontSize: 12.sp,
                  )),
            ]),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(KImages.search)),
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              offset: Offset(0, 60),
              color: scaffoldBgColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text("New Group "),
                  ),
                  PopupMenuItem(
                    child: Text("New boradcast"),
                  ),
                  PopupMenuItem(
                    child: Text("Linked devices"),
                  ),
                  PopupMenuItem(
                    child: Text("Starred messages"),
                  ),
                  PopupMenuItem(
                    child: Text("Settins"),
                  ),
                ];
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Utils.verticalSpace(20),
            NewOption(
              icon: Icons.link,
              title: "New call link",
            ),
            Utils.verticalSpace(20),
            NewOption(
              icon: Icons.group,
              title: "New group call",
            ),
            Utils.verticalSpace(20),
            NewOption(
              icon: Icons.person_add,
              title: "New contact",
              trail: Icon(
                Icons.qr_code_outlined,
                size: 28,
              ),
            ),
            Utils.verticalSpace(20),
            ...List.generate(
                KDummyData.contacts.length,
                (index) => ContactTile(
                      title: KDummyData.contacts[index]['user']!,
                      subtitle: KDummyData.contacts[index]['status']!,
                      avatar: KDummyData.contacts[index]['avatar']!,
                    )),
          ],
        ),
      ),
    );
  }
}

class NewOption extends StatelessWidget {
  const NewOption({
    super.key,
    required this.title,
    required this.icon,
    this.trail,
  });
  final String title;
  final IconData icon;
  final Widget? trail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: primaryColor,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
      trailing: trail,
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.avatar,
  });
  final String title;
  final String subtitle;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: primaryColor,
        backgroundImage: AssetImage(avatar),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              KImages.phone,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              KImages.video,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
