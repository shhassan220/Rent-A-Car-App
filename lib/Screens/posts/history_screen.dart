import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/login_screen.dart';
import '../../utils/utils.dart';
import 'car_book_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref("Car");
  final searchFilterController = TextEditingController();
  final editController = TextEditingController();
  final _dateController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        title: Text("History", style: GoogleFonts.montserrat(),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessages(error.toString());
                });
              },
              icon: Icon(Icons.logout_outlined)),
          SizedBox(
            width: 11,
          ),
        ],
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: StreamBuilder(
          //     stream: ref.onValue,
          //     builder: (context, AsyncSnapshot <DatabaseEvent> snapshot) {
          //       if(!snapshot.hasData){
          //         return CircularProgressIndicator();
          //       }
          //       else{
          //         Map <dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
          //         List<dynamic> list = [];
          //         list.clear();
          //         list = map.values.toList();
          //         return ListView.builder(
          //           itemCount: snapshot.data!.snapshot.children.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(list[index]['title']),
          //               subtitle: Text(list[index]['id']),
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              cursorColor: Colors.black87,
              controller: searchFilterController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                defaultChild: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.red,
                  ),
                ),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('title').value.toString();
                  if (searchFilterController.text.isEmpty) {
                    return ListTile(
                      leading: Text(snapshot.child('date').value.toString()),
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  showMyDialog(title, snapshot.child('id').value.toString());
                                },
                                leading: Icon(Icons.edit),
                                title: Text("Edit"),
                              )),
                          PopupMenuItem(
                            value: 2,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  ref.child(snapshot.child('id').value.toString()).remove();
                                },
                                leading: Icon(Icons.delete),
                                title: Text("Delete"),
                              )),
                        ],
                      ),
                    );
                  } else if (title.toLowerCase().contains(
                      searchFilterController.text.toLowerCase().toString())) {
                    return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('date').value.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CarBookScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future <void> showMyDialog (String title, String id) async {
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Edit"),
            content: Container(
              child: Column(
                children: [
                  TextField(
                    controller: editController,
                    decoration: InputDecoration(
                      hintText: "Edit",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      )
                    ),
                  ),
                  TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                        hintText: "Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        )
                    ),
                    readOnly: true,
                    onTap: (){
                      _selectDate();
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  ref.child(id).update({
                    'title' : editController.text.toLowerCase(),
                    'date' : _dateController.text.toString(),
                  }).then((value) => {
                  Utils().toastMessages("Post Updated"),
                  }).onError((error, stackTrace) => {
                    Utils().toastMessages(error.toString()),
                  });
                },
                child: Text("Update"),
              ),
            ],
          );
        });
  }
  Future <void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
