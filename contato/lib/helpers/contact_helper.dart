import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String contactTable = "contact";
final String idColumn = "id";
final String nameColumn = "name";
final String emailColumn = "email";
final String phoneColumn = "phone";
final String imageColumn = "image";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "conctacts.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute("CREATE TABLE "
            "$contactTable($idColumn INTEGER PRIMARY KEY, "
            "$nameColumn TEXT, $emailColumn TEXT, "
            "$phoneColumn TEXT, $imageColumn TEXT);");
      },
    );
  }
}

class Contact {
  int id;
  String name;
  String email;
  String phone;
  String image;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    image = map[imageColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imageColumn: image
    };

    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, image: $image)";
  }
}
