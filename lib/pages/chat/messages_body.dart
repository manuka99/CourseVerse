import 'dart:io';

import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/models/message.dart';
import 'package:course_app/pages/chat/message_box.dart';
import 'package:course_app/services/chat_service.dart';
import 'package:course_app/services/cloud_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MessagesBody extends StatefulWidget {
  const MessagesBody({Key? key}) : super(key: key);

  @override
  _MessagesBodyState createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
  late ScrollController controller;
  bool meSent = false;
  int _loadingOffset = 10;
  bool _loading = false;
  late Message newMessage;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isEndOfMessages = false;

  List<Message> messages = [];
  List<Message> initialMessages = [
    Message(
        message: "We provide 24/7 live support for all users free of charge.",
        msgID: "2",
        userID: '',
        participant: "supportTeam",
        isImage: false,
        isUploaded: false,
        sendAt: DateTime.now(),
        status: 'sent'),
    Message(
        message: "Do you have any problem?",
        msgID: "2",
        userID: '',
        participant: "supportTeam",
        isImage: false,
        isUploaded: false,
        sendAt: DateTime.now(),
        status: 'sent'),
    Message(
        message: "How can I help you?",
        msgID: "2",
        userID: '',
        participant: "supportTeam",
        isImage: false,
        isUploaded: false,
        sendAt: DateTime.now(),
        status: 'sent'),
    Message(
        message: "Welcome to Doctor Nest 🙏❤",
        msgID: "1",
        userID: '',
        participant: "supportTeam",
        isImage: false,
        isUploaded: false,
        sendAt: DateTime.now(),
        status: 'sent'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
    Future.delayed(Duration(milliseconds: 2000), () async {
      loadMessages();
    });
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            // padding: EdgeInsets.only(top: 4),
            child: Container(
              alignment: Alignment.topLeft,
              child: ListView.builder(
                  controller: controller,
                  itemCount: isEndOfMessages
                      ? messages.length + 1 + initialMessages.length
                      : messages.length + 1,
                  reverse: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return getMessage(context, index);
                  }),
            ),
          )),
          MessageBox(
            sendMessage: sendMessage,
          )
        ],
      ),
    );
  }

  void _scrollListener() async {
    var max = controller.position.maxScrollExtent;
    var offset = controller.offset;

    // print(max - offset);

    // we have reached at the top of the list, we should make _loading = true
    if (max - offset < _loadingOffset && !_loading) loadMessages();
  }

  void loadMessages() async {
    setState(() {
      _loading = true;
    });
    try {
      Iterable<Message> msgs = await ChatService.getMessages(
          _auth.currentUser!.uid,
          _loadingOffset,
          messages.length > 0 ? messages.last.sendAt : null);
      messages.addAll(msgs);

      if (msgs.length < _loadingOffset) isEndOfMessages = true;
    } catch (err) {
      print('Error: ' + err.toString());
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void sendMessage(msgTxt, isImage) async {
    print('sending message');
    String newMsgID = Uuid().v1().replaceAll("-", "");
    print("newMsgID");
    print(newMsgID);
    Message newMessage = new Message(
        message: msgTxt,
        msgID: newMsgID,
        isImage: isImage,
        isUploaded: false,
        userID: _auth.currentUser!.uid,
        participant: 'from',
        sendAt: DateTime.now(),
        status: 'unsent');

    setState(() {
      messages = [newMessage, ...messages];
    });

    if (isImage) {
      //  upload image
      await CloudStorageService().uploadImage(msgTxt, newMsgID).then((url) {
        Iterable<Message> result =
            messages.where((message) => (url.contains(message.msgID)));
        if (result.isNotEmpty) {
          Message msg = result.first;
          msg.message = url;
          msg.isUploaded = true;
          setState(() {
            result.first.message = url;
            result.first.isUploaded = true;
          });
          saveMessageInDB(msg);
        }
      });
    } else
      saveMessageInDB(newMessage);
  }

  void saveMessageInDB(newMessage) {
    //database
    ChatService.sendMessage(newMessage).then((msg) async {
      Iterable<Message> result =
          messages.where((message) => (message.msgID == msg.msgID));
      await Future.delayed(Duration(seconds: 2));
      if (result.isNotEmpty)
        setState(() {
          result.first.status = " sent";
        });
    }).catchError((err) => print(err.toString()));
  }

  void deleteMessage(String msgID) {
    int resultIndex =
        messages.indexWhere((message) => (message.msgID == msgID));
    if (resultIndex >= 0) {
      setState(() {
        messages.removeAt(resultIndex);
      });
      ChatService.deleteMessage(msgID);
    }
  }

  Widget getMessage(BuildContext context, int index) {
    if ((isEndOfMessages &&
            index == messages.length + initialMessages.length) ||
        !isEndOfMessages && index == messages.length) {
      print('loading status: ' + this._loading.toString());
      return this._loading
          ? Align(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    color: CustomColors.app_primary,
                  )),
            )
          : Container();
    }

    print('get message of index: ' + index.toString());
    print('messages length: ' + messages.length.toString());

    Message message;
    if (index < messages.length)
      message = messages[index];
    else
      message = initialMessages[index - messages.length];
    var previousMSentValue = meSent;
    if (message.participant == 'from') {
      meSent = true;
      return Align(
        key: Key(message.msgID),
        alignment: Alignment.topRight,
        child: Container(
          constraints: new BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.only(
              top: 8,
              right: 10,
              bottom: index == 0
                  ? 28
                  : previousMSentValue
                      ? 0
                      : 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14)),
              color: CustomColors.bg_grey),
          child: InkWell(
              onLongPress: () => deleteMSGAlertDialog(context, message.msgID),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: !message.isImage
                        ? Text(
                            message.message,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          )
                        : message.isUploaded
                            ? Image.network(message.message)
                            : Image.file(new File(message.message)),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: Wrap(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: message.getFormattedSentDate(),
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              WidgetSpan(
                                  child: Container(
                                margin: const EdgeInsets.only(left: 6),
                                child: Icon(
                                  message.status == "unsent"
                                      ? Icons.timelapse_sharp
                                      : Icons.done_all_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
    } else {
      meSent = false;
      return Align(
        key: Key(message.msgID),
        alignment: Alignment.topLeft,
        child: Container(
            constraints: new BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(
                top: 8,
                left: 10,
                bottom: index == 0
                    ? 28
                    : previousMSentValue
                        ? 8
                        : 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                    bottomRight: Radius.circular(14)),
                color: CustomColors.app_primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: !message.isImage
                      ? Text(message.message,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                          ))
                      : Image.network(message.message),
                ),
                SizedBox(height: 8),
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Container(
                          margin: const EdgeInsets.only(right: 6),
                          child: Icon(
                            message.status == "unsent"
                                ? Icons.timelapse_sharp
                                : Icons.done_all_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                        )),
                        TextSpan(
                          text: message.userID == ''
                              ? 'Seen - TeamDN'
                              : message.getFormattedSentDate(),
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
    }
  }

  deleteMSGAlertDialog(BuildContext context, String message_id) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Confirm",
        style: TextStyle(
            fontFamily: "Poppins", fontSize: 14, color: Colors.redAccent),
      ),
      onPressed: () {
        deleteMessage(message_id);
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Delete Message",
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: CustomColors.blackDark1TextColor),
      ),
      content: Text(
        "Are you sure you want to delete this message?",
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: CustomColors.blackDark1TextColor),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
