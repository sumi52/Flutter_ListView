import 'package:flutter/material.dart';
import 'package:flutter_listview/temp_db.dart';

class HomePage extends StatefulWidget {
  static const String routeName ='/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;  // ListTile horizontal e use korbo but screen er
                  // width soman hobe tai size type er ekta variable declare korbo
  @override
  Widget build(BuildContext context) {
    size = MediaQuery. of(context).size;    //size ta ke ekhon initialized kore dicchi
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Example'),
      ),
        body: ListView.builder(  //ListView defult constructor r Listview.builder constructor er eki kaj jst ekhane barti sudhu index
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]), //index use kora hoy alternative colors ba kaj korar jonno, &annimation er jonno
              tileColor: index.isEven ? Colors.grey.shade200:    //insex jodi even hoy shade200 hobe otherwise shade500 hobe
              Colors.grey.shade500,
            );
          },
        ),
    );
  }

  ListView buildListView() {
    return ListView(      // alada method hisabe thaklo
         //scrollDirection: Axis.horizontal,  // ager moto vartically rakhte chai tai eta k desible kore dilam
          children: items.map((item) => SizedBox(          //ekhon sizedBox er o poyojon nai tao rakhlam
            width: size.width, // vertically kore dichi tai size.width na dile o hoto
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(        //tileVColor gulo buja jacche na tai ListTile ke (alt + enter) wrap with padding er modhe rakhbo
                tileColor: Colors.grey,  //list gulor color dilam, ekhon SizedBox na dile o chole tao rakhlam
                title: Text(item),
              ),
            ),
          )).toList(),
      );
  }
}
