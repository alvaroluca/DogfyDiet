import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/app_localizations.dart';

enum ActivityLevelType { low, medium, high }

extension ActivityLevelTypeX on ActivityLevelType {
  String get asset {
    switch (this) {
      case ActivityLevelType.low:
        return AppAssets.activityLow;
      case ActivityLevelType.medium:
        return AppAssets.activityMedium;
      case ActivityLevelType.high:
        return AppAssets.activityHigh;
    }
  }

  String description(AppLocalizations l10n) {
    switch (this) {
      case ActivityLevelType.low:
        return l10n.activityLowDescription;
      case ActivityLevelType.medium:
        return l10n.activityMediumDescription;
      case ActivityLevelType.high:
        return l10n.activityHighDescription;
    }
  }
}
