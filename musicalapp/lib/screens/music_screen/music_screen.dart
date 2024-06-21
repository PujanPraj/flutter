import 'package:flutter/material.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/constants/text_style.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Music",style: ourStyle(size: 20),),
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          ListTile(
            leading:const Icon(Icons.music_note,size: 30,color: textColor,),
            title: Text("Sadhana",style: ourStyle(),),
            subtitle: Text("John Chamling",style: ourStyle(size: 16),),
            trailing: const Icon(Icons.play_arrow,color: textColor,size: 30,),
          )
        ],
      ),
    );
  }
}
