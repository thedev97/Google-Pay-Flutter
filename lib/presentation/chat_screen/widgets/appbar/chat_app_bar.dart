import 'package:flutter/material.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/theme/theme_helper.dart';
import 'package:g_pay/widgets/extension.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? screenName;
  final ChatModel userData;
  final String contactUser;
  final String contactPhone;
  final String personImg;

  const ChatAppBar({
    super.key,
    required this.screenName,
    required this.userData,
    required this.contactUser,
    required this.contactPhone,
    required this.personImg,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ChatAppBarState createState() => ChatAppBarState();
}

class ChatAppBarState extends State<ChatAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: const Color(0xff071e31),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => context.pop(),
      ),
      title: Row(
        children: [
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.bottomRight,
            children: <Widget>[
              widget.screenName == "ContactList"
                  ? CircleAvatar(
                      backgroundImage: AssetImage(widget.personImg),
                      radius: 22,
                    ).borderContainer()
                  : CircleAvatar(
                      backgroundImage: AssetImage(widget.userData.img ?? ''),
                      radius: 22,
                    ).borderContainer(),
            ],
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.screenName == "ContactList"
                  ? Text(widget.contactUser, style: theme.textTheme.titleMedium)
                  : Text(widget.userData.name ?? '',
                      style: theme.textTheme.titleMedium),
              widget.screenName == "ContactList"
                  ? Text(widget.contactPhone,
                      style: theme.textTheme.titleSmall?.copyWith(fontSize: 14))
                  : Text(widget.userData.phoneNumber ?? '',
                      style:
                          theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.call,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
          color:  const Color(0xff071e31),
          onSelected: (dynamic v) {
            toast('Click');
            hideKeyboard(context);
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 1,
                child: Text("Start new group",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Bloc this person",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Turn off messaging",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Report user",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Refresh",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Get help",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Send feedback",
                    style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
              ),
            ];
          },
        ),
      ],
    );
  }
}
