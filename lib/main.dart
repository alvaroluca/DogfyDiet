import 'package:dogfydiet/app/config/app_theme.dart';
import 'package:dogfydiet/app/constants/app_constants.dart';
import 'package:dogfydiet/app/di/di.dart' as di;
import 'package:dogfydiet/app/l10n/app_localizations.dart';
import 'package:dogfydiet/presentation/top_blocs/languages_bloc/language_bloc.dart';
import 'package:dogfydiet/presentation/top_blocs/languages_bloc/language_state.dart';
import 'package:dogfydiet/presentation/top_blocs/top_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TopBlocProviders(
      child: BlocBuilder<LanguagesBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text(AppConstants.appName),
              ),
              body: Container(),
            ),
          );
        },
      ),
    );
  }
}
