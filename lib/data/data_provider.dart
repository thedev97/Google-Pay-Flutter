import 'dart:math';
import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/core/utils/g_pay_string.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/chat_screen/model/msg_model.dart';

const senderId = 1;
const receiverId = 2;

List<ChatModel> getChatData() {
  List<ChatModel> list = [];

  // Helper function to create GPChatModel
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
    // Set to current time or adjust as needed
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

// Helper function to create GPMessageModel
List<MessageModel> getChatMsgData() {
  List<MessageModel> list = [];

  MessageModel c1 = MessageModel();
  c1.senderId = senderId;
  c1.receiverId = receiverId;
  c1.msg = 'Hi';
  c1.time = '11:30 AM';
  list.add(c1);

  MessageModel c2 = MessageModel();
  c2.senderId = senderId;
  c2.receiverId = receiverId;
  c2.msg = 'Hello';
  c2.time = '11:30 AM';
  list.add(c2);

  MessageModel c3 = MessageModel();
  c3.senderId = receiverId;
  c3.receiverId = senderId;
  c3.msg = 'How are you?';
  c3.time = '11:30 AM';
  list.add(c3);

  MessageModel c4 = MessageModel();
  c4.senderId = senderId;
  c4.receiverId = receiverId;
  c4.msg = 'I am good. Good to hear';
  c4.time = '11:31 AM';
  list.add(c4);

  MessageModel c5 = MessageModel();
  c5.senderId = senderId;
  c5.receiverId = receiverId;
  c5.msg = 'I am good. I need your help.';
  c5.time = '11:31 AM';
  list.add(c5);

  MessageModel c6 = MessageModel();
  c6.senderId = receiverId;
  c6.receiverId = senderId;
  c6.msg = 'I am good.I need your help.';
  c6.time = '11:31 AM';
  list.add(c6);

  MessageModel c7 = MessageModel();
  c7.senderId = senderId;
  c7.receiverId = receiverId;
  c7.msg = 'I am good. I need your help.';
  c7.time = '11:31 AM';
  list.add(c7);

  MessageModel c8 = MessageModel();
  c8.senderId = receiverId;
  c8.receiverId = senderId;
  c8.msg = 'I am good. I need your help.';
  c8.time = '11:31 AM';
  list.add(c8);

  MessageModel c9 = MessageModel();
  c9.senderId = senderId;
  c9.receiverId = receiverId;
  c9.msg = 'I am good. I need your help.';
  c9.time = '11:31 AM';
  list.add(c9);

  MessageModel c10 = MessageModel();
  c10.senderId = receiverId;
  c10.receiverId = senderId;
  c10.msg = 'I am good. I need your help.';
  c10.time = '11:32 AM';
  list.add(c10);

  MessageModel c11 = MessageModel();
  c11.senderId = receiverId;
  c11.receiverId = senderId;
  c11.msg = 'I am good.I need your help.';
  c11.time = '11:31 AM';
  list.add(c11);

  MessageModel c12 = MessageModel();
  c12.senderId = senderId;
  c12.receiverId = receiverId;
  c12.msg = 'I am good. I need your help.';
  c12.time = '11:32 AM';
  list.add(c12);

  MessageModel c13 = MessageModel();
  c13.senderId = senderId;
  c13.receiverId = receiverId;
  c13.msg = 'I am good. Can you do something for me?.';
  c13.time = '11:32 AM';
  list.add(c13);

  MessageModel c14 = MessageModel();
  c14.senderId = receiverId;
  c14.receiverId = senderId;
  c14.msg = 'I am good.I need your help.';
  c14.time = '11:32 AM';
  list.add(c14);

  MessageModel c15 = MessageModel();
  c15.senderId = senderId;
  c15.receiverId = receiverId;
  c15.msg = 'I am good.I need your help.';
  c15.time = '11:32 AM';
  list.add(c15);

  MessageModel c16 = MessageModel();
  c16.senderId = receiverId;
  c16.receiverId = senderId;
  c16.msg = 'I am good.';
  c16.time = '10:32 AM';
  list.add(c16);

  MessageModel c17 = MessageModel();
  c17.senderId = senderId;
  c17.receiverId = receiverId;
  c17.msg = 'I am good.';
  c17.time = '10:32 AM';
  list.add(c17);

  MessageModel c18 = MessageModel();
  c18.senderId = receiverId;
  c18.receiverId = senderId;
  c18.msg = 'Can you do something for me?';
  c18.time = '10:30 AM';
  list.add(c18);

  return list;
}

