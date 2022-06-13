import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';
import 'package:mebex_0_1_0/ui/theme/app_input_decorations.dart';

class ReserveSize {
  final int reserveSizeId;
  final int reserveSizeX;
  final int reserveSizeY;
  final int reserveSizeQuantity;

  ReserveSize({
  required this.reserveSizeId,
  required this.reserveSizeX,
  required this.reserveSizeY,
  required this.reserveSizeQuantity
  });
}

class ReserveSizesListWidget extends StatefulWidget {

  ReserveSizesListWidget({Key? key}) : super(key: key);

  @override
  State<ReserveSizesListWidget> createState() => _ReserveSizesListWidget();
}

class _ReserveSizesListWidget extends State<ReserveSizesListWidget> {
  final _reserveSizes = [
    ReserveSize(
        reserveSizeId: 1,
        reserveSizeX: 500,
        reserveSizeY: 500,
        reserveSizeQuantity: 2,
    ),
    ReserveSize(
      reserveSizeId: 2,
      reserveSizeX: 300,
      reserveSizeY: 500,
      reserveSizeQuantity: 1,
    ),
    ReserveSize(
      reserveSizeId: 3,
      reserveSizeX: 200,
      reserveSizeY: 400,
      reserveSizeQuantity: 2,
    ),
  ];

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _reserveSizes.length,
            itemExtent: 100,
            itemBuilder: (BuildContext context, int index) {
              return Column(
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
                        SizedBox(width: 16,),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: AppInputDecoration.baseInputStyle.copyWith(
                              labelText: 'мм',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: AppInputDecoration.baseInputStyle.copyWith(
                              labelText: 'мм',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: AppInputDecoration.baseInputStyle.copyWith(
                              labelText: 'мм',
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
