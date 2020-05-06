import 'package:todoapp/parameters/database-keys.parameters.dart';
import 'package:todoapp/shared/enums/status-type.enum.dart';

class TaskModel {
  int id;
  String name;
  String description;
  String imageUrl;
  StatusType status;

  TaskModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.status,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      NAME_COLUMN: name,
      DESCRIPTION_COLUMN: description,
      IMAGE_COLUMN: imageUrl,
      STATUS_COLUMN: status,
    };

    if (id != null) {
      map[ID_COLUMN] = id;
    }

    return map;
  }
}
