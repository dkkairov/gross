import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/widgets/calculators/main/calculators_main_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/primary/auth/auth_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/primary/home/home_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/primary/reg/main_reg_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/primary/reg/number_check_reg_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/reserves/main/reserves_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/reserves/new_reserve/new_reserve_screen.dart';
import 'package:mebex_0_1_0/ui/widgets/reserves/reserves_card/reserves_card_screen.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const reg = '/reg';
  static const number_check_reg = '/number_check_reg';
  static const home = '/home';
  static const reserves_main = '/reserves_main';
  static const reserves_card = '/reserves_card';
  static const calculators_main = '/calculators_main';
  static const new_reserve = '/reserves_main/new_reserve';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth:  (context) => const AuthScreenWidget(),
    MainNavigationRouteNames.reg:  (context) => const MainRegScreenWidget(),
    MainNavigationRouteNames.number_check_reg:  (context) => const NumberCheckRegScreen(),
    MainNavigationRouteNames.home:  (context) => const HomeScreenWidget(),
    MainNavigationRouteNames.reserves_main:  (context) => const ReservesMainScreenWidget(),
    MainNavigationRouteNames.reserves_card:  (context) => const ReservesCardScreen(),
    MainNavigationRouteNames.calculators_main:  (context) => const CalculatorsMainScreenWidget(),
    MainNavigationRouteNames.new_reserve:  (context) => const NewReserveScreen(),
  };

  Route<Object>? onGeneratedRoute(RouteSettings settings) {
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