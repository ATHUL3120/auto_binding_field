extension EnumParsing on String? {
  int? toParseInt() {
    String? value = this;
    return int.tryParse(value.toString());
  }

  double? toParseDouble() {
    String? value = this;
    return double.tryParse(value.toString());
  }
  num? toParseNum() {
    String? value = this;
    return num.tryParse(value.toString());
  }
  bool? parseBool() {
    if (this == null) return null;
    if (this!.toLowerCase() == 'true') {
      return true;
    } else if (this!.toLowerCase() == 'false') {
      return false;
    } else {
      return null;
    }
  }
}
extension NumExt on num?{
  String? toParseString(){
    num? value=this;
    if(value!=null){
      if(value.toInt().toDouble()==value){
        return value.toInt().toString();
      }else{
        return value.toString();
      }
    }else{
      return null;
    }
  }
}