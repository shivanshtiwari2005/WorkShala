class course {
  String? message;
  List<Courses>? courses;

  course({this.message, this.courses});

  course.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  String? courses;
  String? description;
  String? level;
  String? skillsCovered;

  Courses({this.courses, this.description, this.level, this.skillsCovered});

  Courses.fromJson(Map<String, dynamic> json) {
    courses = json['courses'];
    description = json['Description'];
    level = json['Level'];
    skillsCovered = json['Skills Covered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courses'] = this.courses;
    data['Description'] = this.description;
    data['Level'] = this.level;
    data['Skills Covered'] = this.skillsCovered;
    return data;
  }
}

