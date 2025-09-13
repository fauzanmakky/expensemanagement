import 'package:expensemanagement/commons/constants/route_constants.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/picker/picker_cubit.dart';
import 'package:expensemanagement/module/expense/presentations/expense/expense_page.dart';
import 'package:expensemanagement/module/home/presentations/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => HomePage(),
        );
      case RouteConstants.expense:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>
              BlocProvider(create: (_) => PickerCubit()..reset(), child: ExpensePage()),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Center(child: Text("Something wrong")),
        );
    }
  }
}
