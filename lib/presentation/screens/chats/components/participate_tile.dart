import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../data/model/chats_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/utils.dart';
import '../../../core/routes/routes_name.dart';

class ParticipateTile extends StatelessWidget {
  const ParticipateTile({
    super.key,
    required this.element,
  });

  final Participant element;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.inbox);
      },
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: primaryColor,
        backgroundImage: AssetImage(element.avatar),
      ),
      title: Text(
        element.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: hTextColor,
        ),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (element.messageFrom == "user") ...[
            element.seen
                ? Icon(Icons.done_all_rounded, color: Colors.blue, size: 20.w)
                : element.delivered
                    ? Icon(Icons.done_all_rounded, size: 20.w)
                    : Icon(Icons.check, size: 20.w),
            Utils.horizontalSpace(3),
          ],
          Expanded(
            child: Text(
              element.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: subTitleTextColor,
              ),
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat.jm().format(DateTime.parse(element.date)),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: element.unread != 0 ? primaryColor : subTitleTextColor,
            ),
          ),
          if (element.unread != 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: Text(
                element.unread.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
        ],
      ),
    );
  }
}
