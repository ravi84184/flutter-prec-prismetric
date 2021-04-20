import 'package:flutter/material.dart';
import 'package:flutter_pre_prismetic/app_import.dart';
import 'package:flutter_pre_prismetic/feature/home/details_screen/model/company_model.dart';
import 'package:flutter_pre_prismetic/feature/home/details_screen/widget/shimmer_company_tile.dart';
import 'package:flutter_pre_prismetic/services/network/api_provider.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_scaffold_wrapper.dart';
import 'package:get_it/get_it.dart';

import 'widget/company_tile.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  APIProviderIml _apiProviderIml = GetIt.I.get<APIProviderIml>();

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWrapper(
        child: Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _apiProviderIml.getCompanyData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) {
                      return CompanyShimmerTile();
                    });
              }

              if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text(snapshot.error.toString()),
                  ),
                );
              }

              if (snapshot.hasData) {
                var list = snapshot.data as List<CompanyModel>;

                return ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) {
                      return CompanyTile(
                        model: list[index],
                      );
                    });
              }
              return SizedBox.shrink();
            }),
      ),
    ));
  }
}
