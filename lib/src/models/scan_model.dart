import 'package:latlong/latlong.dart';

class ScanModel {
    int id;
    String tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }) {
      if (this.valor.contains('http')) {
        this.tipo = 'http';
      } else {
        this.tipo = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id    : json["id"],
        tipo  : json["tipo"],
        valor : json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "tipo"  : tipo,
        "valor" : valor,
    };

    LatLng getLatLng() {
    // geo:40.58671094554274,-74.13091078242189
      final latlng   = valor.substring(4).split(',');
      final latitud  = double.parse(latlng[0]);
      final longitud = double.parse(latlng[1]);

      return LatLng(latitud,longitud);
    }
}
