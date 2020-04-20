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
    final path = join(databasesPath, "conctactsv2.db");

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

  Future<List<Contact>> getAll() async {
    Database dbContext = await db;
    List findConctact = await dbContext.rawQuery("SELECT * FROM $contactTable");
    List<Contact> result = List();
    for (Map m in findConctact) {
      result.add(Contact.fromMap(m));
    }
    return result;
  }

  Future<Contact> getContactById(int id) async {
    Database dbContext = await db;
    List<Map> maps = await dbContext.query(
      contactTable,
      columns: [idColumn, nameColumn, emailColumn, phoneColumn, imageColumn],
      where: "$idColumn = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    }
    return null;
  }

  Future<int> getNumber() async {
    Database dbContext = await db;
    return Sqflite.firstIntValue(
      await dbContext.rawQuery("SELECT COUNT(*) FRTOM $contactTable"),
    );
  }

  Future<Contact> saveContact(Contact contact) async {
    Database dbContext = await db;
    contact.id = await dbContext.insert(contactTable, contact.toMap());
    return contact;
  }

  Future update(Contact contact) async {
    Database dbContext = await db;
    await dbContext.update(
      contactTable,
      contact.toMap(),
      where: "$idColumn = ?",
      whereArgs: [contact.id],
    );
  }

  Future delete(int id) async {
    Database dbContext = await db;
    var result = await dbContext.delete(
      contactTable,
      where: "$idColumn = ?",
      whereArgs: [id],
    );
  }

  Future close() async {
    Database dbContext = await db;
    await dbContext.close();
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

  Contact();

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
