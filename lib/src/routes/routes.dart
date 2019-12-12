import 'package:flutter/material.dart';

import 'package:qrreader/src/pages/home_page.dart';
import 'package:qrreader/src/pages/mapa_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
        'home'          : (BuildContext context) => HomePage(),
        'mapa'          : (BuildContext context) => MapaPage(),
  };
}