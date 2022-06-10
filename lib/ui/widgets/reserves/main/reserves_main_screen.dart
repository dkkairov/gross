import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';
import 'package:mebex_0_1_0/ui/widgets/reserves/layouts/reserves_bottom_navigation_bar.dart';
import 'package:mebex_0_1_0/ui/widgets/reserves/layouts/reserves_list_widget.dart';

class ReservesMainScreenWidget extends StatefulWidget {
  const ReservesMainScreenWidget({Key? key}) : super(key: key);

  @override
  State<ReservesMainScreenWidget> createState() => _ReservesMainScreenWidgetState();
}

class _ReservesMainScreenWidgetState extends State<ReservesMainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text('Материалы'),
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.filter_list_alt, color: AppColors.mainWhite,),
              label: Text('Фильтр', style: TextStyle(
                color: AppColors.mainWhite,
              ),),

            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          ReservesListWidget(),
        ],
      ),
      bottomNavigationBar: ReservesBottomNavigationBar(),
    );
  }
}
