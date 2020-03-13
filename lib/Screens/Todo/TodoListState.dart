import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
class TodoListState extends State<TodoList> {

  List<String> _todoItems = [];
   void _addTodoItem(String task){
     setState(() {
       _todoItems.add(task);
     });
   }
Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return new Scaffold(
    body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: <Widget>[
     new ClipPath(
              child: Container(
                color: Colors.purpleAccent[400],
                height: 90,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),

            new ClipPath(
              child: Container(
                color: Colors.purpleAccent[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),
            Padding(
                            padding: EdgeInsets.all(8.0),
                            child:Text( "Todo List", 
                              style: TextStyle(color:Colors.white,fontSize: 30, fontWeight: FontWeight.bold)
                                ),
                          ), 
                      _buildTodoList(),         
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.purpleAccent[400],
                  height: 50,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.purpleAccent[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
          ],
        ),
    ),
    
    floatingActionButton: new FloatingActionButton(
      backgroundColor: Colors.purpleAccent,
      onPressed: _pushAddTodoScreen, // pressing this button now opens the new screen
      tooltip: 'Add task',
      child: new Icon(Icons.add) 
    ),
  );
}

void _pushAddTodoScreen() {
  // Push this page onto the stack
  Navigator.of(context).push(
    // MaterialPageRoute will automatically animate the screen entry, as well
    // as adding a back button to close it
    new MaterialPageRoute(
      builder: (context) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Add a new task')
          ),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context); // Close the add todo screen
              
            },
            decoration: new InputDecoration(
              hintText: 'Enter something to do...',
              contentPadding: const EdgeInsets.all(16.0)
            ),
          )
        );
      }
    )
  );
}

Widget _buildTodoList (){
  return new Container(
   margin: const EdgeInsets.only(top: 70),
    child: new ListView.builder(
      itemBuilder: (context,index){
        if (index < _todoItems.length){
          return _buildTodoItem(_todoItems[index], index);
        }
        return null;
      },
    ),
  );
  }

  Widget _buildTodoItem (String todotext, int index){
    return new ListTile(
      title: new Text(index.toString()+"  "+  todotext),
      onTap: () => _promptRemoveTodoItem(index),
    );
  }
  void _promptRemoveTodoItem (int index){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text('Mark "${_todoItems[index]}" as done'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () => Navigator.of(context).pop,
               ),
              new FlatButton(
                child: new Text("MARK AS DONE"),
                onPressed: (){
                  _removeTodoItem(index);
                  Navigator.of(context).pop();
                },
             
            )
          ],
        );
      }
    );
  }
  void _removeTodoItem(int index){
    setState(() {
      _todoItems.removeAt(index);
    });
  }
}
