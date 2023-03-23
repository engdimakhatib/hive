
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/views/post_screen.dart';
import '../cubit/zkeer_cubit/appcubit.dart';
import '../cubit/zkeer_cubit/appstates.dart';
import '../models/zkeerModel.dart';
import '../views/edit_zkeer_view_body.dart';
import '../views/zkeer_item.dart';
import '../views/add_sub_zkeer.dart';

class buildHorizontalZkeer extends StatefulWidget {
  const buildHorizontalZkeer({super.key});
  @override
  State<buildHorizontalZkeer> createState() => _buildHorizontalZkeerState();
}
class _buildHorizontalZkeerState extends State<buildHorizontalZkeer> {

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<ZkeerCubit, ZkeerState>(
      builder: (context, state) {
        List<ZkeerModel> zkeers = BlocProvider.of<ZkeerCubit>(context).zkeers!;
    return  Container(
           height : 200.0,
          child:  ListView.builder(
        scrollDirection : Axis.horizontal,
        itemBuilder : (context,index) =>   Zkeer_Item(
                    zkeermodel: zkeers[index],
                   onTapAddCurNum:(ZkeerModel newZkeerData){
                      Navigator.push(
                        //add sub zkeer
          context,
          MaterialPageRoute(builder: (context) {
            return   AddSubZkeer(index: index, zkeermodel: newZkeerData,);
          }),
        ); 
                   },
                   onTapAddSubZkeer:(ZkeerModel newZkeerData){
                           Navigator.push(
                        //add sub zkeer
          context,
          MaterialPageRoute(builder: (context) {
            return   AddSubZkeer(index: index, zkeermodel: newZkeerData,);
          }),
        ); 
                   },
                  onTapDelete:(ZkeerModel newZkeerData)
                  {
                    //Remove (Delete) User
                    /*
                    COPY
Future<List<User>> removeUser(String id) async {
    final userToDelete =
        await _userBox.values.firstWhere((element) => element.id == id);
    await userToDelete.delete();
    return getUsers();
}*/
                    newZkeerData.delete();
                  BlocProvider.of<ZkeerCubit>(context).fetchAllZkeers();
                  },
                  onTapEditSettings:(ZkeerModel newZkeerData)
                  {
                    print(index.toString());
               Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return   EditZkeerViewBody( zkeer: newZkeerData,);
          }),
        );     
                  },
                  //must send this zekeer
                  onTapInfo:(ZkeerModel newZkeerData)
                  {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return  const InfoScreen();
          }),
        ); 
                  },
                  ),
        itemCount : zkeers.length,
      ),
         );
            } );
  }
}