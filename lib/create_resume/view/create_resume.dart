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

                    },
                    buttonText: "Save"),
              ],
            ),
          ),
        ));
  }


}
