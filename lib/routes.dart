import 'package:expensemanagement/commons/constants/route_constants.dart';
import 'package:expensemanagement/module/expense/presentations/expense/expense_page.dart';
import 'package:expensemanagement/module/home/presentations/home/home_page.dart';
import 'package:flutter/material.dart';

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
          builder: (_) => ExpensePage(),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Center(child: Text("Something wrong")),
        );
    }
  }
}
