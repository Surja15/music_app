import 'package:flutter/material.dart';
import 'package:music_by_surja/components/neu_box.dart';
import 'package:music_by_surja/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

//format time

String formatTime(Duration duration){
  String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

  return formattedTime;
}

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder:(context, value, child) {
      //get playlist
      final playlist = value.playlist;

      //get current song index
      final currentSong= playlist[value.currentSongIndex ?? 0];


      //return scaffold ui
      return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      
    body:SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
            //app bar
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
              //back button
              IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.inversePrimary,)),
        
              //title
              Text("P L A Y I N G"),
        
              //menu button
              IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.inversePrimary,)),
            ],),
            const SizedBox(height: 10),
        
            //album artwork
            NeuBox(child: Column(
              children: [
                //image
                ClipRRect(borderRadius:BorderRadius.circular(8),
                  child: Image.asset(currentSong.albumArtImagePath),),

                  //song and artist name
                   Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      //song and artist name
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(currentSong.songName, style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
                      Text(currentSong.artistName),
                      ],),
                    
                      //heart icon
                      const Icon(Icons.auto_awesome, color: Colors.red)
                    ],),
                  )
              ],
            ),),

            const SizedBox(height:15),
        
            //song duration progress
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    //start time
                    Text(formatTime(value.currentDuration)),
                  
                    //shuffle icon
                    Icon(Icons.shuffle),
                  
                    //repeat icon
                    Icon(Icons.repeat),
                  
                    //end time
                    Text(formatTime(value.totalDuration)),
                  ],
                                ),
                ),

                //song progress slider
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),),
                  child: Slider(min:0, max:value.totalDuration.inSeconds.toDouble(), 
                    value: value.currentDuration.inSeconds.toDouble(),
                    activeColor: Colors.red,
                     onChanged: (double double) {
                      //when user drags slider around
                     },
                     onChangeEnd: (double double){
                      value.seek(Duration(seconds:double.toInt()));

                     }
                     ),
                ),
              ],
            ),

            const SizedBox(height: 10),
        
            //playback controls
            Row(
              children: [
                //skip previous
                Expanded(child: GestureDetector(
                  onTap: value.playPreviousSong,
                  child: const NeuBox(
                  child: Icon(Icons.skip_previous_rounded, 
                  color: Colors.red,)
                  ),
                  ),
                  ),
                  const SizedBox(width: 10),

                //play pause
                  Expanded(flex: 2,
                    child: GestureDetector(
                  onTap: value.pauseOrResume,
                  child: NeuBox(
                  child: Icon(value.isPlaying ? Icons.pause :Icons.play_arrow, 
                  color: Colors.red,)
                  ),
                  ),
                  ),
                  const SizedBox(width: 10),

                //skip forward
                Expanded(child: GestureDetector(
                  onTap: value.playNextSong,
                  child: const NeuBox(
                  child: Icon(Icons.skip_next_rounded, 
                  color: Colors.red,)
                  ),
                  ),
                  ),

              ],
            )
        
          ],
        ),
      ),
    ),
    );
    }
    );
    
  }
}
