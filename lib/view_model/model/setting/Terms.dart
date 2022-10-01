class Terms {

  String? code;
  Data? data;

  Terms({
      this.code, 
      this.data,});

  Terms.fromJson(dynamic json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}

class Data {
  Data({
     this.terms,});

  Data.fromJson(dynamic json) {
    terms = json['Terms'];
  }
  String? terms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Terms'] = terms;
    return map;
  }

}