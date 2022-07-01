import 'package:flutter/material.dart';
import 'package:mex/ui/theme/app_button_style.dart';
import 'package:mex/ui/theme/app_colors.dart';
import 'package:mex/ui/theme/app_input_decorations.dart';
import 'package:mex/ui/theme/app_text_styles.dart';

class NumberCheckRegScreen extends StatelessWidget {
  const NumberCheckRegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Проверка номера'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.mainLightGrey,
          child: Column(
            children: [
              _NumberCheckFormWidget(),
              _ConfirmButtonWidget(),
              _HelperWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class _NumberCheckFormWidget extends StatelessWidget {
  _NumberCheckFormWidget({Key? key}) : super(key: key);

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
        Container(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                // controller: _loginTextController,
                style: AppTextStyle.baseInputTextStyle,
                decoration: AppInputDecoration.baseInputStyle.copyWith(
                  labelText: 'Код подтверждения',
                ),
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
            ],
          ),
        ),
      ],
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 55),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                style: AppButtonStyle.mainElevatedButton,
                child: Text('ПОДТВЕРДИТЬ')),
          ),
        ]));
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
        'Код должен прийти на ваш номер в течении 30 секунд. '
        'Если этого не произошло, нажмите отправить код повторно.',
        style: AppTextStyle.helperTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
