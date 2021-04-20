import 'package:flutter_pre_prismetic/feature/home/details_screen/model/company_model.dart';
import 'package:flutter_pre_prismetic/utils/app_asstes.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_gesture_detector.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app_import.dart';

class CompanyTile extends StatelessWidget {
  final CompanyModel model;

  const CompanyTile({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: () {
        appRouter.push(MapRoute(
            latLng: LatLng(
              double.tryParse(model.address.geo.lat)!,
              double.tryParse(model.address.geo.lng)!,
            ),
            text: model.name));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Color(0xff8f8f8f),
            width: 0.5,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.name,
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppStrings.fontNormal,
                color: AppColors.black,
              ),
            ),
            Text(
              model.email,
              style: TextStyle(
                fontSize: 10,
                fontFamily: AppStrings.fontLight,
                color: Color(0xffb7b7b7),
              ),
            ),
            Text(
              "${getAddress(model.address)}",
              style: TextStyle(
                fontSize: 10,
                fontFamily: AppStrings.fontLight,
                color: Color(0xffb7b7b7),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Company Details",
              style: TextStyle(
                fontSize: 10,
                fontFamily: AppStrings.fontRegular,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _textIcon(image: AppAssets.com_name, text: model.company.name),
            _textIcon(image: AppAssets.webite, text: model.website),
            _textIcon(image: AppAssets.phone, text: model.phone),
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
          AppImageWidget(
            imageUrl: image,
            height: 15,
            width: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontFamily: AppStrings.fontRegular,
              color: Color(0xffb7b7b7),
            ),
          ),
        ],
      ),
    );
  }

  String getAddress(Address address) {
    return "${address.street}, ${address.suite}, ${address.city}-${address.zipcode}";
  }
}
