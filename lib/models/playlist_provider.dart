import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_by_surja/models/song.dart';
class PlaylistProvider extends ChangeNotifier{
  //playlist of songs

  final List<Song> _playlist = [
    //song 1
    Song(songName: "Straight Outta Compton",
     artistName: "NWA", 
     albumArtImagePath: "lib/assets/images/NWA.png", 
     audioPath: "https://ia801602.us.archive.org/25/items/n.w.a.-straight-outta-compton/Straight%20Outta%20Compton/01-Straight%20Outta%20Compton.mp3"
     ),

    //song 2 
    Song(songName: "The Rebel Path - Cello",
     artistName: "Cyberpunk", 
     albumArtImagePath: "lib/assets/images/cello.png", 
     audioPath: "https://ia803403.us.archive.org/25/items/cyberpunk-albums/Cyberpunk_2077%5BM%5D/Cyberpunk%202077%20Original%20Soundtrack%20%5BMP3%5D/Disc%201/1.03%20The%20Rebel%20Path.mp3"
     ),

    //song 3
    Song(songName: "Thunderstruck",
     artistName: "AC/DC", 
     albumArtImagePath: "lib/assets/images/acdc.png", 
     audioPath: "https://ia803206.us.archive.org/23/items/Acdc-Thunderstruck/A1-Thunderstruck_01.mp3"
     ),

  ];

  //currently playing

  int? _currentSongIndex;

  //                                Gaana bajana (Audioplayer)

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer(); //starting up

  //duration
  Duration _currentDuration=Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor

 PlaylistProvider() {
  listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
  
    final String path = _playlist[_currentSongIndex!].audioPath;
    
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(path));
      _isPlaying = true;
    
  notifyListeners();
}

  //pause the song
  void pause() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume
  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }


  //pause or resume
  void pauseOrResume() async {
    if(_isPlaying){
      pause();
    }else{
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in current song
  void seek(Duration position) async{
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong(){
    if(_currentSongIndex != null){
      if(_currentSongIndex! < _playlist.length -1){
        //goto next song if not last
        currentSongIndex =_currentSongIndex! + 1;
      }else{
        //go back to first
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() async {
    //if more than 5 seconds played, go to beginning of song
    if(_currentDuration.inSeconds > 5){
      seek(Duration.zero);
    }
    //if its within first 5 seconds, go to prev song
    else{
      if(_currentSongIndex! >0){
        currentSongIndex = _currentSongIndex! - 1;

      }else{
        //if its first song, loop back to last song
        currentSongIndex = _playlist.length-1;
      }
    }
  }

  //listen to durations

  void listenToDuration(){
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration = newDuration;
      notifyListeners();

    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion.
    _audioPlayer.onPlayerComplete.listen((event){
      playNextSong();

    });

  }

  //dispose audio player
  void dispose(){
    _audioPlayer.dispose();
    super.dispose();
  }

  //Getters

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //setters

  set currentSongIndex(int? newIndex){
    _currentSongIndex = newIndex;  //update current song index
if(newIndex != null){
  play();
}
    notifyListeners(); //update UI
  }
}