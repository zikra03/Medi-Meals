import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'components/form_1.dart';
import 'components/form_header.dart';
class Form14 extends StatelessWidget {
  const Form14 ({super.key});

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
                Form9(),
                SizedBox(height: AppDefaults.padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
