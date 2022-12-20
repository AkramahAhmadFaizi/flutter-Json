import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal
  ),
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
     body: Container(
       child: Center(
         child: FutureBuilder(
           future: DefaultAssetBundle
               .of(context)
               .loadString('load_json/person.json'),
           builder: (context, snapshot){
             //Decode Json
             var mydata = jsonDecode(snapshot.data.toString());
             return ListView.builder(
                 itemBuilder: (BuildContext context,int index) {
                   return Card(
                     color: Colors.blue,
                     shadowColor: Colors.black87,
                     margin: EdgeInsets.all(8.0),
                     child: Container(
                       color: Colors.amber,
                       padding: EdgeInsets.all(12.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Text("Name: "+mydata[index]['name'], style: TextStyle(
                             fontSize: 18.0
                           ),),
                           Text("Age: "+mydata[index]['age']),
                           Text("Height: "+mydata[index]['height']),
                           Text("Gender: "+mydata[index]['gender']),
                           Text("Hair Color: "+mydata[index]['hair_color']),
                         ],
                       ),
                     ),
                   );
                 },
                 itemCount: mydata == null ? 0 : mydata.length,
             );
           },
         )
       ),
     ),
    );
  }
}
