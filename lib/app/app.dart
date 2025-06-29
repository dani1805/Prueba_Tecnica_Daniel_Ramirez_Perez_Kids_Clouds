import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/config/service_locator.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<HomeBloc>())],
      child: MaterialApp.router(
        routerConfig: appRouter,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black,
          ),
          appBarTheme: const AppBarTheme(color: Colors.black),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return const Locale('en');
        },
        debugShowCheckedModeBanner: false,
        /*builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) async {
                switch (state.runtimeType) {
                  case AuthenticationUnauthenticated:
                    appRouter.go(Routes.login);
                    break;
                  case AuthenticationAuthenticated:
                    appRouter.go(Routes.home);
                }
              },
              child: BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) => child ?? const SizedBox.shrink(),
              ),
            );
          },*/
      ),
    );
  }
}
