import 'dart:convert';
import 'dart:io';

class FcmPayload {
  final String title;

  final String body;

  final String activity;

  final Map<String, dynamic> data;

  bool get isDataMessage => title == null && body == null;

  FcmPayload({this.title, this.body, this.activity, this.data});

  factory FcmPayload.create(Map<String, dynamic> message) {
    String title;
    String body;
    String activity;
    Map<String, dynamic> data;

    if (Platform.isAndroid) {
      if (message.containsKey("notification")) {
        final notificationPayload = Map<String, dynamic>.from(message["notification"] as Map);
        title = notificationPayload["title"] as String;
        body = notificationPayload["body"] as String;
      }
      if (message.containsKey("data")) {
        data = Map<String, dynamic>.from(message["data"] as Map);
        activity = data["activity"] as String;
      }
    } else {
      if (message.containsKey("aps")) {
        final aps = Map<String, dynamic>.from(message["aps"] as Map);
        if (aps.containsKey("alert")) {
          final alert = Map<String, dynamic>.from(aps["alert"] as Map);
          title = alert["title"] as String;
          body = alert["body"] as String;
        }
      }
      if (message.containsKey("data")) {
        data = Map<String, dynamic>.from(json.decode(message["data"] as String) as Map<String, dynamic>);
        activity = data["activity"] as String;
      }
    }

    return FcmPayload(
      title: title,
      body: body,
      activity: activity,
      data: data,
    );
  }

  factory FcmPayload.fromJson(String json) {
    try {
      final parsed = jsonDecode(json) as Map<String, dynamic>;
      return FcmPayload(
        title: parsed["title"] as String,
        body: parsed["body"] as String,
        activity: parsed["activity"] as String,
        data: parsed["data"] as Map<String, dynamic>,
      );
    } on FormatException {
      throw FormatException("Invalid Json: $json");
    }
  }

  String toJson() => jsonEncode({
        "title": title,
        "body": body,
        "activity": activity,
        "data": data,
      });
}
