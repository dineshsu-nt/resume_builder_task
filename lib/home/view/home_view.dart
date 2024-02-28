import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:resume_task/create_resume/view/create_resume.dart';
import 'package:resume_task/home/controller/home_controller.dart';
import 'package:resume_task/resume_view.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Resume App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('resumes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
          if (streamSnapshot.hasData) {
            List<DocumentSnapshot> resumeDocs = streamSnapshot.data.docs;

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: resumeDocs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResumeView(
                            projects: resumeDocs[index]["projects"],
                            email: resumeDocs[index]["email"],
                            isEditScreen: false,
                            phoneNumber:
                                resumeDocs[index]["phoneNumber"].toString(),
                            docId: resumeDocs[index].id,
                            name: resumeDocs[index]["title"],
                            description: resumeDocs[index]["description"],
                            address: resumeDocs[index]["address"],
                            skills: resumeDocs[index]["skills"],
                            education: resumeDocs[index]["education"],
                            experience: resumeDocs[index]["experience"],
                            position: resumeDocs[index]["position"],
                          ),
                        ));
                      },
                      child: ListTile(
                        title: Text("Name: ${resumeDocs[index]["title"]}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Description: ${resumeDocs[index]["description"]}"),
                            Text("Address: ${resumeDocs[index]["address"]}"),
                            Text("Skills: ${resumeDocs[index]["skills"]}"),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                controller
                                    .deleteResumeItem(resumeDocs[index].id);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                controller.navigateResumeScreen(
                                    resumeDocs[index], context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (streamSnapshot.hasError) {
            debugPrint("Error: ${streamSnapshot.error}");
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateResumeView()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
