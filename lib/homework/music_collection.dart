//Song class
class Song {
  const Song(
      {required this.name,
      required this.artist,
      required this.duration,
      required this.year});

  final String name;
  final String artist;
  final String duration;
  final String year;
}

//Playlist class with display method that output formatted playlist
class Playlist with SearchMixin {
  const Playlist({required this.songs, required this.title});
  final String title;
  final List<Song> songs;
  void display() {
    if (songs.isEmpty) {
      print('Your \'$title\' playlist is empty');
    } 
    else {
      print('Playlist\n${title.toUpperCase()}\n');
      for (final song in songs) {
        print(
          '\'${song.name}\' by ${song.artist}  ${song.duration} ${song.year}');
      }
      print(songs.totalTime());
    }
  }
}

//Mixin to search Songs in Playlist by song or artist name
mixin SearchMixin {
  void searchByArtistOrSong(input) {
    List<Song> searchResult = myPlaylist[0]
        .songs
        .where((t) =>
            t.artist.toLowerCase().contains(input.toLowerCase()) ||
            t.name.toLowerCase().contains(input.toLowerCase()))
        .toList();
    if (searchResult.isEmpty) {
      print('No songs found');
    } 
    else {
      print('In ${myPlaylist[0].title.toUpperCase()} playlist found:\n');
      for (final song in searchResult) {
        print(
          '\'${song.name}\' by ${song.artist}  ${song.duration} ${song.year}');
      }
      print(searchResult.totalTime());
    }
  }
}

//Extension for List<Song> class to get total time of selected songs
extension MyExtension on List<Song> {
  String totalTime() {
    int result = 0;
    for (final song in this) {
      List songLength = song.duration.split(':');
      int songInSeconds =
          int.parse(songLength[0]) * 60 + int.parse(songLength[1]);
      result += songInSeconds;
    }
    String text;
    int minutes = result ~/ 60;
    int seconds = result % 60;
    if (minutes > 60) {
      int hours = minutes ~/ 60;
      minutes = minutes % 60;
      text = '\nTotal duration $hours:$minutes:${seconds < 10 
        ? '0$seconds' : '$seconds'}\n';
    } 
    else {
      text = '\nTotal duration $minutes:${seconds < 10 
        ? '0$seconds' : '$seconds'}\n';
    }
    return text;
  }
}

//List of Songs
const mySongs = [
  Song(
    name: 'Instrumental',
    artist: 'Black Country, New Road',
    duration: '5:27',
    year: '2021'),
  Song(
    name: 'Athens, France',
    artist: 'Black Country, New Road',
    duration: '6:23',
    year: '2021'),
  Song(
    name: 'Science Fair',
    artist: 'Black Country, New Road',
    duration: '6:20',
    year: '2021'),
  Song(
    name: 'Sunglasses',
    artist: 'Black Country, New Road',
    duration: '9:51',
    year: '2021'),
  Song(
    name: 'Track X',
    artist: 'Black Country, New Road',
    duration: '4:44',
    year: '2021'),
  Song(
    name: 'Opus',
    artist: 'Black Country, New Road',
    duration: '8:01',
    year: '2021'),
  Song(
    name: 'G.S.K.', 
    artist: 'Squid', 
    duration: '3:11', 
    year: '2021'),
  Song(
    name: 'Narrator', 
    artist: 'Squid', 
    duration: '8:29', 
    year: '2021'),
  Song(
    name: 'Boy Racers', 
    artist: 'Squid', 
    duration: '7:34', 
    year: '2021'),
  Song(
    name: 'Padding', 
    artist: 'Squid', 
    duration: '6:17', 
    year: '2021'),
  Song(
    name: 'Documentary Filmmaker',
    artist: 'Squid',
    duration: '4:56',
    year: '2021'),
  Song(
    name: '2010', 
    artist: 'Squid', 
    duration: '4:28', 
    year: '2021'),
  Song(
    name: 'The Flyover', 
    artist: 'Squid', 
    duration: '1:11', 
    year: '2021'),
  Song(
    name: 'Peel St.', 
    artist: 'Squid', 
    duration: '4:52', 
    year: '2021'),
  Song(
    name: 'Global Groove', 
    artist: 'Squid', 
    duration: '5:08', 
    year: '2021'),
  Song(
    name: 'Pamphlets', 
    artist: 'Squid', 
    duration: '8:04', 
    year: '2021'),
  Song(
    name: 'Holiday Destination',
    artist: 'Nadine Shah',
    duration: '5:39',
    year: '2017'),
  Song(
    name: '2016', 
    artist: 'Nadine Shah', 
    duration: '4:47', 
    year: '2017'),
  Song(
    name: 'Out the Way',
    artist: 'Nadine Shah',
    duration: '3:48',
    year: '2017'),
  Song(
    name: 'Evil', 
    artist: 'Nadine Shah', 
    duration: '5:00', 
    year: '2017'),
  Song(
    name: 'Aching Bones',
    artist: 'Nadine Shah',
    duration: '3:55',
    year: '2013'),
  Song(
    name: 'Trad', 
    artist: 'Nadine Shah', 
    duration: '5:28', 
    year: '2020'),
  Song(
    name: 'Kitchen Sink',
    artist: 'Nadine Shah',
    duration: '3:27',
    year: '2020'),
  Song(
    name: 'Balance is Gone',
    artist: 'Billy Nomates',
    duration: '3:34',
    year: '2023'),
  Song(
    name: 'Emergency Telephone',
    artist: 'Billy Nomates',
    duration: '4:08',
    year: '2021'),
  Song(
    name: 'Supermarket Sweep (feat. Jason Williamson)',
    artist: 'Billy Nomates',
    duration: '2:59',
    year: '2021'),
  Song(
    name: 'Mork n Mindy (feat. Billy Nomates)',
    artist: 'Sleaford Mods',
    duration: '3:24',
    year: '2021'),
  Song(
    name: 'Nudge It (feat. Amy Taylor)',
    artist: 'Sleaford Mods',
    duration: '3:43',
    year: '2021'),
  Song(
    name: 'Ducter', 
    artist: 'black midi', 
    duration: '6:42', 
    year: '2019'),
];

//Playlist
const myPlaylist = [Playlist(title: 'Current Mood', songs: mySongs)];

void main() {
  //this line is a search by artists or song
  myPlaylist[0].searchByArtistOrSong('Nadine Shah');
  //and this one id about formatted lpaylist output
  myPlaylist[0].display();
}
