class Shape {
  // абстрактный класс
  double area() {
    return 0;
  }
}

class Circle extends Shape {
  // Создаем круг
  double radius;
  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius; //Площадь круга
  }
}

class Rectangle extends Shape {
  // Создаем прямоугольник
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height; // площадь прямоугольника
  }
}

// примеры работы
void main() {
  var circle = Circle(5);
  print('Круг: ${circle.area()}'); // Выводит площадь круга

  var rectangle = Rectangle(4, 6);
  print('Прямоугольник: ${rectangle.area()}'); // Выводит площадь прямоугольника
}
