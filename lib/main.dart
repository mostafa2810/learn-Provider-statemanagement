import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /*first ChangeNotifierProvider 
      requierd create: have to take 3 parameters 
        1-context
        2-the return 
        3-child:widget
      */

    return ChangeNotifierProvider(
      create: (BuildContext context) => Model(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Learn Providers'),
          ),

          /*notice that you have to specify the type of the
         consumer (<Model> in this example)
         requierd builder: have to Take 3 parameters
           1-context
           2-anonymous object of the class  (<value> in this example)
           3-the return widget
        */
          body: Consumer<Model>(
            builder: (BuildContext context, value, child) {
              return Column(
                children: [
                  Center(child: Text(value.name)),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      value.changeName();
                    },
                    child: const Text("Do somthing here"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = 'Welcome';
  changeName() {
    name = 'Mostafa';
    notifyListeners();
     //to rebuild the consumer that consume to the same class

    
  }
}
