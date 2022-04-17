import 'package:expense_tracker/pages/homePage.dart';
import 'package:expense_tracker/providers/homePageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //This will set the orientation to the potrait mode only
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
                .copyWith(secondary: const Color.fromARGB(255, 168, 182, 5))),
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: const MyHomePage()));
  }
}
