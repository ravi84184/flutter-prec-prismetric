import 'package:dio/dio.dart';
import 'package:flutter_pre_prismetic/feature/home/details_screen/model/company_model.dart';

import 'api_client/api_client.dart';

class APIProviderIml {
  final Dio _dio = Dio();

  static APIProviderIml? _instance;
  late ApiClient _apiClient;

  APIProviderIml._() {
    _apiClient = ApiClient(_dio);
    print("APIProviderIml()");
  }

  static Future<APIProviderIml> getInstance() async {
    if (_instance == null) {
      _instance = APIProviderIml._();
    }
    return _instance!;
  }

  /// Fetch Language API
  Future<List<CompanyModel>> getCompanyData() async {
    var response;
    response = await _apiClient.get(
      "/users",
    );
    print("===== Response Start =======");
    print(response.data.toString());
    print("===== Response End =======");
    List<CompanyModel> list = [];
    for (var model in response.data) {
      list.add(CompanyModel.fromJson(model));
    }
    return list;
  }
}
