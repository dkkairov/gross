import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/resources/resources.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';
import 'package:mebex_0_1_0/ui/theme/app_input_decorations.dart';

class Reserve {
  final String imageName;
  final String reservesType;
  final String reservesName;
  final String reservesSize;
  final String sellerName;

  Reserve({
    required this.imageName,
    required this.reservesType,
    required this.reservesName,
    required this.reservesSize,
    required this.sellerName,

  });
}

class ReservesListWidget extends StatefulWidget {

  ReservesListWidget({Key? key}) : super(key: key);

  @override
  State<ReservesListWidget> createState() => _ReservesListWidgetState();
}

class _ReservesListWidgetState extends State<ReservesListWidget> {
  final _reserves = [
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),
    Reserve(
        imageName: AppImages.dubNebraska,
        reservesType: 'ЛДСП',
        reservesName: 'дуб Небраска',
        reservesSize: '500 х 300 - 2 шт',
        sellerName: 'Иван И.'
    ),

  ];

  var _filteredReserves = <Reserve> [];

  final _searchController = TextEditingController();

  void _searchMovies () {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredReserves = _reserves.where((Reserve movie){
        return movie.reservesName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredReserves = _reserves;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredReserves = _reserves;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 75),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredReserves.length,
            itemExtent: 100,
            itemBuilder: (BuildContext context, int index) {
              final reserve = _filteredReserves[index];
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.mainWhite,
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: AppColors.mainGrey.withOpacity(0.3)
                          )
                      )
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(reserve.imageName)),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text(
                                reserve.reservesName + ' (' + reserve.reservesType + ')',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                reserve.reservesSize,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 20,),
                              Text(
                                reserve.sellerName,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {Navigator.of(context).pushNamed("/reserves_card");},
                    ),
                  )
                ],
              );
            }),
        Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: AppInputDecoration.baseInputStyle.copyWith(
                prefixIcon: Icon(Icons.search),
                labelText: 'Поиск по названию',
              ),
            ),
            Container(
              height: 2,
              color: AppColors.mainLightGrey,
            )
          ],
        ),
      ],
    );
  }
}
