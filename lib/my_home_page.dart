import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exmaple/currency_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {

        if (context.watch<CurrencyProvider>().loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: context.watch<CurrencyProvider>().ls.length,
          itemBuilder: (_, __) {
            return Text(context.watch<CurrencyProvider>().ls[__].ccyNmRu);
          },
        );
      }),
    );
  }
}
