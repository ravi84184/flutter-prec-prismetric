import 'package:flutter_pre_prismetic/utils/app_asstes.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_shimmer_effect.dart';

import '../../../../app_import.dart';

class CompanyShimmerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Color(0xff8f8f8f),
          width: 0.5,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppShimmer(
              child: Text(
                "===========",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppStrings.fontNormal,
                  color: AppColors.black,
                ),
              ),
            ),
            AppShimmer(
              child: Text(
                "====.=====@===.===",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: AppStrings.fontLight,
                  color: Color(0xffb7b7b7),
                ),
              ),
            ),
            AppShimmer(
              child: Text(
                "================================",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: AppStrings.fontLight,
                  color: Color(0xffb7b7b7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppShimmer(
              child: Text(
                "Company Details",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: AppStrings.fontRegular,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _textIcon(image: AppAssets.com_name, text: "==== ======="),
            _textIcon(image: AppAssets.webite, text: "===.=======.==="),
            _textIcon(image: AppAssets.phone, text: "============="),
          ],
        ),
      ),
    );
  }

  Widget _textIcon({required String text, required String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          AppShimmer(
            child: AppImageWidget(
              imageUrl: image,
              height: 15,
              width: 15,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          AppShimmer(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 10,
                fontFamily: AppStrings.fontRegular,
                color: Color(0xffb7b7b7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
