import 'dart:convert';

abstract class Message {}

class NameResult extends Message {
  bool success = false;
  String name;
  String id;
  String message;

  NameResult({this.name, this.id, this.success: true, this.message});

  String toString() {
    Map result = {};
    if (success) {
      result = {
        'id': id,
        'nameResult': {'success': true, 'name': name}
      };
    } else {
      result = {
        'id': id,
        'nameResult': {'success': false, 'message': message}
      };
    }
    return JSON.encode(result);
  }
}

class RoomResult extends Message {
  bool success = false;
  String room;
  String id;
  String message;

  RoomResult({this.room, this.id, this.success: true, this.message});

  String toString() {
    Map result = {};
    if (success) {
      result = {
        'id': id,
        'roomResult': {'success': true, 'room': room}
      };
    } else {
      result = {
        'id': id,
        'roomResult': {'success': false, 'message': message}
      };
    }
    return JSON.encode(result);
  }
}

class ChatMessage extends Message {
  String room;
  String text;

  ChatMessage(this.room, this.text);

  String toString() {
    Map result = {
      'message': {'room': room, 'text': text}
    };
    return JSON.encode(result);
  }
}
