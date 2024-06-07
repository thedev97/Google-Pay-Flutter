class GPPeopleModel {
  var userImg;
  var userName;

  GPPeopleModel(this.userImg, this.userName);
}

class GPBusinessTypeModel {
  var businessImg;
  var businessName;

  GPBusinessTypeModel(this.businessImg, this.businessName);
}

class GPChatModel {
  var name;
  var img;
  var lastMsg;
  var time;
  int? unreadCount;
  var phoneNumber;
  bool? isActive;

  GPChatModel({this.name, this.img, this.lastMsg, this.time, this.unreadCount, this.phoneNumber, this.isActive});
}

