import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/app_localizations.dart';

enum WeightShapeType { thin, normal, fat }

extension WeightShapeTypeX on WeightShapeType {
  double get defaultWeight {
    switch (this) {
      case WeightShapeType.thin:
        return 15;
      case WeightShapeType.normal:
        return 20;
      case WeightShapeType.fat:
        return 25;
    }
  }

  String get asset {
    switch (this) {
      case WeightShapeType.thin:
        return AppAssets.weightThin;
      case WeightShapeType.normal:
        return AppAssets.weightNormal;
      case WeightShapeType.fat:
        return AppAssets.weightFat;
    }
  }

  String description(AppLocalizations l10n) {
    switch (this) {
      case WeightShapeType.thin:
        return l10n.weightStepOptionThin;
      case WeightShapeType.normal:
        return l10n.weightStepOptionNormal;
      case WeightShapeType.fat:
        return l10n.weightStepOptionFat;
    }
  }
}
