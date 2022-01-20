import 'dart:math';

abstract class Shape {
  late int x;
  late int y;
  Shape copyWith(); //prototype functionality.
  double area();
}

class Rectangle extends Shape {
  Rectangle({required this.height, required this.width}) : super() {
    x = height;
    y = width;
  }

  @override
  Rectangle copyWith() {
    return Rectangle(height: x, width: y)
      .._hashCode = hashCode
      ..isClone = true;
  }

  late int height;
  late int width;

  int? _hashCode;

  bool isClone = false;
  String get cloneStatus => isClone ? "is a clone" : "is an original gangster";

  @override
  int get hashCode {
    if (_hashCode != null) return _hashCode!;
    _hashCode = DateTime.now().millisecondsSinceEpoch;
    return _hashCode!;
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! Rectangle) return false;
    Rectangle rect = other;
    return rect.isClone && rect.hashCode == hashCode;
  }

  @override
  double area() => (height * width).toDouble();
}

class Circle extends Shape {
  Circle({required this.radius}) : super() {
    x = radius;
    y = radius;
  }

  @override
  Circle copyWith() {
    return Circle(radius: x)
      .._hashCode = hashCode
      ..isClone = true;
  }

  late int radius;

  int? _hashCode;

  bool isClone = false;
  String get cloneStatus => isClone ? "is a clone" : "is an original gangster";

  @override
  int get hashCode {
    if (_hashCode != null) return _hashCode!;
    _hashCode = DateTime.now().millisecondsSinceEpoch;
    return _hashCode!;
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! Circle) return false;
    Circle circle = other;
    return circle.isClone && circle.hashCode == hashCode;
  }

  @override
  double area() => (radius * radius * pi).toDouble();
}

void main() {
  var ogRect = Rectangle(width: 100, height: 100);
  var cloneRect = ogRect.copyWith();
  var someOtherRect = Rectangle(width: 100, height: 200);

  print("ogRect ${ogRect.cloneStatus}.");
  print("cloneRect ${cloneRect.cloneStatus}.");
  print("someOtherRect ${someOtherRect.cloneStatus}.");

  String cloneIsClone =
      ogRect == cloneRect ? "is a clone of" : "is not a clone of";
  print("\r\ncloneRect $cloneIsClone ogRect.");

  String someRectIsClone =
      ogRect == someOtherRect ? "is a clone of" : "is not a clone of";
  print("someOtherRect $someRectIsClone ogRect.");

  Circle ogCircle = Circle(radius: 10);
  print(ogCircle.area());
  print('ogCircle ${ogCircle.cloneStatus}.');

  var cloneCircle = ogCircle.copyWith();
  cloneCircle.radius = 20;
  print(cloneCircle.area());
  print('cloneCircle ${cloneCircle.cloneStatus}.');
}

/*
    flutter: ogRect is an original gangster.
    flutter: cloneRect is a clone.
    flutter: someOtherRect is an original gangster.
    flutter: cloneRect is a clone of ogRect.
    flutter: someOtherRect is not a clone of ogRect.
    flutter: 314.1592653589793
    flutter: ogCircle is an original gangster.
*/