import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'components/recommended_form1.dart';
import 'components/form_header.dart';
class Form11 extends StatelessWidget {
  const Form11 ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Formpageheader(),
                Form7(),
                SizedBox(height: AppDefaults.padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
