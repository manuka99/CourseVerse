import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/models/message.dart';
import 'package:course_app/pages/chat/chat_header.dart';
import 'package:course_app/pages/chat/message_box.dart';
import 'package:course_app/pages/chat/messages_body.dart';
import 'package:course_app/pages/chat/messages_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportChat extends StatefulWidget {
  @override
  _SupportChatState createState() => _SupportChatState();
}

class _SupportChatState extends State<SupportChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [ChatHeader(), MessagesBody()],
        ),
      ),
    );
  }
}
