import 'package:flutter/material.dart';

import 'constants.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key, required this.albumInfo}) : super(key: key);
  final Map<String, dynamic> albumInfo;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  bool isPlaying = false;
  double sliderValue = 0;

  /*スライダーと再生時間を連動させたい場合に使う関数。
  String formatTime(double time){
    Duration duration = Duration(seconds: time ~/1);
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(1, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: (){Navigator.of(context).pop();},
                          icon: const Icon(Icons.arrow_back_ios_sharp)
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Image.asset(widget.albumInfo['image'], fit: BoxFit.cover, width: MediaQuery.of(context).size.width,)
                  ),
                  const SizedBox(height: 30,),
                  Text(widget.albumInfo['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 2,),
                  Text(widget.albumInfo['author'], style: TextStyle(fontSize: 16,color: greyColor, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10,),
                  Slider(
                    value: sliderValue,
                    max: 300,

                    activeColor: Colors.white,
                    inactiveColor: const Color(0x20ffffff),
                    onChanged: (double value) {
                      setState((){
                        sliderValue = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0:00', style: TextStyle(color: greyColor),),
                        Text('5:00', style: TextStyle(color: greyColor),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.skip_previous, size: 50,),
                      IconButton(
                        iconSize: 80,
                        icon: Center(child: !isPlaying?const Icon(Icons.play_circle):const Icon(Icons.pause_circle)),
                        onPressed: (){
                          setState((){
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                      const Icon(Icons.skip_next, size: 50,),
                      const SizedBox(width: 20,),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
