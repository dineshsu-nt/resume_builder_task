import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume_task/model.dart';
import 'package:resume_task/widget/custom_button.dart';
import 'package:resume_task/widget/custom_text_field.dart';



class CreateResumeView extends StatefulWidget {
  bool isEditScreen;
  final ResumeItem? resumeItem;
  final String? docId;
  final String? title;
  final String? description;
  final String? address;
  final String? skills;
  final String? email;
  final String? phoneNumber;
  final String? edutcation;
  final String? experiance;
  final String? position;
  final String?projects;

  CreateResumeView({
    this.projects,
    this.docId,
    this.email,
    this.phoneNumber,
    this.isEditScreen = false,
    this.title,
    this.description,
    this.address,
    this.skills,
    this.resumeItem,
    this.position,
    this.edutcation,
    this.experiance,
  });

  @override
  _CreateResumeViewState createState() => _CreateResumeViewState();
}

class _CreateResumeViewState extends State<CreateResumeView> {
  TextEditingController? titleController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? descriptionController;
  TextEditingController? skillsController;
  TextEditingController? positionController;
  TextEditingController? educationController;
  TextEditingController? experianceController;
  TextEditingController? projectsController;

  @override
  void initState() {
    super.initState();
    initilizeController(); // Call the initialization method here
  }

  void initilizeController() {
    skillsController = TextEditingController(text: widget.skills);
    titleController = TextEditingController(text: widget.title);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phoneNumber);
    addressController = TextEditingController(text: widget.address);
    descriptionController = TextEditingController(text: widget.description);
    positionController = TextEditingController(text: widget.position);
    educationController = TextEditingController(text: widget.edutcation);
    experianceController = TextEditingController(text: widget.experiance);
    projectsController = TextEditingController(text: widget.projects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
              widget.isEditScreen == false ? 'Create Resume' : 'Edit Resume',style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextFieldTitle(
                  fieldTitle: "Name",
                  controller: titleController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Email",
                  controller: emailController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Position",
                  controller: positionController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Education",
                  controller: educationController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Phone Number",
                  controller: phoneController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Address",
                  controller: addressController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Experiance",
                  controller: experianceController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Description",
                  controller: descriptionController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Skill",
                  controller: skillsController!,
                ),
                CustomTextFieldTitle(
                  fieldTitle: "Projects",
                  controller: projectsController!,
                ),
                SizedBox(height: 16.0),
                CustomButton(textColor: Colors.white,
                    buttonColor: Colors.blue,
                    onTap: () {
                      createResume();
                    },
                    buttonText: "Save"),
              ],
            ),
          ),
        ));
  }

  void createResume() async {
    final CollectionReference resumeCollection =
        FirebaseFirestore.instance.collection('resumes');
    final title = titleController?.text;
    final email = emailController?.text;
    final phone = phoneController?.text;
    final address = addressController?.text;
    final description = descriptionController?.text;
    final skills = skillsController?.text;
    final position = positionController?.text;
    final experience = experianceController?.text;
    final education = educationController?.text;
    final projects = projectsController?.text;

    final result = ResumeItem(
      projects: projects,
      title: title,
      email: email,
      phoneNumber: phone,
      address: address,
      description: description,
      skills: skills,
      position: position,
      experience: experience,
      education: education,
    );

    if (widget.isEditScreen) {
      await resumeCollection.doc(widget.docId).update({
        "title": result.title,
        'email': result.email,
        'phoneNumber': result.phoneNumber,
        'address': result.address,
        'description': result.description,
        'skills': result.skills,
        'position': result.position,
        'experience': result.experience,
        'education': result.education,
        "projects": result.projects,
      });
    } else {
      await resumeCollection.add({
        "title": result.title,
        'email': result.email,
        'phoneNumber': result.phoneNumber,
        'address': result.address,
        'description': result.description,
        'skills': result.skills,
        'position': result.position,
        'experience': result.experience,
        'education': result.education,
        "projects": result.projects,
      });
    }

    Navigator.pop(context, result);
  }
}
