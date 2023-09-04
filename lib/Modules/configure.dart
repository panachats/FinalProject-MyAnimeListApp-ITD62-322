import 'animeAPI.dart';
import 'mangaAPI.dart';
import 'login_user.dart';

class Configure {
  static const server = "10.161.0.241:80";
  static AnimeApi showAnime = AnimeApi();
  static MangaApi showManga = MangaApi();
  static Users login = Users();
  static Users user = Users();
}
