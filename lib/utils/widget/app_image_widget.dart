import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_asstes.dart';

// ignore: must_be_immutable
class AppImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  bool isRounded = false;

  AppImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isRounded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isRounded ? 100 : 0),
      child: getImageWidgetAccordingToType(),
    );
  }

  Widget getImageWidgetAccordingToType() {
    if (imageUrl.contains("assets")) {
      if (imageUrl.contains(".svg")) {
        return SvgPicture.asset(
          imageUrl,
          width: width,
          height: isRounded ? width : height,
          fit: fit,
        );
      } else {
        return Image.asset(
          imageUrl,
          fit: fit,
          height: isRounded ? width : height,
          width: width,
        );
      }
    } else {
      if (imageUrl.contains(".svg")) {
        return SvgPicture.network(
          imageUrl,
          width: width,
          height: isRounded ? width : height,
          fit: fit,
        );
      } else if (imageUrl.contains("http") || imageUrl.contains("www")) {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            AppAssets.placeholder,
            fit: fit,
          ),
          height: isRounded ? width : height,
          width: width,
          fit: fit,
        );
      } else {
        return Image.file(
          File(imageUrl),
          height: isRounded ? width : height,
          width: width,
          fit: fit,
          errorBuilder: (context, url, error) => Image.asset(
            AppAssets.placeholder,
            fit: fit,
          ),
        );
      }
    }
  }
}
