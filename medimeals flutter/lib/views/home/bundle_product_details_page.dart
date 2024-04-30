import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/buy_now_row_button.dart';
import '../../core/components/price_and_quantity.dart';
import '../../core/components/product_images_slider.dart';
import '../../core/components/review_row_button.dart';
import '../../core/constants/constants.dart';
import 'components/bundle_meta_data.dart';
import 'components/bundle_pack_details.dart';

class BundleProductDetailsPage extends StatelessWidget {
  const BundleProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImagesSlider(
              images: [
                'https://cdn.tarladalal.com/members/9306/big/big_moong_dal_idli-16758.jpg',
                'https://peppybowl.in/wp-content/uploads/2021/09/Natukodi-Soup.jpg',
                'https://www.sailusfood.com/wp-content/uploads/2015/02/red-aval-upma.jpg',
              ],
            ),
            /* <---- Product Data -----> */
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'dish detail',
                      style:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const PriceAndQuantityRow(
                      currentPrice: 20,
                      quantity: 2,
                      Protein: 2.3,
                      Fats: 6.5,
                      Fibers: 0.4,
                      Calories: 120,
                      GlycemicIndex:18
                  ),
                  const SizedBox(height: AppDefaults.padding / 2),
                  const BundleMetaData(),
                  const PackDetails(),
                  const ReviewRowButton(totalStars: 5),
                  const Divider(thickness: 0.1),
                  BuyNowRow(
                    onBuyButtonTap: () {},
                    onCartButtonTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}