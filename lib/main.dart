import 'package:dogfydiet/core/config/app_theme.dart';
import 'package:dogfydiet/core/constants/app_constants.dart';
import 'package:dogfydiet/core/di/di.dart' as di;
import 'package:dogfydiet/core/l10n/app_localizations.dart';
import 'package:dogfydiet/core/routes/app_routes.dart';
import 'package:dogfydiet/features/top_blocs/languages_bloc/language_bloc.dart';
import 'package:dogfydiet/features/top_blocs/languages_bloc/language_state.dart';
import 'package:dogfydiet/features/top_blocs/top_bloc_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(debugLogDiagnostics: kDebugMode, routes: appRoutes);
    return TopBlocProviders(
      child: BlocBuilder<LanguagesBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state.locale,
            supportedLocales: const [Locale('es', ''), Locale('en', '')],
          );
        },
      ),
    );
  }
}
