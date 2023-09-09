import 'animeAPI.dart';
import 'mangaAPI.dart';
import 'login_user.dart';

class Configure {
  static const server = "192.168.7.179:3000";
  static AnimeApi showAnime = AnimeApi();
  static MangaApi showManga = MangaApi();
  static Users login = Users();
  static Users user = Users();
  static String uid = "";

}
