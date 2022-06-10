import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';

class ReservesBottomNavigationBar extends StatefulWidget {
  const ReservesBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<ReservesBottomNavigationBar> createState() => _ReservesBottomNavigationBarState();
}

class _ReservesBottomNavigationBarState extends State<ReservesBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.mainGrey, width: 1),
          )
      ),
      child:BottomNavigationBar(
        // currentIndex: _currentIndex, //New
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Добавить',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: 'Мои запасы',
          ),
        ],
        // onTap: onSelectTab,
      ),
    );
  }
}