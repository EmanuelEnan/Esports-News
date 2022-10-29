import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'scrn/select_page.dart';

// String boxName = 'fake';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // // final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  // await Hive.initFlutter();

  // Hive.registerAdapter(ApiModelRecentSearchAdapter());
  // await Hive.openBox(boxName);

  // await Hive.openBox(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: SelectPage(),
    );
  }
}
