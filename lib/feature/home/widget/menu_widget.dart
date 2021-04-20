import 'package:flutter/material.dart';
import 'package:flutter_pre_prismetic/app_import.dart';
import 'package:flutter_pre_prismetic/feature/home/widget/zoom_scaffold.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_image_widget.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.chevron_right, 'Shipping policy'),
    MenuItem(Icons.chevron_right, 'Returns Policy'),
    MenuItem(Icons.chevron_right, 'About us'),
    MenuItem(Icons.chevron_right, 'Terms & conditions'),
    MenuItem(Icons.chevron_right, 'Privacy Policy'),
    MenuItem(Icons.chevron_right, 'Contact Us'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: false).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62, bottom: 8, right: MediaQuery.of(context).size.width / 4),
        color: AppColors.black,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: AppImageWidget(
                      imageUrl: imageUrl,
                      isRounded: true,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Haley lawrence',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: AppStrings.fontNormal,
                        ),
                      ),
                      Text(
                        'Haley.lawrence@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: AppStrings.fontLight,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map((item) {
                return ListTile(
                  trailing: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 20,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.fontRegular,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
