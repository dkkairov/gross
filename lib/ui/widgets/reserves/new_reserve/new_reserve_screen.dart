import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_input_decorations.dart';

class NewReserveScreen extends StatefulWidget {
  const NewReserveScreen({Key? key}) : super(key: key);

  @override
  State<NewReserveScreen> createState() => _NewReserveScreenState();
}

class _NewReserveScreenState extends State<NewReserveScreen> with SingleTickerProviderStateMixin {
  List<TextField> textFields = [];

  // final List<Size> _sizeWidgets = <Size>[];
  // List<String> listOfTextEntries = [];
  //
  // void addNewTextField () {
  //   setState(() {
  //     //add Phone objects dynamically here while setting up a controller in there.
  //     _sizeWidgets.add(Size(
  //       // fieldName: 'Phone Number ${_sizeWidgets.length + 1}',
  //       controller: returnController(
  //           "sizeController ${_sizeWidgets.length + 1}"),
  //     ));
  //     print(_sizeWidgets.length);
  //   });
  // }


  @override
  void initState(){
    super.initState();
    textFields.add(_buildTextField());
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            children: const [
              Expanded(
                flex: 1,
                child: Text('X',textAlign: TextAlign.center,),
              ),
              Expanded(
                flex: 1,
                child: Text('Y', textAlign: TextAlign.center,),
              ),
              Expanded(
                flex: 1,
                child: Text('кол-во', textAlign: TextAlign.center,),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ListView(
              //   shrinkWrap: true,
              //   children: List.generate(_sizeWidgets.length, (index) {
              //     return _sizeWidgets[index];
              //   }),
              // ),
              ListView(
                  shrinkWrap: true,
                  children: textFields
              ),
            ]
          ),
        ],
      ),
    );
  }

  Row _buildTextField(){
    return Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: TextField(
                    controller: widget.controller,
                    focusNode: focusNode,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: AppInputDecoration.baseInputStyle
                ),
              ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: TextField(
                  // controller: controller,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: AppInputDecoration.baseInputStyle
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: TextField(
                  // controller: controller,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: AppInputDecoration.baseInputStyle
              ),
            ),
          ),
        ],
      ),



      TextField(
        autofocus: true,
        keyboardType: TextInputType.number,
        maxLines: 1,
        decoration: AppInputDecoration.baseInputStyle,
        onSubmitted: (_){
          setState((){
            textFields.add(_buildTextField());
          });
        }
    );
  }


//
//   TextEditingController returnController(String controllerName) {
//     final controllerName = TextEditingController();
//     return controllerName;
//   }
//
//   //You can see the list of text entries from here.
//   void showTextFieldEntries() {
//     // listOfTextEntries = _sizeWidgets.map((index)=>index.controller.text.trim()).toList();
//     _sizeWidgets.map((index) {
//       //index.controller.text.trim();
//       print("these are the listOfTextEntries ${index.controller.text.trim()}");
//     }).toList();
//
//     // print("these are ${listOfTextEntries[0]}");
//   }
// }

//
//
// class Size extends StatefulWidget {
//   final String fieldName;
//   final TextEditingController controller;
//
//   const Size({Key? key, this.fieldName = '', required this.controller})
//       : super(key: key);
//
//   @override
//   State<Size> createState() => _SizeState();
// }
//
// class _SizeState extends State<Size> {
//   final focusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     focusNode.addListener(() {
//       context.findAncestorStateOfType<_NewReserveScreenState>()?.addNewTextField();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 5.0),
//       child: Row(
//         children: [
//           Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 2),
//                 child: TextField(
//                     controller: widget.controller,
//                     focusNode: focusNode,
//                     keyboardType: TextInputType.number,
//                     maxLines: 1,
//                     decoration: AppInputDecoration.baseInputStyle
//                 ),
//               ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: TextField(
//                   // controller: controller,
//                   keyboardType: TextInputType.number,
//                   maxLines: 1,
//                   decoration: AppInputDecoration.baseInputStyle
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: TextField(
//                   // controller: controller,
//                   keyboardType: TextInputType.number,
//                   maxLines: 1,
//                   decoration: AppInputDecoration.baseInputStyle
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Clean up the focus node when the Form is disposed.
//     focusNode.dispose();
//
//     super.dispose();
//   }
}
