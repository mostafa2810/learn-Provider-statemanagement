import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* part2 before Selector:
     first of all excuse my english grammar|---Egyption bro------| 
     you might notice that if you press the button1
     the text 1 changed and that because of the rebuild of
     the consumer but the problem here is that when you press the
     the button1 all of 2 buttons and text have been rebuilt
     even if the only change you can see is the text 1 change  and 
     that is because the type of all consumers is<Model>
     so to have more control over the rebuild you want to happen
     we will use the selectors

     */
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Learn Providers'),
          ),
          body: Column(
            children: [
              /*notice that you have to specify the type of the
         consumer (<Model> in this example)
         requierd builder: have to Take 3 parameters
           1-context
           2-anonymous object of the class  (<value> in this example)
           3-the return widget
        */
              Consumer<Model>(
                builder: (BuildContext context, value, child) {
                  return Column(
                    children: [
                      Center(child: Text(value.doSomthing1)),
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          value.changeName1();
                        },
                        child: const Text("My name is"),
                      ),
                    ],
                  );
                },
              ),
              Consumer<Model>(
                builder: (BuildContext context, value, child) {
                  return Column(
                    children: [
                      Center(child: Text(value.doSomthing2)),
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          value.changeName2();
                        },
                        child: const Text("My Email is:"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Model with ChangeNotifier {
  String doSomthing1 = 'Welcome';
  String doSomthing2 = 'Welcome';
  changeName1() {
    doSomthing1 = 'Mostafa Helaly';
    notifyListeners();
    //to rebuild the consumer that consume to the same class
  }

  changeName2() {
    doSomthing2 = 'mostafa.helaly2810@gmail.com';
    notifyListeners();
    //to rebuild the consumer that consume to the same class
  }
}
