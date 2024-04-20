import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/core/utils/g_pay_image_constant.dart';

class GPayImageView extends StatelessWidget {
  final String? imagePath;

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;

  const GPayImageView({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = GPayImageConstant.imageNotFound,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  Widget _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
          borderRadius: radius ?? BorderRadius.zero,
          child: _buildImageWithBorder());
    } else {
      return _buildImageWithBorder();
    }
  }

  Widget _buildImageWithBorder() {
    if (border != null) {
      return Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: radius,
          ),
          child: _buildImageView());
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
            ),
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color
          );
      }
    }
    return const SizedBox();
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (endsWith('.svg')) {
      return ImageType.svg;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png }
