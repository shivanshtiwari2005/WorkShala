class course {
  String? message;
  List<Courses>? courses;

  course({this.message, this.courses});

  course.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courses'] = courses;
    data['Description'] = description;
    data['Level'] = level;
    data['Skills Covered'] = skillsCovered;
    return data;
  }
}
