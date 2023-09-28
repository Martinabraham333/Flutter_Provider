import 'package:cartprovider/home.dart';
import 'package:cartprovider/models/cart.dart';
import 'package:cartprovider/screens/cartView.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
       debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Color.fromARGB(255, 81, 105, 136),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Cartview()));
                    },
                  ),
                  Text(ccart.count.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 222, 217, 217),
        body: Center(child: ProductListView()));
  }
}
