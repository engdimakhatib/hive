import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../models/zkeerModel.dart';
import 'add_zkeer_states.dart';

class AddZkeerCubit extends Cubit<AddZkeerState> {
  AddZkeerCubit() : super(AddZkeerInitial());

  Color color = const Color(0xffAC3931);

  addZkeer(ZkeerModel zkeer) async {
    zkeer.color = color.value;
    emit(AddZkeerLoading());
    try {
      /*
Future<List<User>> addUser(User newUser) async {
  await _userBox.add(newUser);
  return getUsers();
}
      */
      var ZeekrsBox = Hive.box<ZkeerModel>(kZkeerBox);
      //Add (Create) New User
      await ZeekrsBox.add(zkeer);
      zkeer.save();
      print("ZeekrsBox + ${ZeekrsBox.length.toString()}");
      emit(AddZkeerSuccess());
    } catch (e) {
      emit(AddZkeerFailure(e.toString()));
    }
  }
}