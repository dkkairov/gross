import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mex/ui/theme/app_button_style.dart';
import 'package:mex/ui/theme/app_colors.dart';
import 'package:mex/ui/theme/app_input_decorations.dart';
import 'package:mex/ui/theme/app_text_styles.dart';

class MainRegScreenWidget extends StatelessWidget {
  const MainRegScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Регистрация'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.mainLightGrey,
          child: Column(
            children: [
              _RegFormWidget(),
              _ButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegFormWidget extends StatelessWidget {
  _RegFormWidget({Key? key}) : super(key: key);

  final UsNumberTextInputFormatter _phoneNumberFormatter =
      UsNumberTextInputFormatter();

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
                  labelText: 'Номер телефона',
                  prefixText: '+7 ',
                  prefixStyle: AppTextStyle.baseInputTextStyle,
                ),
                keyboardType: TextInputType.number,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  _phoneNumberFormatter,
                ],
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                // restorationId: 'name_field',
                // textInputAction: TextInputAction.next,
                // textCapitalization: TextCapitalization.words,
                decoration: AppInputDecoration.baseInputStyle.copyWith(
                  labelText: 'Имя',
                ),
                // onSaved: (value) {
                //   person.name = value;
                //   _phoneNumber.requestFocus();
                // },
                // validator: _validateName,
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                decoration: AppInputDecoration.baseInputStyle.copyWith(
                  labelText: 'Фамилия',
                ),
              ),
              SizedBox(
                height: 2,
              ),
              TextField(
                // controller: _passwordTextController,
                obscureText: true,
                style: AppTextStyle.baseInputTextStyle,
                decoration: AppInputDecoration.baseInputStyle.copyWith(
                  labelText: 'Пароль',
                ),
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                restorationId: 'retype_password_field',
                // focusNode: _retypePassword,
                decoration: AppInputDecoration.baseInputStyle.copyWith(
                  labelText: 'Повторите пароль',
                ),
                obscureText: true,
                // validator: _validatePassword,
                // onFieldSubmitted: (value) {
                // _handleSubmitted();
                // },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonsWidget extends StatelessWidget {
  const _ButtonsWidget({Key? key}) : super(key: key);

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
                  Navigator.of(context).pushNamed("/number_check_reg");
                },
                style: AppButtonStyle.mainElevatedButton,
                child: Text('ДАЛЕЕ')),
          ),
        ]));
  }
}
