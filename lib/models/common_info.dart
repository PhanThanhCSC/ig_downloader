class CommonInfo {
  String id;
  String code;
  String name;
  String startTime = "";

  CommonInfo(this.id, this.name, this.code);

  CommonInfo.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        code = map["code"] != null ? map["code"] : "",
        name = map["name"] != null ? map["name"] : "",
        startTime = map.containsKey("startTime") && map["startTime"] != null ? map["startTime"] : "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['startTime'] = startTime;
    return data;
  }
}
