import 'package:dogfydiet/core/di/di.dart';
import 'package:dogfydiet/features/top_blocs/languages_bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBlocProviders extends StatelessWidget {
  final Widget child;

  const TopBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguagesBloc>(
          create: (context) => LanguagesBloc(getIt()),
        ),
      ],
      child: child,
    );
  }
}
