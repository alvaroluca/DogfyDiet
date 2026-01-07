import 'package:dogfydiet/core/config/app_theme.dart';
import 'package:dogfydiet/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Helper extension for widget tests to properly set up L10n context
extension WidgetTestHelperX on WidgetTester {
  /// Pumps a widget with proper MaterialApp wrapper and L10n support
  Future<void> pumpWidgetWithL10n(
    Widget widget, {
    Locale locale = const Locale('es', ''),
  }) async {
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', ''), Locale('en', '')],
        locale: locale,
        theme: AppTheme.lightTheme,
        home: Scaffold(body: widget),
      ),
    );
  }

  /// Pumps a widget with a custom MaterialApp for more control
  Future<void> pumpWidgetWithMaterialApp(
    Widget widget, {
    Locale locale = const Locale('es', ''),
    ThemeData? theme,
    Widget? home,
  }) async {
    final wrappedWidget = home ?? Scaffold(body: widget);

    await pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', ''), Locale('en', '')],
        locale: locale,
        theme: theme ?? AppTheme.lightTheme,
        home: wrappedWidget,
      ),
    );
  }
}

extension WidgetTestHelperXGoRouter on WidgetTester {
  /// Pumps a widget wrapped with a GoRouter and localization for widget tests
  Future<void> pumpWidgetWithGoRouter(
    Widget child, {
    String initialLocation = '/',
    List<RouteBase>? routes,
    Locale locale = const Locale('es', ''),
    ThemeData? theme,
  }) async {
    final goRouter = GoRouter(
      initialLocation: initialLocation,
      routes:
          routes ?? [GoRoute(path: '/', builder: (context, state) => child)],
    );
    await pumpWidget(
      MaterialApp.router(
        routerConfig: goRouter,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', ''), Locale('en', '')],
        locale: locale,
        theme: theme ?? AppTheme.lightTheme,
      ),
    );
  }
}
