import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rick_et_morty/model/details_perso.dart';

import 'model/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Result> listCharacter = [];
  late var jsonResponse;
  String apiAdresse = "https://rickandmortyapi.com/api/character";
  int _counter = 0;

  Future init(String adresseUrl) async{

    Uri url = Uri.parse(adresseUrl);

    Response responseAdresse = await http.get(url);
    jsonResponse = convert.jsonDecode(responseAdresse.body) as Map<String, dynamic>;
    int index = 0;

    while(index < jsonResponse["results"].length){
      setState(() {
        Result result = Result.json(jsonResponse["results"][index]);
        listCharacter.add(result);
      });
      index++;
    }

    if(jsonResponse['info']['next'] != null){
      init(jsonResponse['info']['next']);
    }
    print("JSON >> >> >> : " + jsonResponse['info']['next']);

  }




  @override void initState() {
    // TODO: implement initState
    init(apiAdresse);
    super.initState();
  }
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      body: bodyPage(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget bodyPage(){
    return GridView.builder(
        itemCount: listCharacter.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index){
      return InkWell(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(listCharacter[index].image),
                      fit: BoxFit.fill
                  )
              ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context){
                  return detailsPerso(perso: listCharacter[index]);
                }
            ));
          }
      );
    }
    );
  }
}

