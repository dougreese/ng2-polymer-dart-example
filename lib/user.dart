import 'package:uuid/uuid.dart';

class User {
  String id;
  String name;
  String moreInfo;

  User (this.name) {
    var uuid = new Uuid();
    id = uuid.v4();
    moreInfo = "more info";
  }

  String toString() => "$id: $name";
}

