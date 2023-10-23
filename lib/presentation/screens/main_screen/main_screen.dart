import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/routes/routes_name.dart';
import '../calls/call_logs.dart';
import '../../../utils/constants.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../chats/controller/message_controller.dart';
import '../chats/participants_list.dart';
import '../community/community_page.dart';
import '../updates/updates_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int selectedTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    MessageController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: primaryColor,
          leading: SizedBox(),
          leadingWidth: Utils.kDefaultSpace,
          title: Text(
            "WhatsApp",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          titleSpacing: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Utils.openCamera();
                },
                icon: SvgPicture.asset(KImages.camera)),
            if (selectedTab != 2)
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(KImages.search)),
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
          bottom: TabBar(
              controller: tabController,
              onTap: (v) {
                setState(() {
                  selectedTab = v;
                });
              },
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(top: Utils.kDefaultSpace / 20),
              unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  color: subTitleTextColor,
                  fontWeight: FontWeight.w600),
              labelPadding: EdgeInsets.only(bottom: 0),
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                SizedBox(
                    width: size.width * 0.1,
                    child: Tab(child: Icon(Icons.groups_2_rounded))),
                SizedBox(
                    width: size.width * 0.3,
                    child: Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Chats"),
                        Utils.horizontalSpace(6),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12,
                          child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        )
                      ],
                    ))),
                SizedBox(
                    width: size.width * 0.3,
                    child: Tab(child: Text("Updates"))),
                SizedBox(
                    width: size.width * 0.3, child: Tab(child: Text("Calls"))),
              ]),
        ),
        body: TabBarView(controller: tabController, children: [
          CommunityPage(),
          ConversationList(),
          UpdatesPage(),
          CallLogs(),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: selectedTab == 0
            ? SizedBox()
            : Stack(
                // mainAxisSize: MainAxisSize.min,
                clipBehavior: Clip.none,
                children: [
                  // if (selectedTab == 2)
                  Positioned(
                    bottom: selectedTab == 2 ? 70 : 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        press(selectedTab);
                      },
                      elevation: 0,
                      hoverElevation: 2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.edit,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Utils.verticalSpace(10),
                  FloatingActionButton(
                    onPressed: () {
                      press(selectedTab);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: getIcon(selectedTab),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget getIcon(int index) {
    switch (index) {
      case 1:
        return SvgPicture.asset(
          KImages.message,
        );
      case 2:
        return SvgPicture.asset(
          KImages.cameraFillWhite,
        );
      case 3:
        return SvgPicture.asset(
          KImages.phone,
        );
      default:
        return SizedBox();
    }
  }

  press(int index) {
    switch (index) {
      case 1:
        Navigator.pushNamed(context, RouteNames.contactPage);
        break;
      case 2:
        Utils.openCamera();
        break;
      case 3:
        Navigator.pushNamed(context, RouteNames.contactPage);
        break;
      default:
        null;
        break;
    }
  }
}
