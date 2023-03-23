import 'package:hive/hive.dart';
import 'package:travel_app/models/subZkeerModel.dart';
//part 'subZkeerModel.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 1)
class subZkeerModel extends HiveObject 
{
    @HiveField(0)
  String text;
   @HiveField(1)
  int maxNum;
    @HiveField(2)
  int curNum=0;
  @HiveField(3)
 int color;
  subZkeerModel({required this.text , required this.maxNum ,required this.curNum, required this.color});
}
//https://stackoverflow.com/questions/66923873/hive-db-doesnt-save-the-nested-objects