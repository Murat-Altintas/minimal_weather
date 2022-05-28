import 'package:flutter/material.dart';
import 'package:minimal_weatherapp/services/control.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _apiListFill = ApiListFill();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: TextField(
                controller: _cityTextController,
                decoration: const InputDecoration(labelText: 'City'),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await _apiListFill.apiListFill(_cityTextController.text);
                      setState(() {
                        _apiListFill.imageChangeVoid();
                        print(_apiListFill.hourlyyyy.length);
                      });
                    },
                    child: const Text('Search')),
                ElevatedButton(
                    onPressed: () async {
                      await _apiListFill.apiListFill(_cityTextController.text);
                      setState(() {
                        _apiListFill.imageChangeVoid();
                        _apiListFill.hourlyyyy.clear();
                      });
                    },
                    child: const Text('Clean')),
              ],
            ),
            Text(_apiListFill.conditionText),
            Expanded(
              flex: 2,
              child: _apiListFill.hourlyyyy.isNotEmpty
                  ? ListView.builder(
                      itemCount: _apiListFill.hourlyyyy.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Lottie.asset("${_apiListFill.hourlyyyy[index]}"),
                        );
                      })
                  : const Text("test"),
            ),
          ],
        ),
      ),
    ));
  }
}
