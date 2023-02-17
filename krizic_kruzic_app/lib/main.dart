import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const KrizicKruzicApp());
}

class KrizicKruzicApp extends StatelessWidget {
  const KrizicKruzicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
    );
  }
}
