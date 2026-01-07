import 'package:dogfydiet/core/constants/app_assets.dart';
import 'package:dogfydiet/core/l10n/app_localizations.dart';

enum FoodProfileType { selective, gourmet, glutton }

extension FoodProfileTypeX on FoodProfileType {
  String get asset {
    switch (this) {
      case FoodProfileType.selective:
        return AppAssets.foodSelective;
      case FoodProfileType.gourmet:
        return AppAssets.foodGourmet;
      case FoodProfileType.glutton:
        return AppAssets.foodGlutton;
    }
  }

  String description(AppLocalizations l10n) {
    switch (this) {
      case FoodProfileType.selective:
        return l10n.foodProfileSelectiveDescription;
      case FoodProfileType.gourmet:
        return l10n.foodProfileGourmetDescription;
      case FoodProfileType.glutton:
        return l10n.foodProfileGluttonDescription;
    }
  }
}
