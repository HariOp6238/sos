import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class contactmodel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String Phonenumber;
  contactmodel(this.name, this.Phonenumber);
}
