import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'components/recommended_form.dart';
import 'components/form_header.dart';

class Form10 extends StatelessWidget {
  const Form10 ({Key? key}) : super(key: key);

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
                Form5(),
                SizedBox(height: AppDefaults.padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
