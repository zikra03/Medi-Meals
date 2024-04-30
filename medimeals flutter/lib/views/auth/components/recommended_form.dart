import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/validators.dart';
import 'form_button.dart';

class Form5 extends StatelessWidget {
  const Form5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDefaults.margin),
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.boxShadow,
        borderRadius: AppDefaults.borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Age",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make text bold
              fontSize: 18, // Increase font size
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            validator: Validators.required.call,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: AppDefaults.padding),
          const Text(
            "Gender",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make text bold
              fontSize: 18, // Increase font size
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: Validators.requiredWithFieldName('Name').call,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppDefaults.padding),
          const FormButton(),
          const SizedBox(height: AppDefaults.padding),
        ],
      ),
    );
  }
}
