import 'package:flutter/material.dart';

void main() => runApp(AdminSEBAApp());

class AdminSEBAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin SEBA All Subject',
      theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: Color(0xFFF5F7FF)),
      home: AdminHome(),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final subjectCtrl = TextEditingController();
  String selectedClass = "Class 10";
  List<Map<String,String>> subjects = [];

  final List<String> allSubjects = [
    "Assamese","English","General Mathematics","General Science","Social Science",
    "Hindi","Advanced Mathematics","Geography","History","Sanskrit",
    "Computer Science","Commerce (E)","Home Science (E)",
    "Retail Trade NSQF","IT/ITeS NSQF","Private Security NSQF","Health Care NSQF",
    "Agriculture & Horticulture NSQF","Tourism & Hospitality NSQF",
    "Beauty & Wellness NSQF","Automotive NSQF","Electronics & Hardware NSQF",
    "Apparel Made-Ups & Home Furnishing NSQF","Animal Health Worker NSQF"
  ];

  void addSubject(){
    if(subjectCtrl.text.isEmpty) return;
    setState((){ subjects.add({"name": subjectCtrl.text, "class": selectedClass}); });
    subjectCtrl.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("✅ Added!")));
  }

  void addAll(){
    setState((){
      for(var s in allSubjects){
        if(!subjects.any((e)=> e['name']==s)){
          subjects.add({"name": s, "class": "Class 10"});
        }
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("🔥 24 Subjects Added!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin SEBA - Khursed Alam"), backgroundColor: Color(0xFF2F6BFF)),
      body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)),
          child: Row(children: [Icon(Icons.verified_user, color: Colors.blue), SizedBox(width: 8), Expanded(child: Text("Owner: Khursed Alam | 24 Subjects | khursedv786@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)))]),
        ),
        SizedBox(height: 16),
        DropdownButtonFormField(value: selectedClass, items: ["Class 9","Class 10"].map((e)=> DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v){setState((){selectedClass=v!;});}, decoration: InputDecoration(labelText: "Select Class", border: OutlineInputBorder())),
        SizedBox(height: 10),
        TextField(controller: subjectCtrl, decoration: InputDecoration(labelText: "Subject Name likhok", border: OutlineInputBorder())),
        SizedBox(height: 10),
        Row(children: [Expanded(child: ElevatedButton(onPressed: addSubject, child: Text("Add Single"))), SizedBox(width: 10), Expanded(child: ElevatedButton(onPressed: addAll, style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: Text("Add All 24")))]),
        Divider(),
        Text("Total: ${subjects.length} / 24", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Expanded(child: ListView.builder(itemCount: subjects.length, itemBuilder: (c,i)=> Card(child: ListTile(leading: Text("${i+1}"), title: Text(subjects[i]['name']!), subtitle: Text(subjects[i]['class']!), trailing: Icon(Icons.check_circle, color: Colors.green))))),
      ])),
    );
  }
}
