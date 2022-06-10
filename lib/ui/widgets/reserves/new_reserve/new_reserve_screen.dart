import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';
import 'package:mebex_0_1_0/ui/theme/app_input_decorations.dart';
import 'package:mebex_0_1_0/ui/widgets/reserves/layouts/reserves_bottom_navigation_bar.dart';

class NewReserveScreenWidget extends StatefulWidget {
  const NewReserveScreenWidget({Key? key}) : super(key: key);

  @override
  State<NewReserveScreenWidget> createState() => _ReservesMainScreenWidgetState();
}

class _ReservesMainScreenWidgetState extends State<NewReserveScreenWidget> {
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
          InfoNewReserveScreenWidget(),
        ],
      ),
      bottomNavigationBar: ReservesBottomNavigationBar(),
    );
  }
}



class InfoNewReserveScreenWidget extends StatelessWidget {
  const InfoNewReserveScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        TextFormField(
          decoration: AppInputDecoration.baseInputStyle.copyWith(
            labelText: 'Материал',
          ),
        ),
        SizedBox(height: 2,),
        TextFormField(
          decoration: AppInputDecoration.baseInputStyle.copyWith(
            labelText: 'Цвет',
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text('X'),
            ),
            Expanded(
              flex: 1,
              child: Text('Y'),
            ),
            Expanded(
              flex: 1,
              child: Text('кол-во'),
            ),
          ],
        ),

      ],
    );
  }
}


