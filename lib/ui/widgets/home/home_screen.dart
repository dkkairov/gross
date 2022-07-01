import 'package:flutter/material.dart';
import 'package:mex/ui/theme/app_colors.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Главная'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.mainLightGrey,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _HomeServicesWidget(),
            SizedBox(
              height: 10,
            ),
            _HomeAboutAppWidget(),
          ],
        ),
      ),
    );
  }
}

class _HomeServicesWidget extends StatelessWidget {
  const _HomeServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: AppColors.mainWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Сервисы',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/reserves_main");
                    },
                    child: Column(
                      children: [Icon(Icons.filter), Text('Запасы')],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/calculators_main");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.calculate_rounded),
                        Text('Калькулятор')
                      ],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [Icon(Icons.cleaning_services), Text('Услуги')],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [Icon(Icons.hourglass_bottom), Text('Работа')],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [Icon(Icons.man), Text('Поставщики')],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(Icons.precision_manufacturing_sharp),
                        Text('Проекты')
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeAboutAppWidget extends StatelessWidget {
  const _HomeAboutAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: AppColors.mainWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('О приложении',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${' ' * 5} Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. \n ${' ' * 5} Lorem Ipsum является стандартной "рыбой" '
                  'для текстов на латинице с начала XVI века. \n ${' ' * 5} В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, '
                  'используя Lorem Ipsum для распечатки образцов. \n ${' ' * 5} Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн.',
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
