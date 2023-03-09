abstract class AppRoutePath{}

class LoginOptionsPath extends AppRoutePath{}

class LoginPath extends AppRoutePath {}

class RegisterPath extends AppRoutePath {}

class AppTopPath extends AppRoutePath {
  final bool? isLoginSuccess;
  final int number;

  AppTopPath(this.isLoginSuccess, this.number);
}
