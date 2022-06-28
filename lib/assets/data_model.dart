import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class ImageItem extends HiveObject {
  @HiveField(0)
  String? image;

  ImageItem({this.image});
}
