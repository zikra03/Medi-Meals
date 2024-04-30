import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeeklyDietPlanPage extends StatelessWidget {
  const WeeklyDietPlanPage({Key? key}) : super(key: key);

  Future<void> generateWeeklyDietPlan(BuildContext context) async {
    // Send a request to the backend to generate the weekly diet plan
    var url = Uri.parse('http://localhost:5000/recommend-diet');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        // Pass any required user inputs here
      }),
    );

    if (response.statusCode == 200) {
      // Extract the PDF path from the response
      var data = jsonDecode(response.body);
      String pdfPath = data['pdf_path'];

      // Navigate to a page to display the PDF
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(pdfPath: pdfPath),
        ),
      );
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Diet Plan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                generateWeeklyDietPlan(context);
              },
              child: Text('Generate Weekly Diet Plan'),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfPath;

  const PdfViewerPage({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Diet Plan PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
