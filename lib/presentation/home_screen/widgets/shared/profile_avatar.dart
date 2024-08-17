import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/widgets/extension.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onTap;

  const ProfileAvatar({super.key, required this.imageAsset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'profile',
      child: CircleAvatar(
        backgroundImage: AssetImage(imageAsset),
        radius: 18,
      ).borderContainer(),
    ).paddingLeft(15).onTap(onTap);
  }
}
