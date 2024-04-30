import 'package:flutter/material.dart';

import '../../../core/components/network_image.dart';
import '../../../core/constants/constants.dart';

class PackDetails extends StatelessWidget {
  const PackDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.25),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Micro Nutrients',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          /* <---- Items here -----> */
          nutrientTile(context, 'Protein', '2.3'),
          nutrientTile(context, 'Fats', '6.5'),
          nutrientTile(context, 'Fiber', '0.4'),
          nutrientTile(context, 'Calories', '120 kcal'),
          nutrientTile(context, 'Glycemic Index', '18'),
          const SizedBox(height: AppDefaults.padding),
        ],
      ),
    );
  }

  Widget nutrientTile(BuildContext context, String nutrient, String value) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(nutrient),
                content: Text('Detailed information about $nutrient...'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const AspectRatio(
          aspectRatio: 1 / 1,
          child: NetworkImageWithLoader('https://i.imgur.com/Y0IFT2g.png'),
        ),
      ),
      title: Text(nutrient),
      trailing: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black),
      ),
    );
  }
}