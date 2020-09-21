import 'Encryption/RSA.dart';
import 'Encryption/AES.dart';
import 'Encryption/keys.dart';

class Methods
{
  bool RSA;
  bool AES;
  bool Static;
  bool custom;

  Methods (this.RSA, this.AES, this.Static, this.custom);
}

class Encryption
{
  Methods options;
  RSA rsa;
  AES aes;

  Encryption (this.options);

  custom ()
  {

  }

  static ()
  {

  }

  init ()
  {
    if (options.RSA)
      rsa = new RSA ();
    if (options.AES)
      aes = new AES ();
  }

  Future<String> encrypt (String data)
  {
    Future<String> encrypted;
    return encrypted;
  }
}