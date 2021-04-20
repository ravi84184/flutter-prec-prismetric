import 'package:flutter_pre_prismetic/feature/home/dashboard/model/cat_model.dart';
import 'package:flutter_pre_prismetic/utils/app_asstes.dart';

class AppFakeData {
  List<CategoryModel> headerCatList = [
    CategoryModel("Men", AppAssets.men),
    CategoryModel("Women", AppAssets.women),
    CategoryModel("Kids", AppAssets.Kids),
    CategoryModel("Beauty", AppAssets.Beauty),
    CategoryModel("Footwear", AppAssets.Footwear),
  ];

  List<CategoryModel> mainCatList = [
    CategoryModel("Men", AppAssets.cat1),
    CategoryModel("Headphone", AppAssets.cat2),
    CategoryModel("Men's Trackpants", AppAssets.cat3),
    CategoryModel("Backpacks", AppAssets.cat4),
    CategoryModel("Kurta set", AppAssets.cat5),
    CategoryModel("Jewellery", AppAssets.cat6),
    CategoryModel("Footwear", AppAssets.cat7),
    CategoryModel("Bath Essential", AppAssets.cat8),
  ];

  List<String> sliderList = [
    AppAssets.silder,
    AppAssets.silder,
  ];
  List<ProductModel> trendingList = [
    ProductModel(
      image: AppAssets.Shirts_images,
      name: "Shirt",
      price: "\$15.00",
    ),
    ProductModel(
      image: AppAssets.Loungewear,
      name: "Loungewear",
      price: "\$15.00",
    ),
    ProductModel(
      image: AppAssets.jeans,
      name: "Jeans",
      price: "\$5.00",
    ),
    ProductModel(
      image: AppAssets.tshirts,
      name: "T-shirt",
      price: "\$5.00",
    ),
  ];
  List<ProductModel> dealOfDayList = [
    ProductModel(
      image: AppAssets.images1,
      name: "10% Off on all",
      price: "Designer look",
    ),
    ProductModel(
      image: AppAssets.images2,
      name: "Extra 5% off",
      price: "on order of \$1500",
    ),
    ProductModel(
      image: AppAssets.images3,
      name: "10% Off on all",
      price: "Designer look",
    ),
  ];
}

class ProductModel {
  final String name;
  final String price;
  final String image;

  ProductModel({required this.name, required this.price, required this.image});
}
