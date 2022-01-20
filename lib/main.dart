import 'dart:math';

abstract class Shape {
  late int x;
  late int y;
  Shape clone(); //prototype functionality.
  double area();
}

class Rectangle extends Shape {
  Rectangle({required this.height, required this.width}) : super() {
    x = height;
    y = width;
  }

  Rectangle copyWith(Shape source) {
    return Rectangle(height: source.x, width: source.y)
      .._hashCode = source.hashCode
      ..isClone = true;
  }

  late int height;
  late int width;

  int? _hashCode;

  bool isClone = false;
  String get cloneStatus => isClone ? "is a clone" : "is an original gangster";

  @override
  Rectangle clone() => copyWith(this);

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

  Circle copyWith(Shape source) {
    return Circle(radius: source.x)
      .._hashCode = source.hashCode
      ..isClone = true;
  }

  late int radius;

  int? _hashCode;

  bool isClone = false;
  String get cloneStatus => isClone ? "is a clone" : "is an original gangster";

  @override
  Circle clone() => copyWith(this);

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
  var cloneRect = ogRect.clone();
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

  var cloneCircle = ogCircle.clone();
  cloneCircle.radius = 20;
  print(cloneCircle.area());
  print('cloneCircle ${cloneCircle.cloneStatus}.');

  /*
    ogRect is an original gangster.
    cloneRect is a clone.
    someOtherRect is an original gangster.

    cloneRect is a clone of ogRect.
    someOtherRect is not a clone of ogRect.
  */
}
