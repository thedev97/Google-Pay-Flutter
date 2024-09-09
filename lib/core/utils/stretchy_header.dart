import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:g_pay/core/utils/g_pay_string.dart';
import 'package:nb_utils/nb_utils.dart';

enum HighlightHeaderAlignment {
  bottom,
  center,
  top,
}

class StretchyHeader extends StretchyHeaderBase {
  @Deprecated('Use StretchyHeader.singleChild instead. If body contains ListView, use StretchyHeader.listView or StretchyHeader.listViewBuilder.')
  factory StretchyHeader({
    Key? key,
    required Widget header,
    required double headerHeight,
    required Widget body,

    ///Body Widget that will appear below the header
    Widget? highlightHeader,
    bool blurContent = true,
    HighlightHeaderAlignment highlightHeaderAlignment = HighlightHeaderAlignment.bottom,
    Color? blurColor,
    Color? backgroundColor,
  }) {
    return StretchyHeader.singleChild(
      key: key,
      headerData: HeaderData(
        header: header,
        headerHeight: headerHeight,
        highlightHeader: highlightHeader,
        blurContent: blurContent,
        highlightHeaderAlignment: highlightHeaderAlignment,
        blurColor: blurColor,
        backgroundColor: backgroundColor,
      ),
      child: AbsorbPointer(child: body),
    );
  }

  StretchyHeader.singleChild({
    super.key,
    required super.headerData,
    required Widget child,
    super.displacement,
    super.onRefresh,
  })  : super(
          listBuilder: (context, controller, padding, physics, topWidget) {
            return ListView(
              controller: controller,
              padding: EdgeInsets.zero,
              physics: physics,
              children: <Widget>[
                topWidget,
                child,
              ],
            );
          },
        );

  StretchyHeader.listView({
    super.key,
    required super.headerData,
    required List<Widget> children,
    super.displacement,
    super.onRefresh,
  })  : super(
          listBuilder: (context, controller, padding, physics, topWidget) {
            return ListView(
              controller: controller,
              padding: EdgeInsets.zero,
              physics: physics,
              children: <Widget>[topWidget].followedBy(children).toList(),
            );
          },
        );

  StretchyHeader.listViewBuilder({
    super.key,
    required super.headerData,
    required IndexedWidgetBuilder itemBuilder,
    super.displacement,
    super.onRefresh,
    int? itemCount,
  })  : super(
          listBuilder: (context, controller, padding, physics, topWidget) {
            return ListView.builder(
              controller: controller,
              padding: EdgeInsets.zero,
              physics: physics,
              itemCount: itemCount == null ? null : itemCount + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return topWidget;
                }
                return itemBuilder(context, index - 1);
              },
            );
          },
        );
}

@immutable
class HeaderData {
  ///Header Widget that will be stretched, it will appear at the top of the page
  final Widget header;

  ///Height of your header widget
  final double headerHeight;

  ///highlight header that will be placed on the header,  this widget always be visible without blurring effect
  final Widget? highlightHeader;

  ///alignment for the highlight header
  final HighlightHeaderAlignment highlightHeaderAlignment;

  ///This widget will be placed on top the header container.
  ///Can be used to add clickable items to the header bottom
  ///which doesn't prevent it from scrolling.
  ///
  ///For example:
  ///overlay: Align(
  //  alignment: Alignment.bottomRight,
  //  child: Material(
  //    color: Colors.transparent,
  //    child: InkResponse(
  //      onTap: () {
  //        Scaffold.of(context).showSnackBar(
  //          SnackBar(
  //            content: Text('onTap'),
  //          ),
  //        );
  //      },
  //      child: Padding(
  //        padding: EdgeInsets.all(12),
  //        child: Icon(
  //          Icons.fullscreen,
  //          color: Colors.white,
  //        ),
  //      ),
  //    ),
  //  ),
  //)
  final Widget? overlay;

  ///The color of the blur, white by default
  final Color? blurColor;

  ///Background Color of all of the content
  final Color? backgroundColor;

  ///If you want to blur the content when scroll. True by default
  final bool blurContent;

  const HeaderData({
    required this.header,
    required this.headerHeight,
    this.highlightHeader,
    this.blurContent = true,
    this.highlightHeaderAlignment = HighlightHeaderAlignment.bottom,
    this.overlay,
    this.blurColor,
    this.backgroundColor,
  })  : assert(headerHeight >= 0.0);
}

class StretchyHeaderBase extends StatefulWidget {
  ///Header parameters describing how the header will be displayed
  final HeaderData headerData;

  ///This function should build a ListView
  ///passing to it provided controller, padding, physics
  ///and make provided topWidget its first child
  final HeaderListViewBuilder listBuilder;

  /// The distance from the child's top or bottom edge to where the refresh
  /// indicator will settle. During the drag that exposes the refresh indicator,
  /// its actual displacement may significantly exceed this value.
  final double displacement;

  /// A function that's called when the user has dragged the stretch header
  /// far enough to demonstrate that they want the app to refresh.
  final VoidCallback? onRefresh;

  const StretchyHeaderBase({
    super.key,
    required this.headerData,
    required this.listBuilder,
    double? displacement,
    this.onRefresh,
  })  : displacement = displacement ?? 40.0;

  @override
  StretchyHeaderBaseState createState() => StretchyHeaderBaseState();
}

typedef HeaderListViewBuilder = ListView Function(
  BuildContext context,
  ScrollController? controller,
  EdgeInsets padding,
  ScrollPhysics physics,
  Widget topWidget,
);

class StretchyHeaderBaseState extends State<StretchyHeaderBase> {
  ScrollController? _scrollController;
  final GlobalKey _keyHighlightHeader = GlobalKey();
  double _offset = 0.0;
  double _headerSize = 0.0;
  double _highlightHeaderSize = 0.0;
  bool canTriggerRefresh = true;

  void _onLayoutDone(_) {
    final RenderBox? renderBox = _keyHighlightHeader.currentContext!.findRenderObject() as RenderBox?;
    setState(() {
      _highlightHeaderSize = renderBox!.size.height;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _headerSize = widget.headerData.headerHeight;
    if (widget.headerData.highlightHeader != null) {
      WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double highlightPosition = 0.0;
    if (widget.headerData.highlightHeaderAlignment == HighlightHeaderAlignment.top) {
      highlightPosition = (_offset >= 0.0 ? -_offset : 0.0);
    } else if (widget.headerData.highlightHeaderAlignment == HighlightHeaderAlignment.center) {
      highlightPosition = _headerSize / 2 - (_offset >= 0.0 ? _offset : _offset / 2) - _highlightHeaderSize / 2;
    } else if (widget.headerData.highlightHeaderAlignment == HighlightHeaderAlignment.bottom) {
      highlightPosition = _headerSize - _offset - _highlightHeaderSize;
    }
    return Container(
      color: widget.headerData.backgroundColor,
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: _scrollController!.hasClients && _scrollController!.position.extentAfter == 0.0
                ? _headerSize
                : _offset <= _headerSize
                    ? _headerSize - _offset
                    : 0.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRect(
              clipper: HeaderClipper(_headerSize - _offset),
              child: widget.headerData.header,
            ),
          ),
          IgnorePointer(
            child: widget.headerData.blurContent
                ? ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: _offset < 0.0 ? _offset.abs() * 0.1 : 0.0, sigmaY: _offset < 0.0 ? _offset.abs() * 0.1 : 0.0),
                      child: Container(
                        height: _offset <= _headerSize ? _headerSize - _offset : 0.0,
                        decoration: BoxDecoration(color: (widget.headerData.blurColor ?? Colors.grey.shade200).withOpacity(_offset < 0.0 ? 0.15 : 0.0)),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (widget.onRefresh != null) {
                final currentDisplacement = notification.metrics.pixels;
                if (currentDisplacement >= 0) {
                  canTriggerRefresh = true;
                } else if (currentDisplacement <= -widget.displacement && canTriggerRefresh) {
                  widget.onRefresh!();
                  canTriggerRefresh = false;
                }
              }
              if (notification is ScrollUpdateNotification && notification.metrics.axis == Axis.vertical) {
                setState(() {
                  _offset = notification.metrics.pixels;
                });
              }
              LiveStream().emit(GPayStrings.gpStream, notification);
              return false;
            },
            child: widget.listBuilder(
              context,
              _scrollController,
              EdgeInsets.zero,
              const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              SizedBox(
                height: _headerSize,
                child: widget.headerData.overlay,
              ),
            ),
          ),
          widget.headerData.highlightHeader != null
              ? Positioned(
                  key: _keyHighlightHeader,
                  top: highlightPosition,
                  child: widget.headerData.highlightHeader!,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Rect> {
  final double height;

  HeaderClipper(this.height);

  @override
  getClip(Size size) => Rect.fromLTRB(0.0, 0.0, size.width, height);

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
