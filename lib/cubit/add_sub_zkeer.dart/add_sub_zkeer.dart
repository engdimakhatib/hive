import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/cubit/add_sub_zkeer.dart/add_sub_zkeer_states.dart';
import '../../constants.dart';
import '../../models/zkeerModel.dart';

class AddSubZkeerCubit extends Cubit<AddSubZkeerState> {
  AddSubZkeerCubit() : super(AddSubZkeerInitial());
  addSubZkeer(int index ,ZkeerModel subzkeer , ) async {
   print("in addSubZkeer");
    emit(AddSubZkeerLoading());
 //   try {
      var ZeekrsBox = Hive.box<ZkeerModel>(kZkeerBox);
      var SubZeekrsBox = Hive.box<ZkeerModel>(kSubZkeerBox);
    var zkeermodel=  ZeekrsBox.getAt(index)!;
    print(zkeermodel.title);
  SubZeekrsBox.add(subzkeer);
     await subzkeer.save();
  print(subzkeer.title);

  print(" await subzkeer.save();"); 
     // ignore: unrelated_type_equality_checks
     zkeermodel.subZkeer!=HiveList(SubZeekrsBox) ;
     print(" zkeermodel.subZkeer!=HiveList(SubZeekrsBox) ;");


try {
   zkeermodel.subZkeer!.add(subzkeer);
} catch (e) {
   emit(AddSubZkeerFailure(e.toString()));
}


print(" zkeermodel.subZkeer!.add(subzkeer);");
      await zkeermodel.save();
      print(" await zkeermodel.save();");
      emit(AddSubZkeerSuccess());

    // } catch (e) {
    //   emit(AddSubZkeerFailure(e.toString()));
    // }
  }
}

 