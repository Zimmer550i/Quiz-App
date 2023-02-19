import 'package:flutter/material.dart';

class ChoiceWidget extends StatelessWidget {
  final String str;
  final bool isSelected;
  final bool? isCorrect;
  final bool? answer;
  const ChoiceWidget(
      {super.key, required this.str, this.isSelected = false, this.isCorrect, this.answer});

  Color? render(){
    if(isSelected){
      if(isCorrect==null){
        return Colors.lightBlueAccent;
      }else if(isCorrect==true){
        return Colors.greenAccent;
      }else if(isCorrect==false){
        return Colors.redAccent;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: render(),
          // color: isSelected
          //     ? isCorrect==null
          //         ? Colors.blueAccent
          //         : null
          //     : isCorrect!
          //         ? Colors.greenAccent
          //         : Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey.shade300 : null,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                str,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
