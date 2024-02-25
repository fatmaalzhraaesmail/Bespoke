import 'package:bespoke/utilities/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bespoke/base/blocs/lang_bloc.dart';
import 'package:bespoke/base/blocs/theme_bloc.dart';
import 'package:bespoke/handlers/shared_handler.dart';
import 'package:bespoke/routers/navigator.dart';
import 'package:bespoke/routers/routers.dart';
import 'package:bespoke/utilities/theme/colors/colors.dart';
import 'package:bespoke/utilities/theme/colors/light_theme.dart';
import 'package:hexcolor/hexcolor.dart';

import 'handlers/localization_handler.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await SharedHandler.init();
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    langBloc.initLang();
    themeBloc.initTheme();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: langBloc.langStream,
      builder: (context, snapshot) {
        return StreamBuilder<ColorsTheme?>(
            stream: themeBloc.themeStream,
            builder: (context, snapshot) {
              ColorsTheme theme = themeBloc.theme.valueOrNull ?? LightTheme();
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.light,
              ));
              return MaterialApp(
                title: 'Project Title',

                theme: ThemeData(
                    pageTransitionsTheme: const PageTransitionsTheme(
                      builders: {
                        TargetPlatform.android:
                            CupertinoPageTransitionsBuilder(),
                        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                      },
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    primaryTextTheme: TextTheme(
                      bodyText1: TextStyle(color: Colors.black),
                    ),
                    bottomAppBarTheme: BottomAppBarTheme(
                      color: HexColor('f7f7f7'),
                      height: 40,
                    ),
                    appBarTheme: AppBarTheme(

                        // backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                          // statusBarColor: AppTextStyles.maincolor,
                          statusBarIconBrightness: Brightness.light,
                        ),
                        centerTitle: true,
                        // backgroundColor: AppTextStyles.maincolor,
                        elevation: 0.0,
                        iconTheme: IconThemeData(
                          color: Colors.white,
                          size: 26,
                        ),
                        actionsIconTheme: IconThemeData(
                          color: Colors.white,
                          size: 26,
                        ),
                        titleTextStyle:
                            AppTextStyles.appBar.copyWith(fontSize: 24)),
                    colorScheme: ColorScheme(
                      primary: theme.primary,
                      onBackground: theme.background,
                      onError: theme.error,
                      onSecondary: theme.secondery,
                      onSurface: Colors.white,
                      background: theme.background,
                      secondary: theme.secondery,
                      surface: Color(0xFF0A0E21),
                      error: theme.error,
                      onPrimary: theme.primary,
                      brightness: Brightness.light,
                    ),
                    fontFamily:
                        langBloc.lang.valueOrNull == 'en' ? "roboto" : "cairo",
                    scaffoldBackgroundColor: Colors.white,
                    backgroundColor: Colors.white),
                debugShowCheckedModeBanner: false,

                initialRoute: Routes.splash,
                navigatorKey: CustomNavigator.navigatorState,
                navigatorObservers: [CustomNavigator.routeObserver],
                scaffoldMessengerKey: CustomNavigator.scaffoldState,
                onGenerateRoute: CustomNavigator.onCreateRoute,
                supportedLocales: const [Locale("en"), Locale("ar")],
                localizationsDelegates: const [
                  AppLocale.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (currentLang, supportedLangs) {
                  // String? savedLgnCode = pref!.getString("lgnCode");
                  if (currentLang != null) {
                    for (Locale locale in supportedLangs) {
                      if (locale.languageCode == currentLang.languageCode) {
                        return locale;
                      }
                    }
                  }
                  return supportedLangs.first;
                },
                locale: Locale(langBloc.lang.valueOrNull ?? "en"),
                // home:CustomNavigator.push(Routes.splash),
              );
            });
      },
    );
  }
}