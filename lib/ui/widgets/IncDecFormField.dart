import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class IncDecFormField extends StatefulWidget {
  const IncDecFormField({
    super.key,
    required this.onchange,
  });

  final Function(int) onchange;

  @override
  State<IncDecFormField> createState() => _IncDecFormFieldState();
}

class _IncDecFormFieldState extends State<IncDecFormField> {
  final TextEditingController controller = TextEditingController();
  int currentValue = 0;

  @override
  void initState() {
    super.initState();
    controller.text = currentValue.toString();
    controller.addListener(() {
      widget.onchange(currentValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            currentValue++;
            controller.text = currentValue.toString();
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () {
            if (currentValue > 1) {
              currentValue--;
              controller.text = currentValue.toString();
            }
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.remove,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
