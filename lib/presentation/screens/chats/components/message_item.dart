import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/participants_chat_model.dart';
import '../../../../utils/constants.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({
    Key? key,
    required this.element,
  }) : super(key: key);
  final Messages element;

  @override
  Widget build(BuildContext context) {
    bool isMe = element.sender == "user";
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: BubbleNormal(
            text: element.message,
            isSender: isMe,
            sent: isMe ? element.sent : false,
            delivered: isMe ? element.delivered : false,
            seen: isMe ? element.seen : false,
            color: isMe ? userMessageBg : senderMessageBg,
            tail: true,
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: isMe ? Colors.black : blackColor,
            ),
          )),
    );
  }
}

class MessageSeparator extends StatelessWidget {
  const MessageSeparator({
    Key? key,
    required this.groupByValue,
  }) : super(key: key);
  final DateTime groupByValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        DateFormat.yMMMMd("en_US").format(groupByValue),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      // child: Center(
      //   child: DateChip(date: groupByValue, color: grayColor),
      // ),
    );
  }
}
