import 'package:demo_bloc/screens/inheritance/base_classs.dart';

class Cow extends Animal with Work {
  @override
  void canEatGrass() {
    // TODO: implement canEatGrass
    super.canEatGrass();
    print("cow can eat grass");
  }

  @override
  void helpInFarming() {
    // TODO: implement helpInFarming
    super.helpInFarming();
  }
}
