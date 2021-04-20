import 'common_response.dart';

class GeneralResponse extends CommonResponse {
  GeneralResponse.fromJson(Map<String, dynamic> json) {
    this.error =
        (json['error'] != null ? Error.fromJson(json['error']) : null)!;
    this.status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error.toJson();
    data['status'] = this.status;
    return data;
  }
}
