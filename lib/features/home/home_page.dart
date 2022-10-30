import 'package:flutter/material.dart';
import 'package:flutter_hello_world/features/home/custom_inherited.dart';
import 'package:flutter_hello_world/features/home/pages/second_page.dart';
import 'package:flutter_hello_world/features/home/widgets/custom_stateful_widget.dart';
import 'package:flutter_hello_world/features/home/widgets/stateful_widget_with_global_key.dart';
import 'package:form/form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  var widgetList = [
    const CustomStatefulWidget(color: Colors.orange),
    const CustomStatefulWidget(color: Colors.purple),
  ];

  void _changeOrder() {
    setState(() {
      var statefulWidget = widgetList.removeAt(0);
      widgetList.add(statefulWidget);
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          // children: widgetList,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CustomInherited(
                counterValue: _counter, child: const CustomCounter()),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondPage()));
                },
                child: const Text("Go to the next page")),
            StatefulWidgetWithGlobalKey(key: globalKey),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FormPage()));
                },
                child: const Text("Go to form page"))
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  CustomInherited? inherited;
  var isLoading = false;
  var textController = TextEditingController();

  Future<void> httpRequest() {
    return Future.delayed(const Duration(seconds: 2));
  }

  void init() {
    setLoading(true);
    httpRequest().then((value) {
      setLoading(false);
    });
  }

  @override
  void initState() {
    init();
    textController.addListener(textControllerListener);
    super.initState();
  }

  void textControllerListener() {
    debugPrint(textController.text);
  }

  @override
  void reassemble() {
    init();
    super.reassemble();
  }

  @override
  void dispose() {
    textController.removeListener(textControllerListener);
    textController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void didChangeDependencies() {
    inherited = CustomInherited.of(context);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var myValue = inherited?.counterValue ?? 0;
    // return TextField(
    //   controller: textController,
    // );
    return isLoading
        ? CircularProgressIndicator()
        : SizedBox(
            height: 100,
            width: 100,
            child: Text(
              myValue.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          );
  }
}
