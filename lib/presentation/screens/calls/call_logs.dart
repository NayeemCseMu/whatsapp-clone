import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/dummy_data.dart';
import '../../../utils/constants.dart';
import 'package:whatsapp_clone/utils/k_images.dart';
import 'package:whatsapp_clone/utils/utils.dart';

import '../../../data/model/call_log_model.dart';

class CallLogs extends StatelessWidget {
  const CallLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            leading: CircleAvatar(
              radius: 35,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.link,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Create call link",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Share a link for your WhatsApp call",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            "Recent",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          ...List.generate(
            KDummyData.callHistory.length,
            (index) => CallCard(callLogs: KDummyData.callHistory[index]),
          )
        ],
      ),
    );
  }
}

class CallCard extends StatelessWidget {
  const CallCard({
    super.key,
    required this.callLogs,
  });
  final CallLog callLogs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.green,
        backgroundImage: AssetImage(KImages.chatAvatar1),
      ),
      title: Text(
        callLogs.personName,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: callLogs.isMissed ? Colors.red : textColor,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            callLogs.incoming ? Icons.call_received : Icons.call_made,
            size: 20,
            color: callLogs.isMissed ? Colors.red : Colors.green,
          ),
          Utils.horizontalSpace(6),
          Text(
            callLogs.time,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      trailing: SvgPicture.asset(
        callLogs.callType == "audio" ? KImages.phone : KImages.video,
        color: primaryColor,
      ),
    );
  }
}
