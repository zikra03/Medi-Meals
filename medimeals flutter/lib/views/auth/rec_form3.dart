import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'components/form.dart';
import 'components/form_header.dart';
class Form13 extends StatelessWidget {
  const Form13 ({super.key});

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
                Form6(),
                SizedBox(height: AppDefaults.padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
