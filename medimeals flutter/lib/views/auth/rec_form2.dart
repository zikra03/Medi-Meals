import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'components/recommended_form2.dart';
import 'components/form_header.dart';
class Form12 extends StatelessWidget {
  const Form12 ({super.key});

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
                Form8(),
                SizedBox(height: AppDefaults.padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
