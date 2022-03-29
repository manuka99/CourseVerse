import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/models/message.dart';
import 'package:course_app/pages/chat/message_hints.dart';
import 'package:course_app/services/cloud_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';

class MessageBox extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  late void Function(String, bool) sendMessage;
  var messageController = TextEditingController();

  MessageBox({required this.sendMessage});

  onHintSelected(String hint) {
    messageController.text += hint;
  }

  onSendMessage(BuildContext context) {
    if (messageController.text.isNotEmpty) {
      sendMessage(messageController.text, false);
      messageController.text = "";
    }
    // FocusScope.of(context).requestFocus(FocusNode());
  }

  openImageSelector() async {
    // List<ImageSource> imageSources = [ImageSource.camera, ImageSource.gallery];
    final List<XFile>? images = await _picker.pickMultiImage();
    images!.forEach((image) => sendMessage(image.path, true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          MessageHints(onHintSelected),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  openImageSelector();
                },
                color: Colors.white,
                textColor: Colors.white,
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 28,
                  color: CustomColors.icon3,
                ),
                padding: EdgeInsets.all(12),
                shape: CircleBorder(),
              ),
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          minLines: 1,
                          maxLines: 4,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          controller: messageController,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 14),
                            hintText: 'Type a message',
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 0 * math.pi / 180,
                        child: IconButton(
                          onPressed: () {
                            onSendMessage(context);
                          },
                          icon: Icon(
                            Icons.send,
                            size: 22,
                            color: CustomColors.icon3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 14),
            ],
          )
        ],
      ),
    );
  }
}
