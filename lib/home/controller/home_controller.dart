import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_task/create_resume/view/create_resume.dart';


class HomeController extends GetxController {
  final CollectionReference resumeCollection =
      FirebaseFirestore.instance.collection('resumes');

  void navigateResumeScreen(
      DocumentSnapshot resumeDoc, BuildContext context) async {
    debugPrint("Document ID: ${resumeDoc.id}");
    debugPrint("Title: ${resumeDoc["title"]}");
    debugPrint("Description: ${resumeDoc["description"]}");
    debugPrint("Address: ${resumeDoc["address"]}");
    debugPrint("Skills: ${resumeDoc["skills"]}");

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateResumeView(
          experiance: resumeDoc["experience"],
          education: resumeDoc["education"],
          position: resumeDoc["position"],
          projects: resumeDoc["projects"],
          email: resumeDoc["email"],
          isEditScreen: true,
          phoneNumber: resumeDoc["phoneNumber"],
          docId: resumeDoc.id,
          title: resumeDoc["title"],
          description: resumeDoc["description"],
          address: resumeDoc["address"],
          skills: resumeDoc["skills"],
        ),
      ),
    );
  }

  void deleteResumeItem(String id) async {
    try {
      await resumeCollection.doc(id).delete();
      debugPrint("Deleted document with ID: $id");
    } catch (e) {
      debugPrint("Error deleting document: $e");
    }
  }
}
