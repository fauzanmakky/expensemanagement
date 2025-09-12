import 'package:expensemanagement/commons/constants/route_constants.dart';
import 'package:expensemanagement/injection.dart';
import 'package:expensemanagement/routes.dart';
import 'package:expensemanagement/style/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: brightness == Brightness.light
            ? MaterialTheme().light()
            : MaterialTheme().dark(),
        initialRoute: RouteConstants.home,
        onGenerateInitialRoutes: (String initialRouteName) {
          return [
            AppRoute().onGenerateRoute(RouteSettings(name: initialRouteName)),
          ];
        },
        onGenerateRoute: AppRoute().onGenerateRoute,
      ),
    );
  }
}
