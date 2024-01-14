import 'package:flutter/material.dart';
import 'package:matriculasapp/models/person_model.dart';
import 'package:matriculasapp/models/carrera_model.dart';
import 'package:matriculasapp/models/institucion_model.dart';
import 'package:matriculasapp/models/matricula_model.dart';

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

  List<Carrera> carrerasList = [
    Carrera(nombre: "Contabilidad", duracion: "5 años"),
    Carrera(nombre: "Diseño", duracion: "5 años"),
  ];

  List<Matricula> matriculasList = [];

  List<Institucion> institucioneslist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matriculas App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //AGREGAR INSTITUCIONES
              institucioneslist.add(
                Institucion(
                  nombre: "UTP",
                  direccion: "AV LIMA 123123",
                  ruc: "12345678",
                  telefono: "98765431",
                  matriculas: [],
                ),
              );
              setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("Agregar"),
          ),
          ...institucioneslist.map(
            (institucionElement) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${institucionElement.nombre}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        institucionElement.matriculas.add(
                          Matricula(
                            fecha: "14/01/2024",
                            hora: "11:05",
                            alumno: Person(
                                name: "pedro",
                                address: "Avv cusco 123456",
                                phone: "987654321"),
                            carrera: carrerasList[1],
                          ),
                        );
                      }),
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                ...institucionElement.matriculas.map(
                  (e) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      // radius: 25,
                      child: Text(
                        e.alumno.name[0],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    title: Text("${e.alumno.name} - ${e.carrera.nombre}"),
                    subtitle: Text(e.alumno.address),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Editando....");
                            e.alumno = Person(
                                name: "ANITA",
                                address: "CCALLE 456",
                                phone: "9876543");
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("Eliminando....");
                            matriculasList.remove(e);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
