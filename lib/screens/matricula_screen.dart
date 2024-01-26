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
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  List<Carrera> selectedCarreras = [];

  void agregarMatricula() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: fechaController,
                  decoration: InputDecoration(labelText: "Fecha"),
                ),
                TextField(
                  controller: horaController,
                  decoration: InputDecoration(labelText: "Hora"),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nombre del Alumno"),
                ),
                TextField(
                  controller: addressController,
                  decoration:
                      InputDecoration(labelText: "Dirección del Alumno"),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Teléfono del Alumno"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: carrerasList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      title: Text(carrerasList[index].nombre),
                      value: selectedCarreras.contains(carrerasList[index]),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedCarreras.add(carrerasList[index]);
                          } else {
                            selectedCarreras.remove(carrerasList[index]);
                          }
                        });
                      },
                    );
                  },
                ),

                // DropdownButton<Carrera>(
                //   value: selectedCarrera,
                //   onChanged: (newValue) {
                //     setState(() {
                //       selectedCarrera = newValue;
                //     });
                //   },
                //   items: carrerasList
                //       .map<DropdownMenuItem<Carrera>>((Carrera value) {
                //     return DropdownMenuItem<Carrera>(
                //       value: value,
                //       child: Text(value.nombre),
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Agregar Carrera'),
                  onPressed: () {
                    // Create Matricula object here
                    // ...

                    Navigator.pop(context); // Close the modal
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController rucController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  void agregarUniversidad() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: nombreController,
                    decoration: InputDecoration(labelText: "Nombre"),
                  ),
                  TextField(
                    controller: direccionController,
                    decoration: InputDecoration(labelText: "Dirección"),
                  ),
                  TextField(
                    controller: rucController,
                    decoration: InputDecoration(labelText: "RUC"),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: telefonoController,
                    decoration: InputDecoration(labelText: "Teléfono"),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('Agregar'),
                    onPressed: () {
                      institucioneslist.add(Institucion(
                          nombre: nombreController.text,
                          direccion: direccionController.text,
                          ruc: rucController.text,
                          telefono: telefonoController.text,
                          matriculas: []));
                      Navigator.pop(context);
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
              agregarUniversidad();

              setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
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
                      onPressed: () {
                        agregarMatricula();

                        setState(() {});
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        institucioneslist.remove(institucionElement);
                      }),
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        institucionElement.matriculas.removeRange(
                            0, institucionElement.matriculas.length);
                      }),
                      icon: Icon(Icons.clear),
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
                          onPressed: () => setState(() {
                            e.alumno = Person(
                                name: "ANITA",
                                address: "CCALLE 456",
                                phone: "9876543");
                          }),
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() {
                            institucionElement.matriculas.remove(e);
                          }),
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
