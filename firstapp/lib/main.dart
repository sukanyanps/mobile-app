import 'package:flutter/material.dart';
import 'FoodMenu.dart';
 
void main() {
  runApp(MyHomePage());
}
 
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
 
//   @override
//   Widget build(BuildContext context) {
//     int counter = 0;
//     return 
//   }
// }

 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<FoodMenu> menus = [
    FoodMenu(name: "ผัดกระเพรา", price: 50),
    FoodMenu(name: "ผัดไท", price: 40),
    FoodMenu(name: "ผัดพริกหมู", price: 30),
    FoodMenu(name: "ข้าวไข่เจียว", price: 25),
    FoodMenu(name: "ผัดผักรวม", price: 35),
  ];
 
  void _incrementCounter(){
    setState(() {
      counter++;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hello world",
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 41, 223, 28),
              title: const Text("Hello world app.",
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueAccent),
 
              ),
            ),
            body: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (BuildContext context, int index) {
                FoodMenu menu = menus[index];
                return ListTile(
                  title: Text(menu.name,
                    style: const TextStyle(fontSize: 25),),
                  subtitle: Text("ราคา ${menu.price}", 
                    style: const TextStyle(fontSize: 15),),
                  );
              }
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _incrementCounter();
              },
              tooltip: "เพิ่มจำนวน",
              child: const Text("+"),
            ),
          )
    );;
  }
 
}