class ChatModel {
  final String? name;
  final String? img;
  final String? lastMsg;
  final DateTime? time;
  final int? unreadCount;
  final String? phoneNumber;
  final bool? isActive;

  ChatModel({
    this.name,
    this.img,
    this.lastMsg,
    this.time,
    this.unreadCount,
    this.phoneNumber,
    this.isActive,
  });
}