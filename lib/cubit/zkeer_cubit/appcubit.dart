import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../models/zkeerModel.dart';
import 'appstates.dart';


class ZkeerCubit extends Cubit<ZkeerState> {
  ZkeerCubit() : super(ZkeerInitial());

  List<ZkeerModel>? zkeers;

  fetchAllZkeers() {
    //Fetch (Read) Users
    /*
    List<User> getUsers() {
    final userList = _userBox.values.toList();
    return userList as List<User>;
}
    */
    var ZkeerBox = Hive.box<ZkeerModel>(kZkeerBox);
    zkeers = ZkeerBox.values.toList();
    print("zkeers${zkeers!.length.toString()}");
    emit(ZkeerSuccess());
  }
  }