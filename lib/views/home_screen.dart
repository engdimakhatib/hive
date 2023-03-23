import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/zkeer_cubit/appcubit.dart';
import '../views/component.dart';
import '../views/home_app_bar.dart';
import 'add_zkeer_bottom_sheet.dart';
import 'build_Horizontal_Zkeer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
  BlocProvider.of<ZkeerCubit>(context).fetchAllZkeers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(90.0),child :HomeAppBar(),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
        child:SingleChildScrollView(
          child: Column(children: [

    const buildHorizontalZkeer(),

         const SizedBox(height: 20,), 

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: buildHoizontalMarqueeText(),
                 ),
            ),

            const SizedBox(height: 10,),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index)  =>  buildVerticalPic( context , index) ,                 
            ),
            
          ],),
        ),
        ),
      ),
   
    
   floatingActionButton: FloatingActionButton(child: Icon(Icons.add) ,
      onPressed:()
      {
      showModalBottomSheet(
        backgroundColor: const Color(0xFFEDF2F6),
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {  return const AddZkeerBottomSheet();});
      } 
   ),);
    
  }
}