import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import 'form1.dart';

class Form6 extends StatelessWidget {
  const Form6({
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
          _buildOptionSelector(
            label: "Do you Exercise?",
            options: ["Regular", "Often", "Never"],
          ),
          const SizedBox(height: AppDefaults.padding),
          _buildOptionSelector(
            label: "How often does your Glucose level go high?",
            options: ["Frequently", "Often", "Rarely"],
          ),
          Container(
            color: Colors.grey, // Color of the SizedBox
            height: AppDefaults.padding, // Height of the SizedBox
          ),
          const FormButton3(),
          const SizedBox(height: AppDefaults.padding),
        ],
      ),
    );
  }

  Widget _buildOptionSelector({
    required String label,
    required List<String> options,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label(${options.join(', ')})",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            // Handle the selected option
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select an option";
            }
            return null;
          },
        ),
      ],
    );
  }
}
