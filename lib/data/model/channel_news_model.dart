// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChannelNews {
  final String channelName;
  final String avatar;
  final String news;
  final bool isImageAttached;
  final String? newImage;
  final String date;
  final String? unread;
  ChannelNews({
    required this.channelName,
    required this.avatar,
    required this.news,
    required this.isImageAttached,
    this.newImage,
    required this.date,
    this.unread,
  });

  ChannelNews copyWith({
    String? channelName,
    String? avatar,
    String? news,
    bool? isImageAttached,
    String? newImage,
    String? date,
    String? unread,
  }) {
    return ChannelNews(
      channelName: channelName ?? this.channelName,
      avatar: avatar ?? this.avatar,
      news: news ?? this.news,
      isImageAttached: isImageAttached ?? this.isImageAttached,
      newImage: newImage ?? this.newImage,
      date: date ?? this.date,
      unread: unread ?? this.unread,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channelName': channelName,
      'avatar': avatar,
      'news': news,
      'isImageAttached': isImageAttached,
      'newImage': newImage,
      'date': date,
      'unread': unread,
    };
  }

  factory ChannelNews.fromMap(Map<String, dynamic> map) {
    return ChannelNews(
      channelName: map['channelName'] as String,
      avatar: map['avatar'] as String,
      news: map['news'] as String,
      isImageAttached: map['isImageAttached'] as bool,
      newImage: map['newImage'] != null ? map['newImage'] as String : null,
      date: map['date'] as String,
      unread: map['unread'] != null ? map['unread'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelNews.fromJson(String source) =>
      ChannelNews.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChannelNews(channelName: $channelName, avatar: $avatar, news: $news, isImageAttached: $isImageAttached, newImage: $newImage, date: $date, unread: $unread)';
  }

  @override
  bool operator ==(covariant ChannelNews other) {
    if (identical(this, other)) return true;

    return other.channelName == channelName &&
        other.avatar == avatar &&
        other.news == news &&
        other.isImageAttached == isImageAttached &&
        other.newImage == newImage &&
        other.date == date &&
        other.unread == unread;
  }

  @override
  int get hashCode {
    return channelName.hashCode ^
        avatar.hashCode ^
        news.hashCode ^
        isImageAttached.hashCode ^
        newImage.hashCode ^
        date.hashCode ^
        unread.hashCode;
  }
}
