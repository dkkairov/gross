import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';

class CalculatorsMainScreenWidget extends StatelessWidget {
  const CalculatorsMainScreenWidget({Key? key}) : super(key: key);

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
            SizedBox(height: 10,),
            _CalculatorsContainerWidget(),
            SizedBox(height: 10,),
            _HomeAboutAppWidget(),
          ],
        ),
      ),
    );
  }
}


class _CalculatorsContainerWidget extends StatelessWidget {
  const _CalculatorsContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: AppColors.mainWhite,
      child: Column (
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Калькуляторы', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {Navigator.of(context).pushNamed("/reserves_main");},
                    child: Column(
                      children: [
                        Icon(Icons.filter),
                        Text('Кухни')
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(Icons.calculate_rounded),
                        Text('Шкафы')
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(Icons.cleaning_services),
                        Text('Настройки')
                      ],
                    ),
                  )
              ),
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
              Text('О калькуляторах', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
            ],
          ),
          SizedBox(height: 10,),
          Row(children: [
            Expanded(
              child: Text(
                '${' ' * 5} Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. \n ${' ' * 5} Lorem Ipsum является стандартной "рыбой" '
                    'для текстов на латинице с начала XVI века. \n ${' ' * 5} В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, '
                    'используя Lorem Ipsum для распечатки образцов. \n ${' ' * 5} Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн.',
                overflow: TextOverflow.clip,),
            )
          ],),
        ],
      ),
    );
  }
}

