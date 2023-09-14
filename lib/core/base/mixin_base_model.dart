import 'package:intl/intl.dart';
import '/core/values/styles.dart';

mixin BaseModel {
  String parseString(String object, String keyName, Map<String, dynamic> map) {
    object = map[keyName] != null ? map[keyName] : "";

    return object;
  }

  String parseStringWithDefault(String object, String keyName, Map<String, dynamic> map, String _default) {
    object = map[keyName] != null ? map[keyName] : _default;

    return object;
  }

  int parseInt(int object, String keyName, Map<String, dynamic> map) {
    object = map[keyName] != null ? map[keyName] : 0;

    return object;
  }

  int parseIntWithDefault(int object, String keyName, Map<String, dynamic> map, int _default) {
    object = map[keyName] != null ? map[keyName] : _default;

    return object;
  }

  bool parseBool(bool object, String keyName, Map<String, dynamic> map) {
    object = map[keyName] != null ? map[keyName] : false;

    return object;
  }

  bool parseBoolWithDefault(bool object, String keyName, Map<String, dynamic> map, bool _default) {
    object = map[keyName] != null ? map[keyName] : _default;

    return object;
  }

  DateTime? parseDatetime(DateTime? object, String keyName, Map<String, dynamic> map) {
    object = map[keyName] != null
        ? DateFormat(Styles.FORMAT_DATE).parse(
            map[keyName].toString(),
          )
        : null;
    // object = map[keyName] != null ? DateTime.parse(map[keyName].toString()) : null;

    return object;
  }

  DateTime? parseDatetimeWithDefault(DateTime? object, String keyName, Map<String, dynamic> map, DateTime _default) {
    object = map[keyName] != null
        ? DateFormat(Styles.FORMAT_DATE).parse(
            map[keyName].toString(),
          )
        : _default;
    // object = map[keyName] != null ? DateTime.parse(map[keyName].toString()) : _default;

    return object;
  }
}
