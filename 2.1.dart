import 'dart:math'; //импортируем библиотеку для работы с математическими вычислениями

class MathProcessor {
  List<double> numbers;
  MathProcessor(this.numbers);
  List<double> process(double Function(double) handler) {
    // Метод применяющий функцию к каждому числу
    return numbers.map(handler).toList();
  }

  static List<double> getRandomNumbers(int count) {
    //создаем случайные числа с помощью метода Random
    var rand = Random();
    return List<double>.generate(count, (_) => rand.nextDouble() * 100);
  }
}
