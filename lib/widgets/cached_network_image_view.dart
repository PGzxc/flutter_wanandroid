import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/decoration_style.dart';

/// 类名: cached_network_image_view.dart
/// 描述: CachedNetworkImage组件封装

class CachedNetworkImageView extends StatelessWidget {
  const CachedNetworkImageView({
    Key? key,
    required this.visible,
    this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.placeholderColor = Colors.grey,
    this.placeholderColorOpacity = 0.3,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.isCircle = false,
    this.borderRadius = 0.0,
  }) : super(key: key);

  final bool visible; // 是否可见
  final double borderRadius; // 圆角弧度，isCircle=true时为圆形
  final Color borderColor; // 边框颜色
  final double borderWidth; // 边框宽度
  final bool isCircle; //是否为圆形

  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color placeholderColor;
  final double placeholderColorOpacity;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: fit ?? BoxFit.cover,
        width: width ?? Get.width,
        height: height ?? Get.height,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.colorBurn,
                ),
              ),
            ),
          );
        },
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          decoration: DecorationStyle.imageDecorationCircle(
            color: placeholderColor.withOpacity(placeholderColorOpacity),
            borderRadius: borderRadius,
            isCircle: isCircle,
          ),
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: const BoxDecoration(color: Colors.black26),
          child: const Icon(Icons.error),
        ),
        fadeOutDuration: const Duration(seconds: 3),
        fadeInDuration: const Duration(seconds: 3),
      ),
    );
  }
}
