import 'VK_api.dart';

class Auth
{
  Api api;

  getToken( String login, String password ) async
  {
    String token;
    token = await api.getToken();
    return token;
  }
}