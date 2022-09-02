import 'package:flutter/material.dart';
import 'package:flutter_assignment_final/constants.dart';
import 'package:flutter_assignment_final/play.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: const [Icon(Icons.search), SizedBox(width: 10,)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('あなたへのおすすめ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 225,
              child: ListView.builder(itemBuilder: (context, index){
                return AlbumCard(albumInfo: albumList[index]);
              },
                itemCount: albumList.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('カテゴリー', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 230,
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: const [
                  CategoryCard(name: 'クラシック',color1: Colors.purple, color2: Colors.black54,),
                  CategoryCard(name: 'カントリー',color1: Colors.amberAccent, color2: Colors.brown,),
                  CategoryCard(name: 'ポップ',color1: Colors.pinkAccent, color2: Colors.red,),
                  CategoryCard(name: 'ロック',color1: Colors.lightBlueAccent, color2: Colors.blue,),
                  CategoryCard(name: 'ジャズ',color1: Colors.lightGreenAccent, color2: Colors.green,),
                  CategoryCard(name: 'パンク',color1: Colors.redAccent, color2: Colors.red,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key, required this.albumInfo}) : super(key: key);

  final Map<String, dynamic> albumInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return PlayScreen(albumInfo: albumInfo);}));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(albumInfo['image'], width: 160, height: 160,),
            ),
            const SizedBox(height: 5,),
            Text(albumInfo['title'], overflow: TextOverflow.ellipsis,),
            const SizedBox(height: 1,),
            Text(albumInfo['author'], style: TextStyle(color: greyColor),overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.name, required this.color1, required this.color2,}) : super(key: key);
  final String name;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: color,
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: <Color>[
            color1,
            color2,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Center(child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold),)),
    );
  }
}
