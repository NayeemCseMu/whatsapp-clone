import 'package:whatsapp_clone/data/model/channel_news_model.dart';
import 'package:whatsapp_clone/utils/k_images.dart';

import 'model/call_log_model.dart';
import 'model/chats_model.dart';
import 'model/participants_chat_model.dart';

class KDummyData {
  static List<Participant> chatsList = [
    Participant(
        id: 1,
        avatar: KImages.chatAvatar1,
        name: "Martin Troff",
        lastMessage: "Let's meet",
        messageFrom: "user",
        isImage: false,
        seen: true,
        delivered: true,
        unread: 7,
        sent: true,
        date: DateTime.now().toString()),
    Participant(
        id: 2,
        avatar: KImages.chatAvatar2,
        name: "Yes that's correct",
        lastMessage: "Let's meet",
        messageFrom: "sender",
        isImage: false,
        seen: true,
        delivered: true,
        sent: true,
        unread: 0,
        date: DateTime.now().toString()),
    Participant(
        id: 3,
        avatar: KImages.chatAvatar3,
        name: "Carla Korsgaard",
        lastMessage: "How are you today?",
        messageFrom: "sender",
        seen: true,
        delivered: true,
        sent: true,
        unread: 0,
        date: DateTime.now().toString(),
        isImage: false),
    Participant(
        id: 4,
        avatar: KImages.chatAvatar4,
        name: "Zaire Passaquindici",
        lastMessage: "Sorry, I couldn't attend your party",
        messageFrom: "sender",
        seen: true,
        delivered: true,
        sent: true,
        unread: 3,
        date: DateTime.now().toString(),
        isImage: false),
    Participant(
        id: 5,
        avatar: KImages.chatAvatar5,
        name: "Terry Dokidis",
        lastMessage: "Hey! are you available?",
        messageFrom: "user",
        seen: false,
        delivered: false,
        sent: true,
        unread: 0,
        date: DateTime.now().toString(),
        isImage: false),
    Participant(
        id: 6,
        avatar: KImages.chatAvatar6,
        name: "Philip Westervelt",
        lastMessage: "That's right",
        messageFrom: "sender",
        seen: true,
        delivered: true,
        sent: true,
        unread: 0,
        date: DateTime.now().toString(),
        isImage: false),
    Participant(
        id: 7,
        avatar: KImages.chatAvatar7,
        name: "Alfanso Rhifel",
        lastMessage: "Could you please fix this?",
        messageFrom: "sender",
        seen: true,
        delivered: true,
        sent: true,
        unread: 0,
        date: DateTime.now().toString(),
        isImage: false),
  ];

  static List<Map<String, String>> storyList = [
    {
      "user": "Martin Luther",
      "avatar": KImages.chatAvatar1,
    },
    {
      "user": "Carla Korsgaard",
      "avatar": KImages.chatAvatar3,
    },
    {
      "user": "Philip Westervelt",
      "avatar": KImages.chatAvatar6,
    }
  ];

  static ParticipantsChat participantsChat = ParticipantsChat(
      id: 1,
      participant: "Martin Luther",
      avatar: KImages.chatAvatar1,
      status: "Online",
      contact: "01712312312",
      messages: <Messages>[
        Messages(
          id: 1,
          message: "Hi",
          sender: "participant",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        Messages(
          id: 2,
          message: "Hello",
          sender: "user",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        Messages(
          id: 3,
          message: "How are you?",
          sender: "user",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        Messages(
          id: 4,
          message: "I'm absolutely fine, what about you?",
          sender: "participant",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        Messages(
          id: 5,
          message: "Everything is going well",
          sender: "user",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        Messages(
          id: 6,
          message: "Have you done your assignments?",
          sender: "participant",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        Messages(
          id: 7,
          message: "No! not yet",
          sender: "user",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
      ]);

  static List<ChannelNews> channelNews = [
    ChannelNews(
      channelName: "The New York Times",
      avatar: KImages.newYorkTimes,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
    ChannelNews(
      channelName: "Al Jazeera",
      avatar: KImages.alJazeera,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
    ChannelNews(
      channelName: "Mark Zuckerberg",
      avatar: KImages.markZuck,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
    ChannelNews(
      channelName: "BBC News",
      avatar: KImages.bbc,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
  ];

  static List<CallLog> callHistory = [
    CallLog(
      personName: "Martin Loe",
      avatar: KImages.chatAvatar1,
      time: "Today, 11:30 AM",
      callType: "Video",
      isMissed: false,
      incoming: false,
      numberOfCall: 2,
    ),
    CallLog(
        personName: "Carla Korsgaard",
        avatar: KImages.chatAvatar1,
        time: "Yesterday, 8:47 PM",
        callType: "video",
        isMissed: true,
        incoming: true,
        numberOfCall: 2),
    CallLog(
        personName: "John Doe",
        avatar: KImages.chatAvatar1,
        time: "Yesterday, 8:47 PM",
        callType: "audio",
        isMissed: false,
        incoming: true,
        numberOfCall: 2),
  ];

  static List<Map<String, String>> contacts = [
    {"user": "Martin Luther", "avatar": KImages.chatAvatar1, "status": "Busy"},
    {
      "user": "Bill Gates",
      "avatar": KImages.chatAvatar2,
      "status": "At school"
    },
    {
      "user": "Elon Mask",
      "avatar": KImages.chatAvatar3,
      "status": "Call me later"
    },
    {
      "user": "Tom Cruise",
      "avatar": KImages.chatAvatar4,
      "status": "I'm in a meeting"
    },
    {
      "user": "Barak Obama",
      "avatar": KImages.chatAvatar5,
      "status": "Available"
    },
    {"user": "Brandan M", "avatar": KImages.chatAvatar6, "status": "At gym"},
  ];
}
