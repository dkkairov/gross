import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mex/ui/theme/app_button_style.dart';
import 'package:mex/ui/theme/app_colors.dart';
import 'package:mex/ui/theme/app_input_decorations.dart';
import 'package:mex/ui/theme/app_text_styles.dart';

class AuthScreenWidget extends StatefulWidget {
  const AuthScreenWidget({Key? key}) : super(key: key);

  @override
  State<AuthScreenWidget> createState() => _AuthScreenWidgetState();
}

class _AuthScreenWidgetState extends State<AuthScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Войти'),
      ),
      body: Container(
        color: AppColors.mainLightGrey,
        child: _LoginFormWidget(),
      ),
    );
  }
}

class _LoginFormWidget extends StatelessWidget {
  const _LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        _inputLoginFormWidget(),
      ],
    );
  }
}

class _inputLoginFormWidget extends StatefulWidget {
  const _inputLoginFormWidget({Key? key}) : super(key: key);

  @override
  State<_inputLoginFormWidget> createState() => _formWidgetState();
}

class _formWidgetState extends State<_inputLoginFormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final UsNumberTextInputFormatter _phoneNumberFormatter =
      UsNumberTextInputFormatter();

  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == '') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      errorText = 'Неправильный логин';
    }
    setState(() {});
  }

  void _reg() {
    Navigator.of(context).pushReplacementNamed('/reg');
  }

  void _resetPassword() {
    print('Reset password');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(
              color: AppColors.mainRed,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
        Container(
          child: Column(
            children: [
              TextField(
                controller: _loginTextController,
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
              TextField(
                controller: _passwordTextController,
                style: AppTextStyle.baseInputTextStyle,
                decoration: AppInputDecoration.baseInputStyle.copyWith(
                  labelText: 'Пароль',
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 55),
                child: ElevatedButton(
                    onPressed: _auth,
                    style: AppButtonStyle.mainElevatedButton,
                    child: Text('ВОЙТИ')),
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 55),
                child: ElevatedButton(
                    onPressed: _reg,
                    style: AppButtonStyle.addElevatedButton,
                    child: Text('РЕГИСТРАЦИЯ')),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: _resetPassword,
                  style: AppButtonStyle.mainTextButton,
                  child: Text('Забыли пароль?')),
            ],
          ),
        ),
      ],
    );
  }
}
