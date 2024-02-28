import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResumeView extends StatelessWidget {
  final String email;
  final bool isEditScreen;
  final String phoneNumber;
  final String docId;
  final String name;
  final String description;
  final String address;
  final String skills;
  final String? education;
  final String? experience;
  final String? position;
  final String? projects;

  const ResumeView({super.key,
    required this.email,
    required this.isEditScreen,
    required this.phoneNumber,
    required this.docId,
    required this.name,
    required this.description,
    required this.address,
    required this.skills,
    required this.education,
    required this.position,
    required this.experience,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Resume Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Center(
            child: Card(
              elevation: 5,
              child: Container(
                height: 80.h,
                width: 100.w,
                decoration: BoxDecoration(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ${name}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Address: ${address}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Description: ${description}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Email: ${email}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Phone Number: ${phoneNumber}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Education: ${education}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Position: ${position}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Experience: ${experience}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Skills: ${skills}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        Text(
                          "Projects: ${projects}",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SizedBox(height: 16.0),
                        if (isEditScreen)
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Edit'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
