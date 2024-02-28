class ResumeModel {
  String? id;
  String? title;
  String? email;
  String? phoneNumber;
  String? address;
  String? description;
  String? skills;
  String? experience;
  String? education;
  String? position;
  String? projects;

  ResumeModel({
    this.id,
    this.title,
    this.email,
    this.phoneNumber,
    this.address,
    this.description,
    this.skills,
    this.experience,
    this.education,
    this.position,
    this.projects,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      id: json['id'],
      title: json['title'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      description: json['description'],
      skills: json['skills'],
      experience: json['experience'],
      education: json['education'],
      position: json['position'],
      projects: json['projects'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'description': description,
      'skills': skills,
      'experience': experience,
      'education': education,
      'position': position,
      'projects': projects,
    };
  }
}
