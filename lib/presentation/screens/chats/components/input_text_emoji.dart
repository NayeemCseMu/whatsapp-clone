import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../controller/message_controller.dart';

class TextEmojiInputField extends StatefulWidget {
  const TextEmojiInputField({super.key});

  @override
  State<TextEmojiInputField> createState() => _TextEmojiInputFieldState();
}

class _TextEmojiInputFieldState extends State<TextEmojiInputField> {
  final TextEditingController controller = TextEditingController();
  bool enableEmoji = false;
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(children: [
            Expanded(
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                    color: Color(0xFFF7F7F8),
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      if (FocusScope.of(context).hasFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      if (enableEmoji) {
                        FocusScope.of(context).canRequestFocus;
                      }
                      enableEmoji = !enableEmoji;
                      setState(() {});
                    },
                    child: Icon(
                      enableEmoji
                          ? Icons.keyboard
                          : Icons.emoji_emotions_outlined,
                      color: subTitleTextColor,
                      size: 30,
                    ),
                  ),
                  Expanded(
                      child: TextField(
                          cursorColor: primaryColor,
                          cursorWidth: 3,
                          controller: controller,
                          onChanged: (v) {
                            if (v.length > 0 && isTyping == false) {
                              isTyping = true;
                              setState(() {});
                            } else if (v.length == 0 && isTyping == true) {
                              isTyping = false;
                              setState(() {});
                            }
                          },
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                if (enableEmoji) {
                                  enableEmoji = false;
                                }
                              });
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Message",
                            hintStyle: TextStyle(fontSize: 16.sp),
                            filled: false,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ))),
                  RotatedBox(
                    quarterTurns: 100,
                    child: Icon(
                      Icons.attach_file,
                      color: subTitleTextColor,
                      size: 30,
                    ),
                  ),
                  Utils.horizontalSpace(16),
                  GestureDetector(
                    onTap: () {
                      Utils.openCamera();
                    },
                    child: SvgPicture.asset(
                      KImages.cameraFill,
                      height: 24,
                    ),
                  ),
                ]),
              ),
            ),
            Utils.horizontalSpace(8),
            GestureDetector(
              onTap: () {
                if (isTyping) {
                  MessageController.addMessage(controller.text);
                  controller.clear();
                  isTyping = false;
                  if (mounted) setState(() {});
                }
              },
              child: CircleAvatar(
                radius: 24.r,
                backgroundColor: primaryColor,
                child: Icon(
                  isTyping ? Icons.send : Icons.mic,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          ]),
        ),
        Utils.verticalSpace(6),
        SizedBox(
          height: size.height * (enableEmoji ? 0.4 : 0),
          child: EmojiPicker(
            onEmojiSelected: (Category? category, Emoji emoji) {
              // Do something when emoji is tapped (optional)
            },
            onBackspacePressed: () {
              // Do something when the user taps the backspace button (optional)
              // Set it to null to hide the Backspace-Button
            },
            textEditingController:
                controller, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
            config: Config(
              columns: 7,
              emojiSizeMax: 24 *
                  (Platform.isAndroid
                      ? 1
                      : 1.30), // Issue: https://github.com/flutter/flutter/issues/28894
              verticalSpacing: 0,
              horizontalSpacing: 0,

              gridPadding: EdgeInsets.zero,
              initCategory: Category.RECENT,
              bgColor: Color(0xFFF2F2F2),
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              recentTabBehavior: RecentTabBehavior.RECENT,
              recentsLimit: 28,
              noRecents: const Text(
                'No Recents',
                style: TextStyle(fontSize: 20, color: Colors.black26),
                textAlign: TextAlign.center,
              ), // Needs to be const Widget
              loadingIndicator:
                  const SizedBox.shrink(), // Needs to be const Widget
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
            ),
          ),
        ),
      ],
    );
  }
}
