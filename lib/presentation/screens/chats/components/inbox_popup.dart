import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class InboxPopup extends StatelessWidget {
  const InboxPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      offset: Offset(0, 50),
      color: scaffoldBgColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.zero,
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: Text("View contact"),
          ),
          PopupMenuItem(
            child: Text("Media, links, and docs"),
          ),
          PopupMenuItem(
            child: Text("Search"),
          ),
          PopupMenuItem(
            child: Text("Disappearing messages"),
          ),
          PopupMenuItem(
            child: Text("Wallpapers"),
          ),
          PopupMenuItem(
            child: Text("More"),
          ),
        ];
      },
    );
  }
}
