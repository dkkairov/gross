import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/resources/resources.dart';
import 'package:mebex_0_1_0/ui/theme/app_button_style.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';
import 'package:mebex_0_1_0/ui/theme/app_input_decorations.dart';
import 'package:mebex_0_1_0/ui/theme/app_text_styles.dart';

class ReservesCardScreen extends StatelessWidget {
  const ReservesCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Материал'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.mainLightGrey,
          child: Column(
            children: [
              _ReservesCardFlieds(),
              _ConfirmButtonWidget(),
              _HelperWidget(),

            ],
          ),
        ),
      ),
    );
  }
}


class _ReservesCardFlieds extends StatelessWidget {
  const _ReservesCardFlieds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // if(errorText != null) ... [
        //   Text(
        //     errorText,
        //     style: TextStyle(
        //       color: AppColors.mainRed,
        //     ),
        //   ),
        //   SizedBox(height: 20,)
        // ],
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.mainWhite,
            child: Row(
                children: [
                  Image(
                    image: AssetImage(AppImages.dubNebraska),
                    height: 100,
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('ЛДСП',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'дуб Сонома',
                            style: TextStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]
                    ),
                  ),
                ],
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            enabled: false,
            decoration: AppInputDecoration.baseInputStyle.copyWith(
              labelText: 'Размер и кол-во',
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            enabled: false,
            decoration: AppInputDecoration.baseInputStyle.copyWith(
              labelText: 'Дата публикации',
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            enabled: false,
            decoration: AppInputDecoration.baseInputStyle.copyWith(
              labelText: 'Продавец',
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            enabled: false,
            decoration: AppInputDecoration.baseInputStyle.copyWith(
              labelText: 'Номер телефона',
            ),
          ),
          SizedBox(height: 2,),

        ]
    );
  }
}



class _ConfirmButtonWidget extends StatelessWidget {
  const _ConfirmButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 55),
                child: ElevatedButton(
                    onPressed: () {Navigator.of(context).pushNamed("/home");},
                    style: AppButtonStyle.mainElevatedButton,
                    child: Text('ПОЗВОНИТЬ')
                ),
              ),
            ]
        )
    );
  }
}



class _HelperWidget extends StatelessWidget {
  const _HelperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Пожаловаться на продавца',
        style: AppTextStyle.helperTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
