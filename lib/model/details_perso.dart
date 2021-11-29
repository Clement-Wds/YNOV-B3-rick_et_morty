import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_et_morty/model/result.dart';

class detailsPerso extends StatefulWidget {
  Result perso;

  detailsPerso({required Result this.perso});

  @override
  State<StatefulWidget> createState() {
    return detailsPersoState();
  }
}

class detailsPersoState extends State<detailsPerso>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.perso.name),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: bodyPage(),
      ),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/4,
          height: MediaQuery.of(context).size.height/4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.perso.image),fit: BoxFit.fill
            )
          ),
        ),
        Text(widget.perso.status),
        Text(widget.perso.species),
        //ternaire -> remplace le if
        (widget.perso.gender=='Male')?const Icon(Icons.male, size: 30,):const Icon(Icons.female, size: 30,),
        Text(widget.perso.type),
        Text(widget.perso.url),
      ],
    );
  }

}