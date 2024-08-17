import 'dart:math';
import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/core/utils/g_pay_string.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/chat_screen/model/msg_model.dart';

const senderId = 1;
const receiverId = 2;

List<ChatModel> getChatData() {
  List<ChatModel> list = [];
  ChatModel createChat({
    required String name,
    required String img,
    required String lastMsg,
    required DateTime time,
    required int unreadCount,
    required String phoneNumber,
    required bool isActive,
  }) {
    return ChatModel(
      name: name,
      img: img,
      lastMsg: lastMsg,
      time: time,
      unreadCount: unreadCount,
      phoneNumber: phoneNumber,
      isActive: isActive,
    );
  }

  DateTime currentTime = DateTime.now();

  list.add(createChat(
    name: 'Kevin',
    img: GPayImageConstant.gpUser0,
    lastMsg: GPayStrings.loremText,
    time: currentTime,
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 79784328350',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Michael',
    img: GPayImageConstant.gpUser1,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 2)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 98434343215',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Shawn',
    img: GPayImageConstant.gpUser2,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 5)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 8343354102',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Smith',
    img: GPayImageConstant.gpUser3,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 20)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 874545453414',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Nora',
    img: GPayImageConstant.gpUser4,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 22)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 97454545413',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Devin',
    img: GPayImageConstant.gpUser5,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 26)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 73834355412',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Alexa',
    img: GPayImageConstant.gpUser6,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 30)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 76334343412',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Natasha',
    img: GPayImageConstant.gpUser7,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 31)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 97665646412',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Jason',
    img: GPayImageConstant.gpUser8,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 41)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 93434343418',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Clavin',
    img: GPayImageConstant.gpUser9,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 43)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 77863434321',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Alisha',
    img: GPayImageConstant.gpUser10,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 52)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 97867565412',
    isActive: true,
  ));

  list.add(createChat(
    name: 'Clarke',
    img: GPayImageConstant.gpUser11,
    lastMsg: GPayStrings.loremText,
    time: currentTime.subtract(const Duration(minutes: 58)),
    unreadCount: Random().nextInt(20),
    phoneNumber: '+91 99867565413',
    isActive: true,
  ));

  return list;
}

List<MessageModel> getChatMsgData() {
  List<MessageModel> list = [];

  MessageModel c1 = MessageModel();
  c1.senderId = senderId;
  c1.receiverId = receiverId;
  list.add(c1);

  MessageModel c2 = MessageModel();
  c2.senderId = receiverId;
  c2.receiverId = senderId;
  list.add(c2);

  MessageModel c3 = MessageModel();
  c3.senderId = receiverId;
  c3.receiverId = senderId;
  list.add(c3);

  return list;
}
