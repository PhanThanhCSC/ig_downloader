class BaseRestModel {
  final int STATUS_SUCCESS = 0;
  final int STATUS_FAIL = 1;

  int status = 1;
  String code = "";
  String message = "";
  dynamic data;

  BaseRestModel();

  BaseRestModel.fromJsonMap(Map<String, dynamic> map)
      : status = map.containsKey("status") && map["status"] != null ? map["status"] : 0,
        code = map.containsKey("code") && map["code"] != null ? map["code"] : "",
        message = map.containsKey("message") && map["message"] != null ? map["message"] : "",
        data = map.containsKey("data") && map["data"] != null ? map["data"] : "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['code;'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
