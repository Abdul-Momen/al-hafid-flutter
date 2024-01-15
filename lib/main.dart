import 'package:alhafidh/l10n/l10n.dart';
import 'package:alhafidh/states/GraphqlConfig/graphql_provider.dart';
import 'package:alhafidh/states/bindings/bindings.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/data/routes.dart';
import 'package:alhafidh/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'helper/object_box.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  await GetStorage.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GraphqlClass graphqlClass = GraphqlClass();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GraphQLProvider(
      client: graphqlClass.client,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            //for localization
            fallbackLocale: const Locale("ar"),
            locale: Preference.getIsArabicFlag()
                ? const Locale('ar')
                : const Locale('en'),
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            getPages: AllRoutes.allroutes,
            initialRoute: SplashScreen.routeName,
            initialBinding: AuthBinding(),
          );
        },
      ),
    );
  }
}
