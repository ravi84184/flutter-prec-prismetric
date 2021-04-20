import 'package:flutter/cupertino.dart';
import 'package:flutter_pre_prismetic/utils/fake_data.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';

import '../../../../app_import.dart';

class DealOfDayWidget extends StatelessWidget {
  final ProductModel model;

  const DealOfDayWidget({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageWidget(
            width: MediaQuery.of(context).size.width * 0.5,
            imageUrl: model.image,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              model.name,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontFamily: AppStrings.fontNormal),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              model.price,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontFamily: AppStrings.fontRegular),
            ),
          ),
        ],
      ),
    );
  }
}
