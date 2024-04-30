import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/components/network_image.dart';
import '../../core/constants/constants.dart';
import '../../core/routes/app_routes.dart';

class LoginOrSignUpPage extends StatelessWidget {
  const LoginOrSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Spacer(flex: 2),
          _AppLogoAndHeadline(),
          Spacer(),
          _Footer(),
          Spacer(),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
              child: const Text('Login With Email'),
            ),
          ),
        ),
        const SizedBox(height: AppDefaults.margin),
        Text(
          'OR',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppDefaults.margin),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.googleIcon),
              iconSize: 48,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.facebookIcon),
              iconSize: 48,
            ),
          ],
        ),
      ],
    );
  }
}

class _AppLogoAndHeadline extends StatelessWidget {
  const _AppLogoAndHeadline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: const AspectRatio(
            aspectRatio: 1 / 1,
            child: NetworkImageWithLoader(AppImages.roundedLogo),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to our',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24), // Adjust the font size as needed
              ),
              Text(
                'MediMeals',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Change color to your desired color
                  fontSize: 36, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        )

      ],
    );
  }
}
