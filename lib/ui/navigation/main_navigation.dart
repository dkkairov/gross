import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/widgets/auth/auth_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/home/home_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/reg/main_reg_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/reg/number_check_reg_screen.dart';


abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const reg = '/reg';
  static const numberCheckReg = '/number_check_reg';
  static const home = '/home';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.auth;
  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth:  (context) => const AuthScreenWidget(),
    MainNavigationRouteNames.reg:  (context) => const MainRegScreenWidget(),
    MainNavigationRouteNames.numberCheckReg:  (context) => const NumberCheckRegScreen(),
    MainNavigationRouteNames.home:  (context) => const HomeScreenWidget(),
  };

  static Route<Object>? onGeneratedRoute(RouteSettings settings) {
    // switch (settings.name) {

    //   case MainNavigationRouteNames.tasks:
    //     final configuration = settings.arguments as TaskWidgetConfiguration;
    //     return MaterialPageRoute(builder: (context) {
    //       return TasksWidget(configuration: configuration);
    //     });
    //   case MainNavigationRouteNames.tasksForm:
    //     final groupKey = settings.arguments as int;
    //     return MaterialPageRoute(builder: (context) {
    //       return TaskFormWidget(groupKey: groupKey);
    //     });
    //   default:
    //     const widget = Text('Navigation Error');
    //     return MaterialPageRoute(builder: (context) => widget);
    // }
  }
}