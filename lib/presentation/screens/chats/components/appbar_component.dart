import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/participants_chat_model.dart';
import '../../../../utils/utils.dart';

class AvatarAndBackNavigate extends StatelessWidget {
  const AvatarAndBackNavigate({
    super.key,
    required this.user,
  });

  final ParticipantsChat user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Utils.horizontalSpace(6.w),
          Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
          CircleAvatar(backgroundImage: AssetImage(user.avatar)),
        ],
      ),
    );
  }
}

class UserAndStatus extends StatelessWidget {
  const UserAndStatus({
    super.key,
    required this.user,
  });

  final ParticipantsChat user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.participant),
        Text(
          user.status,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}
