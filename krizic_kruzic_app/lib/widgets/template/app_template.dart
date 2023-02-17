import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/widgets/buttons/floating_button.dart';

class AppTemplate extends StatelessWidget {
  final VoidCallback onPressed;
  final List<Widget> widget;

  const AppTemplate({
    Key? key,
    required this.onPressed,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: SingleChildScrollView(
        child: Column(children: widget),
      ),
      floatingActionButton: SizedBox(
        child: FloatingButtonWidget(
          onPressed: onPressed,
        ),
      ),
    );
  }
}
