import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  WebSocket? _socket;

  factory ChatWebService() => _instance;

  ChatWebService._internal();
  final _SearchResultController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _ContentController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _SearchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _ContentController.stream;
  void connect() {
    _socket = WebSocket(Uri.parse("ws://localhost:8000/ws/chat"));

    _socket!.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_result') {
        _SearchResultController.add(data);
      } else if (data['type'] == 'content') {
        _ContentController.add(data);
      }
    });
  }

  void chat(String query) {
    _socket!.send(json.encode({'query': query}));
  }
}
