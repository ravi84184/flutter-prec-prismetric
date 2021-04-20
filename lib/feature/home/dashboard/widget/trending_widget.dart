import 'package:flutter_pre_prismetic/utils/fake_data.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';

import '../../../../app_import.dart';

class TrendingWidget extends StatelessWidget {
  final ProductModel model;

  const TrendingWidget({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          AppImageWidget(imageUrl: model.image),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontFamily: AppStrings.fontNormal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  model.price,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontFamily: AppStrings.fontRegular),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
