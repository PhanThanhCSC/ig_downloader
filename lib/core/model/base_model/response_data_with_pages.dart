class ResponseDataWithPages {
  String message = "";
  int status = 0;
  String code = "";
  dynamic data = null;
  int records = 0;
  int pages = 0;
  double averageRating = 0;

  ResponseDataWithPages();

  // ResponseDataWithPages(this.code, this.message, this.data, this.records, this.pages);

  ResponseDataWithPages.fromJson(Map<String, dynamic> map)
      : status = map["status"] != null ? map["status"] : 0,
        code = map["code"] != null ? map["code"] : "",
        message = map["message"] != null ? map["message"] : "",
        data = map["data"] != null ? map["data"] : null,
        // message = map["message"],
        // code = map["code"],
        // data = map["data"],
        records = map["records"] != null ? map["records"] : 0,
        averageRating = map.containsKey("averageRating") && map["averageRating"] != null ? map["averageRating"] : 0,
        pages = map["pages"] != null ? map["pages"] : 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['code'] = code;
    data['data'] = data;
    data['records'] = records;
    data['averageRating'] = averageRating;
    data['pages'] = pages;
    return data;
  }
}
