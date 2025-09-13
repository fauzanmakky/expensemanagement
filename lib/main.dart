import 'package:expensemanagement/commons/constants/route_constants.dart';
import 'package:expensemanagement/injection.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_bloc.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_event.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_bloc.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_event.dart';
import 'package:expensemanagement/routes.dart';
import 'package:expensemanagement/style/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final expenseBloc = getIt<ExpenseBloc>();
  expenseBloc.add(InsertDefaultCategoriesEvent());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExpenseBloc>(create: (_) => getIt<ExpenseBloc>()),
        BlocProvider<HomeBloc>(
          create: (_) => getIt<HomeBloc>()..add(LoadHomeData()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          final brightness = View.of(
            context,
          ).platformDispatcher.platformBrightness;
          return MaterialApp(
            title: 'Flutter Demo',
            theme: brightness == Brightness.light
                ? MaterialTheme.lightTheme
                : MaterialTheme.darkTheme,
            initialRoute: RouteConstants.home,
            onGenerateInitialRoutes: (String initialRouteName) {
              return [
                AppRoute().onGenerateRoute(
                  RouteSettings(name: initialRouteName),
                ),
              ];
            },
            onGenerateRoute: AppRoute().onGenerateRoute,
          );
        },
      ),
    );
  }
}
