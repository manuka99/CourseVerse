import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/message.dart';

class ChatService {
  static final messageRef =
      FirebaseFirestore.instance.collection('messages').withConverter<Message>(
            fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
            toFirestore: (message, _) => message.toJson(),
          );

  ChatService() {}

  static Future<Iterable<Message>> getMessages(
      String userId, int messagesCount, DateTime? lastSendAt) async {
    // print(userId);
    // print(messagesCount);
    // print(lastMessageId);

    Query<Message> messagesQuery = messageRef
        .where('userID', isEqualTo: userId)
        .orderBy('sendAt', descending: true)
        .limit(messagesCount);

    if (lastSendAt != null)
      messagesQuery = messagesQuery.startAfter([lastSendAt]);

    Iterable<Message> messages = await messagesQuery
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()));

    return messages;
  }

  static Future<Message> sendMessage(Message message) async {
    Message createMSG = new Message(
        message: message.message,
        isImage: message.isImage,
        isUploaded: message.isUploaded,
        msgID: message.msgID,
        userID: message.userID,
        participant: message.participant,
        sendAt: message.sendAt,
        status: "sent");
    await messageRef.add(createMSG);
    return message;
  }

  static void deleteMessage(messageId) async {
    print('delete from db' + messageId);
    await messageRef.where('msgID', isEqualTo: messageId).get().then(
        (snapshot) => snapshot.docs.forEach((doc) => doc.reference.delete()));
  }
}
