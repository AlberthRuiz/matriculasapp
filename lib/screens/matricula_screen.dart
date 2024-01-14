import 'package:flutter/material.dart';
import 'package:matriculasapp/models/Person_model.dart';

class MatriculasHome extends StatefulWidget {
  @override
  State<MatriculasHome> createState() => _MatriculasHomeState();
}

class _MatriculasHomeState extends State<MatriculasHome> {
  List<Person> peopleList = [
    Person(name: "Ana", address: "av 1245", phone: "12345679"),
    Person(name: "Lia", address: "av lima", phone: "9751665"),
    Person(name: "Maria", address: "av mlsis", phone: "88888888"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Matriculas App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              peopleList.add(
                Person(
                    name: "Pedro",
                    address: "av Larc0 789",
                    phone: "1938771",
                    dni: "12345678"),
              );
              setState(() {});
            },
            child: Text("Agregar"),
          ),
          ...peopleList.map((e) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.cyan,
                  radius: 25,
                  child: Text(
                    e.name[0],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                title: Text(e.name),
                subtitle: Text(e.address),
                trailing: Text(e.phone),
              )),
        ],
      ),
    );
  }
}
