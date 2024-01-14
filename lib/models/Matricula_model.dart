import 'package:matriculasapp/models/Carrera_model.dart';
import 'package:matriculasapp/models/Person_model.dart';

class Matricula {
  String fecha;
  String hora;
  Person alumno;
  Carrera carrera;
  Matricula({
    required this.fecha,
    required this.hora,
    required this.alumno,
    required this.carrera,
  });
}
