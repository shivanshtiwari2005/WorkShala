class companyData {
  List<Companies>? companies;

  companyData({this.companies});

  companyData.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  String? sId;
  String? img;
  String? title;
  String? location;
  String? industry;
  String? companyType;
  String? about;

  Companies(
      {this.sId,
      this.img,
      this.title,
      this.location,
      this.industry,
      this.companyType,
      this.about});

  Companies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    img = json['img'];
    title = json['title'];
    location = json['location'];
    industry = json['industry'];
    companyType = json['companyType'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['img'] = img;
    data['title'] = title;
    data['location'] = location;
    data['industry'] = industry;
    data['companyType'] = companyType;
    data['about'] = about;
    return data;
  }
}
