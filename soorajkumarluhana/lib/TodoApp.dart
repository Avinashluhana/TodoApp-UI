import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<dynamic> todoList = [];
  var input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TodoApp",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 80,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(" ${index + 1}. " " ${todoList[index]}", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    ),),
                    trailing: Column(
                        children: [
                           GestureDetector(onTap:(){
                           showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Edit Task"),
                  content: TextField(
                    onChanged: (value) {
                      input = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                            Navigator.of(context).pop();
                          setState(() {
                            todoList.replaceRange(index, index+1, {input});
                          }); 
                        },
                        child: Text("Done"),
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        )
                  ],
                );
              });
                         }, child: Icon(Icons.edit),),
                         GestureDetector(onTap:(){
                           setState(() {
                             todoList.removeAt(index);
                           });
                         }, child: Icon(Icons.delete),)
                        ],
                      ),
                    ),
                ),
              );
            }),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add Task"),
                    content: TextField(
                      onChanged: (value) {
                        input = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                              Navigator.of(context).pop();
                            setState(() {
                              todoList.add(input);
                            }); 
                          },
                          child: Text("Add"),
                          style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                          )
                    ],
                  );
                });
          },
          child: Text("+"),
          
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
