import 'package:calculadora_app/service/theme_state.dart';
import 'package:calculadora_app/views/page_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TemaEstado>(create: (_) => TemaEstado())
      ],
      child: Consumer<TemaEstado>(
        builder: (context, temaA, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: temaA.temaActual,

              //title: 'Material App',
              home: HomeApp());
        },
      ),
    );
  }
}
