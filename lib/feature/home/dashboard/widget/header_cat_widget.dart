import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';

import '../../../../app_import.dart';

class HeaderCatWidget extends StatelessWidget {
  final String name;
  final String image;
  final double imageSize;

  const HeaderCatWidget(
      {Key? key, required this.name, required this.image, this.imageSize = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImageWidget(
            imageUrl: image,
            isRounded: true,
            height: imageSize,
            width: imageSize,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppStrings.fontRegular,
              fontSize: 10,
              color: AppColors.catColor,
            ),
          ),
        ],
      ),
    );
  }
}
