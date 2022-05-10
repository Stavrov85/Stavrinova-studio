import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return Scaffold(
                appBar: AppBar(
                  title: Text('Меню'),
                ),
                body:Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(5)),
                    ElevatedButton(onPressed: (){}, child: const Text('Первая кнопка')),
                    const Padding(padding: EdgeInsets.all(5)),
                    ElevatedButton(onPressed: (){}, child: const Text('Вторая кнопка')),
                    const Padding(padding: EdgeInsets.all(5)),
                    ElevatedButton(onPressed: (){}, child: const Text('Третья кнопка'))
                  ],
                ),
              );
            }));
          }, icon: Icon(Icons.menu))
        ],
        title: const Text('Stavrinova Studio', style: TextStyle(
          fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 35,
        ),),
        centerTitle: true,
      ),
      body: Center(
      child: Container (
        padding: EdgeInsets.all(25),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(radius: 70, backgroundImage: AssetImage('assets/litso-klipart.png')),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/todo');
            }, child: const Text('Составить список клиентов'))

          ],
        )
      )
      )
    );
  }
}
