import 'package:fake_store_api/routes.dart';
import 'package:fake_store_api/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Secure Tech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
//.
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}
