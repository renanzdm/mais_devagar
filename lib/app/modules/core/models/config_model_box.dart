import 'package:objectbox/objectbox.dart';

@Entity()
class ConfigModelBox {
  int id;
  bool showIntroductionPages;

  ConfigModelBox({this.showIntroductionPages = true}) : id = 0;
}
