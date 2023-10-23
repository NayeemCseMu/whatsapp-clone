// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CallLog {
  final String personName;
  final String avatar;
  final String time;
  final String callType;
  final bool isMissed;
  final bool incoming;
  final int numberOfCall;
  CallLog({
    required this.personName,
    required this.avatar,
    required this.time,
    required this.callType,
    required this.isMissed,
    required this.incoming,
    required this.numberOfCall,
  });

  CallLog copyWith({
    String? personName,
    String? avatar,
    String? time,
    String? callType,
    bool? isMissed,
    bool? incoming,
    int? numberOfCall,
  }) {
    return CallLog(
      personName: personName ?? this.personName,
      avatar: avatar ?? this.avatar,
      time: time ?? this.time,
      callType: callType ?? this.callType,
      isMissed: isMissed ?? this.isMissed,
      incoming: incoming ?? this.incoming,
      numberOfCall: numberOfCall ?? this.numberOfCall,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'personName': personName,
      'avatar': avatar,
      'time': time,
      'callType': callType,
      'isMissed': isMissed,
      'incoming': incoming,
      'numberOfCall': numberOfCall,
    };
  }

  factory CallLog.fromMap(Map<String, dynamic> map) {
    return CallLog(
      personName: map['personName'] as String,
      avatar: map['avatar'] as String,
      time: map['time'] as String,
      callType: map['callType'] as String,
      isMissed: map['isMissed'] as bool,
      incoming: map['incoming'] as bool,
      numberOfCall: map['numberOfCall'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallLog.fromJson(String source) =>
      CallLog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallLog(personName: $personName, avatar: $avatar, time: $time, callType: $callType, isMissed: $isMissed, incoming: $incoming, numberOfCall: $numberOfCall)';
  }

  @override
  bool operator ==(covariant CallLog other) {
    if (identical(this, other)) return true;

    return other.personName == personName &&
        other.avatar == avatar &&
        other.time == time &&
        other.callType == callType &&
        other.isMissed == isMissed &&
        other.incoming == incoming &&
        other.numberOfCall == numberOfCall;
  }

  @override
  int get hashCode {
    return personName.hashCode ^
        avatar.hashCode ^
        time.hashCode ^
        callType.hashCode ^
        isMissed.hashCode ^
        incoming.hashCode ^
        numberOfCall.hashCode;
  }
}
