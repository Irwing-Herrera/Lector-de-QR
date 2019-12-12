import 'dart:async';

import 'package:qrreader/src/models/scan_model.dart';

class Validators {

  final validarGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final geoScans = scans.where((scan) => scan.tipo == 'geo').toList();
      sink.add(geoScans);
    }
  );

  final validarHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final hhtpScans = scans.where((scan) => scan.tipo == 'http').toList();
      sink.add(hhtpScans);
    }
  );
  
}