import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('gu', 'IN'), Locale('hi', 'IN')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> languegeList=["English","ગુજરાતી","हिंदी"];
  String _choosedValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choosedValue=languegeList[0];
  }

  @override
  Widget build(BuildContext context) {

    getCurrentLang();

    return Scaffold(
      appBar: AppBar(
        title: Text('lang'.tr()),
        brightness: Brightness.dark,
        actions: [
          Center(
            child: PopupMenuButton(
                child: Row(
                  children: [
                    Text(_choosedValue,style: TextStyle(fontSize: 20),),
                    SizedBox(width: 15,),
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                          child: const Text('English'), value: 'English'),
                      new PopupMenuItem<String>(
                          child: const Text('ગુજરાતી'), value: 'ગુજરાતી'),
                      new PopupMenuItem<String>(
                          child: const Text('हिंदी'), value: 'हिंदी'),
                    ],
                onSelected: (value) {
                  _choosedValue=value;
                  changeLanguage(value);
                  setState(() {

                  });
                }),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'title'.tr(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'msg'.tr(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }


  changeLanguage(String lang){
    if (lang == "ગુજરાતી") {
      context.locale = Locale('gu', 'IN');
    } else if (lang == "हिंदी") {
      context.locale = Locale('hi', 'IN');
    } else {
      context.locale = Locale('en', 'US');
    }
    setState(() {

    });
  }

  getCurrentLang(){
    if (context.locale == Locale('gu', 'IN')) {
      _choosedValue = "ગુજરાતી";
    } else if (context.locale == Locale('hi', 'IN')) {
      _choosedValue = "हिंदी";
    } else {
      _choosedValue = "English";
    }

    setState(() {

    });
  }
}
