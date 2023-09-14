class ResponseData {
  String message = "";
  int status = 0;
  String code = "";
  dynamic data = null;

  ResponseData();

  // ResponseData(this.status, this.code, this.message, this.data);

  //  hotline = map["hotline"] != null ? map["hotline"] : "",
  //    rating = map["rating"] != null ? map["rating"] : 5,
  ResponseData.fromJson(Map<String, dynamic> map)
      : status = map["status"] != null ? map["status"] : 0,
        code = map["code"] != null ? map["code"] : "",
        message = map["message"] != null ? map["message"] : "",
        data = map["data"] != null ? map["data"] : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
