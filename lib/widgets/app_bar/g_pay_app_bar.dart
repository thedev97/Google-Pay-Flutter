

import 'package:g_pay/core/g_pay_export.dart';

class GPayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GPayAppBar(
      {super.key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions,
      this.width,
      this.isDefaultStyle});

  final double? height;
  final double? width;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? isDefaultStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 70.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: isDefaultStyle == true ? _getDefaultStyle() : _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 20,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(width ?? 70.0, height ?? 70.0);

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 70,
          width: double.maxFinite,
          decoration: GPayDecoration.appBarDecoration,
        );
      default:
        return null;
    }
  }

  Widget? _getDefaultStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 0,
          width: double.maxFinite,
          decoration: GPayDecoration.normalDecoration,
        );
      default:
        return null;
    }
  }
}

enum Style { bgFill }
