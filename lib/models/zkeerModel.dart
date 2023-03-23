import 'package:hive/hive.dart';
import 'package:travel_app/models/subZkeerModel.dart';
part 'zkeerModel.g.dart';

//flutter packages pub run build_runner build


@HiveType(typeId: 0)
class ZkeerModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
 HiveList? subZkeer;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;
 @HiveField(4)
  bool done = false;
   @HiveField(5)
  int maxNum;
 @HiveField(6)
  int curNum=0;

  ZkeerModel({
    required this.title, 
    required this.date,
    required this.color, 
    required this.maxNum,
     this.subZkeer,
    required this.done,
  required  this.curNum
  });
}
//https://docs.hivedb.dev/#/custom-objects/relationships
/*
import 'package:hive/hive.dart';

void main() async {
  Hive.registerAdapter(PersonAdapter());
  var persons = await Hive.openBox<Person>('personsWithLists');
  persons.clear();
  
  var mario = Person('Mario');
  var luna = Person('Luna');
  var alex = Person('Alex');
  persons.addAll([mario, luna, alex]);
  
  mario.friends = HiveList(persons); // Create a HiveList
  mario.friends.addAll([luna, alex]); // Update Mario's friends
  mario.save(); // make persistent the change,
  print(mario.friends);
  
  luna.delete(); // Remove Luna from Hive
  print(mario.friends); // HiveList updates automatically
}

@HiveType()
class Person extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList friends;

  Person(this.name);

  String toString() => name; // For print()
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final typeId = 0;

  @override
  Person read(BinaryReader reader) {
    return Person(reader.read())..friends = reader.read();
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.write(obj.name);
    writer.write(obj.friends);
  }
}
*/