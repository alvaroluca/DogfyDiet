import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/widgets/custom_button.dart';
import 'package:dogfydiet/presentation/widgets/dogfy_app_bar.dart';
import 'package:dogfydiet/presentation/widgets/lottie_custom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: const DogfyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.homeSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Expanded(
                    child: Center(
                      child: LottieCustom(
                        assetName: AppAssets.dogHome,
                        height: 300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(onPressed: () {}, text: l10n.homeCta),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
