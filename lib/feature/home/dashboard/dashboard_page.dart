import 'package:flutter_pre_prismetic/feature/home/dashboard/widget/deal_of_day.dart';
import 'package:flutter_pre_prismetic/feature/home/dashboard/widget/trending_widget.dart';
import 'package:flutter_pre_prismetic/utils/app_asstes.dart';
import 'package:flutter_pre_prismetic/utils/fake_data.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_gesture_detector.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';

import '../../../app_import.dart';
import 'widget/header_cat_widget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            _headerCatWidget(),
            _sliderWidget(),
            _treadingWidget(),
            _dealsOfDayWidget(),
            _categoryWidget(),
          ],
        ),
      ),
    );
  }

  Widget _dealsOfDayWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Deals of the Day".toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppStrings.fontRegular,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AppFakeData().dealOfDayList.length,
                itemBuilder: (context, index) {
                  var model = AppFakeData().dealOfDayList[index];
                  return AppGestureDetector(
                    onTap: () {
                      _goDetailsScreen();
                    },
                    child: DealOfDayWidget(
                      model: model,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Categories".toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppStrings.fontRegular,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              for (var model in AppFakeData().mainCatList) ...{
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: AppGestureDetector(
                    onTap: () {
                      _goDetailsScreen();
                    },
                    child: HeaderCatWidget(
                      name: model.name,
                      image: model.image,
                      imageSize: 70,
                    ),
                  ),
                )
              }
            ],
          ),
        ],
      ),
    );
  }

  Widget _treadingWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "TRENDING",
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppStrings.fontRegular,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: AppFakeData().trendingList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (context, index) {
                var model = AppFakeData().trendingList[index];
                return AppGestureDetector(
                  onTap: () {
                    _goDetailsScreen();
                  },
                  child: TrendingWidget(
                    model: model,
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _sliderWidget() {
    return Container(
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              itemCount: AppFakeData().sliderList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return AppImageWidget(
                  imageUrl: AppAssets.silder,
                  height: 200,
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < AppFakeData().sliderList.length; i++) ...{
                  _sliderIndicatorWidget(currentIndex == i),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sliderIndicatorWidget(bool isActive) {
    return Container(
      height: 6,
      width: 6,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.black : Color(0xffd0d0d0),
      ),
    );
  }

  Widget _headerCatWidget() {
    return Container(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: AppFakeData().headerCatList.length,
        itemBuilder: (context, index) {
          var model = AppFakeData().headerCatList[index];
          return AppGestureDetector(
            onTap: () {
              _goDetailsScreen();
            },
            child: HeaderCatWidget(
              image: model.image,
              name: model.name,
            ),
          );
        },
      ),
    );
  }

  _goDetailsScreen() {
    appRouter.push(DetailsRoute());
  }
}
