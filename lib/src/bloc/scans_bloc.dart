import 'dart:async';

import 'package:qrreader/src/bloc/validator.dart';

import 'package:qrreader/src/provaiders/db_provaider.dart';

class ScansBloc with Validators {

  static final ScansBloc _singleton = new ScansBloc._iternal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._iternal() {
    //Obtener Scans de la Base de Datos
    obtenerScans();
  }

  final _scanController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream     => _scanController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scanController.stream.transform(validarHttp);

  dispose() {
    _scanController?.close();
  }

  obtenerScans() async {
    _scanController.sink.add(await DBProvaider.db.getTodosScans());
  }

  agregarScan(ScanModel scan) async {
    await DBProvaider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
     await DBProvaider.db.deleteScan(id);
     obtenerScans();
  }

  borrarScanTodos() async {
     await DBProvaider.db.deleteAll();
     obtenerScans();
  }

}