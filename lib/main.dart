import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _addStudent() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController studentIdController = TextEditingController();
    TextEditingController branchController = TextEditingController();
    TextEditingController yearController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: studentIdController,
                decoration: const InputDecoration(labelText: 'Student ID'),
              ),
              TextField(
                controller: branchController,
                decoration: const InputDecoration(labelText: 'Branch'),
              ),
              TextField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Year'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _firestore.collection('students').add({
                  'name': nameController.text,
                  'student_id': studentIdController.text,
                  'branch': branchController.text,
                  'year': yearController.text,
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _editStudent(DocumentSnapshot doc) async {
    TextEditingController nameController = TextEditingController(text: doc['name']);
    TextEditingController studentIdController = TextEditingController(text: doc['student_id']);
    TextEditingController branchController = TextEditingController(text: doc['branch']);
    TextEditingController yearController = TextEditingController(text: doc['year']);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: studentIdController,
                decoration: const InputDecoration(labelText: 'Student ID'),
              ),
              TextField(
                controller: branchController,
                decoration: const InputDecoration(labelText: 'Branch'),
              ),
              TextField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Year'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _firestore.collection('students').doc(doc.id).update({
                  'name': nameController.text,
                  'student_id': studentIdController.text,
                  'branch': branchController.text,
                  'year': yearController.text,
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteStudent(String docId) async {
    await _firestore.collection('students').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final students = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                title: Text(student['name']),
                subtitle: Text('ID: ${student['student_id']}, Branch: ${student['branch']}, Year: ${student['year']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editStudent(student),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteStudent(student.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        child: const Icon(Icons.add),
      ),
    );
  }
}