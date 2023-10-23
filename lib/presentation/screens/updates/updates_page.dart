import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

import 'components/channels_list.dart';
import 'components/status_horizontal.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StatusHorizontal(),
          Divider(color: subTitleTextColor),
          ChannelsList(),
        ],
      ),
    );
  }
}
