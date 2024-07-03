import 'package:intl/intl.dart';

abstract class Model {
  DateTime dateFromJson(Map<String, dynamic> json, String attribute) {
    try {
      return DateFormat("yyyy-MM-dd").parse(json[attribute]);
    } catch (e) {
      throw Exception('Error while parsing $attribute[$e]');
    }
  }

  int intFromJson(Map<String, dynamic> json, String attribute, {int defaultValue = 0}) {
    try {
      if (json[attribute] != null) {
        if (json[attribute] is int) {
          return json[attribute];
        }
        return int.parse(json[attribute]);
      }
      return defaultValue;
    } catch (e) {
      throw Exception('Error while parsing $attribute[$e]');
    }
  }

  String stringFromJson(Map<String, dynamic> json, String attribute, {String defaultValue = ''}) {
    try {
      return json[attribute] != null
          ? json[attribute].toString() != ""
              ? json[attribute].toString()
              : defaultValue
          : defaultValue;
    } catch (e) {
      throw Exception('Error while parsing $attribute[$e]');
    }
  }

  List<T> listFromJson<T>(Map<String, dynamic>? json, String? attribute, T Function(Map<String, dynamic>) callback) {
    try {
      List<T> list = <T>[];
      if (json != null && json[attribute] != null && json[attribute] is List && json[attribute].length > 0) {
        json[attribute].forEach((v) {
          if (v is Map<String, dynamic>) {
            list.add(callback(v));
          }
        });
      }
      return list;
    } catch (e) {
      throw Exception('Error while parsing $attribute[$e]');
    }
  }
}
