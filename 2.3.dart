class PasswordValidator {
  // Создаем класс для проверки пароля
  static const int minLength = 8;

  static bool validate(String password) {
    // Метод для проверки пароля

    if (password.length < minLength) {
      // делаем проверку на количество символов
      return false;
    }
    if (!password.contains(RegExp(r'\d'))) {
      return false;
    }

    return true; // Если все условия выполнены пароль подходит
  }
}

//Примеры)
void main() {
  print(PasswordValidator.validate("abc12345")); // true — подходит
  print(PasswordValidator.validate("abcde")); // false — слишком короткий
}
