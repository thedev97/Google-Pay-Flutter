import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/presentation/chat_screen/chat.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/widgets/extension.dart';

class HomeListWidget extends StatefulWidget {
  final List<ChatModel>? getPeopleList;

  const HomeListWidget({super.key, this.getPeopleList});

  @override
  HomeListWidgetState createState() => HomeListWidgetState();
}

class HomeListWidgetState extends State<HomeListWidget> {
  int lengths = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: lengths > 11 ? 12 : lengths,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
      itemBuilder: (context, index) {
        ChatModel mData =
            widget.getPeopleList![index % widget.getPeopleList!.length];
        return Column(
          children: [
            CircleAvatar(
                    radius: 30,
                    backgroundColor: black,
                    backgroundImage:
                        AssetImage(mData.img.toString().validate()))
                .borderContainer(),
            5.height,
            Text(mData.name ?? '', style: theme.textTheme.titleSmall),
          ],
        ).onTap(() {
          ChatScreen(userData: mData,).launch(context);
        });
      },
    );
  }
}
