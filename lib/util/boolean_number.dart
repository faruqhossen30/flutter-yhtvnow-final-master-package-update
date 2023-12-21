class BooleanNumber{
  static  int toInt(dynamic jdata) {
    if (jdata is String) {
      return int.parse(jdata);
    } else if (jdata is int) {
      return jdata;
    } else {
      return 0;
    }
  }
}