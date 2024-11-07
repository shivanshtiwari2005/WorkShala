class companyData {
  List<Companies>? companies;

  companyData({this.companies});

  companyData.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['img'] = this.img;
    data['title'] = this.title;
    data['location'] = this.location;
    data['industry'] = this.industry;
    data['companyType'] = this.companyType;
    data['about'] = this.about;
    return data;
  }
}
