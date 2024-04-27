import 'package:flutter/material.dart';
import 'package:g_pay/presentation/g_pay_screen/g_pay.dart';

class GPayRoutes {
  static const String gPayScreen = '/g_pay_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    gPayScreen: (context) => const GPayScreen(),
  };
}
