import 'package:sos/model/contactModel.dart';

import 'package:sqflite/sqflite.dart';

class HomePageController {
  static late Database mydatabase;

  static List dbdataList = [];
  List<MyModel> myModelList = [];

  // function for init database
  static Future initDb() async {
    mydatabase = await openDatabase(
      "contact.db",
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
            "CREATE TABLE contact( name TEXT, number INTEGER)");
      },
    );
  }

// function for add data
  static Future<void> addDatatoDb({required String name,required int number }) async {
    await mydatabase.rawInsert(
        'INSERT INTO contact (name,number) VALUES (?,?)',
        [name,number, ]);
  }

// function for get data
  Future<void> getAllDataFromDb() async {
    dbdataList = await mydatabase.rawQuery("SELECT * FROM contact");
    print(dbdataList);

    //to convert data from db t model class

    myModelList = dbdataList.map((element) {
      return MyModel(
         
          name: element["name"],
          number: element["number"]
          );
    }).toList();
  }
   static Future<void> delectdata({required id, }) async {
    await mydatabase
    .rawDelete('DELETE FROM contact WHERE id = ?', [id]);
        
  }
}
//delect for the data

