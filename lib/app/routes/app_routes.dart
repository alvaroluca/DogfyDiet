import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/presentation/features/home/home_page.dart';
import 'package:go_router/go_router.dart';

final appRoutes = <RouteBase>[
  GoRoute(path: AppPaths.home, builder: (context, state) => const HomePage()),
];
