// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ParticipantsChat {
  final int id;
  final String participant;
  final String avatar;
  final String status;
  final String contact;
  final List<Messages> messages;
  ParticipantsChat({
    required this.id,
    required this.participant,
    required this.avatar,
    required this.status,
    required this.contact,
    required this.messages,
  });

  ParticipantsChat copyWith({
    int? id,
    String? participant,
    String? avatar,
    String? status,
    String? contact,
    List<Messages>? messages,
  }) {
    return ParticipantsChat(
      id: id ?? this.id,
      participant: participant ?? this.participant,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      contact: contact ?? this.contact,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'participant': participant,
      'avatar': avatar,
      'status': status,
      'contact': contact,
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory ParticipantsChat.fromMap(Map<String, dynamic> map) {
    return ParticipantsChat(
      id: map['id'] as int,
      participant: map['participant'] as String,
      avatar: map['avatar'] as String,
      status: map['status'] as String,
      contact: map['contact'] as String,
      messages: List<Messages>.from(
        (map['messages'] as List<int>).map<Messages>(
          (x) => Messages.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantsChat.fromJson(String source) =>
      ParticipantsChat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParticipantsChat(id: $id, participant: $participant, avatar: $avatar, status: $status, contact: $contact, messages: $messages)';
  }

  @override
  bool operator ==(covariant ParticipantsChat other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.participant == participant &&
        other.avatar == avatar &&
        other.status == status &&
        other.contact == contact &&
        listEquals(other.messages, messages);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        participant.hashCode ^
        avatar.hashCode ^
        status.hashCode ^
        contact.hashCode ^
        messages.hashCode;
  }
}

class Messages {
  final int id;
  final String message;
  final String sender;
  final DateTime date;
  final bool seen;
  final bool delivered;
  final bool sent;
  final String? image;
  final String? video;
  Messages({
    required this.id,
    required this.message,
    required this.sender,
    required this.date,
    required this.seen,
    required this.delivered,
    required this.sent,
    this.image,
    this.video,
  });

  Messages copyWith({
    int? id,
    String? message,
    String? sender,
    DateTime? date,
    bool? seen,
    bool? delivered,
    bool? sent,
    String? image,
    String? video,
  }) {
    return Messages(
      id: id ?? this.id,
      message: message ?? this.message,
      sender: sender ?? this.sender,
      date: date ?? this.date,
      seen: seen ?? this.seen,
      delivered: delivered ?? this.delivered,
      sent: sent ?? this.sent,
      image: image ?? this.image,
      video: video ?? this.video,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'sender': sender,
      'date': date.millisecondsSinceEpoch,
      'seen': seen,
      'delivered': delivered,
      'sent': sent,
      'image': image,
      'video': video,
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      id: map['id'] as int,
      message: map['message'] as String,
      sender: map['sender'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      seen: map['seen'] as bool,
      delivered: map['delivered'] as bool,
      sent: map['sent'] as bool,
      image: map['image'] != null ? map['image'] as String : null,
      video: map['video'] != null ? map['video'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Messages.fromJson(String source) =>
      Messages.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Messags(id: $id, message: $message, sender: $sender, date: $date, seen: $seen, delivered: $delivered, sent: $sent, image: $image, video: $video)';
  }

  @override
  bool operator ==(covariant Messages other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.message == message &&
        other.sender == sender &&
        other.date == date &&
        other.seen == seen &&
        other.delivered == delivered &&
        other.sent == sent &&
        other.image == image &&
        other.video == video;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        message.hashCode ^
        sender.hashCode ^
        date.hashCode ^
        seen.hashCode ^
        delivered.hashCode ^
        sent.hashCode ^
        image.hashCode ^
        video.hashCode;
  }
}
