import 'package:course_app/common/custom_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DoctorNest());
}

class DoctorNest extends StatelessWidget {
  @override
  void initState() async {
    // await () => ("");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/intro",
      onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
        };
        WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder!(ctx));
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: CustomColors.app_bg_scaffold,
          primaryColor: CustomColors.app_primary,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: CustomColors.bodyTextColor,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
