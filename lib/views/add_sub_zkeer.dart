import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/add_sub_zkeer.dart/add_sub_zkeer.dart';
import '../cubit/add_sub_zkeer.dart/add_sub_zkeer_states.dart';
import '../cubit/zkeer_cubit/appcubit.dart';
import '../models/zkeerModel.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddSubZkeer extends StatefulWidget {
     ZkeerModel zkeermodel;
     int index;
   AddSubZkeer({super.key , required this.zkeermodel , required this.index});
   
  @override
  State<AddSubZkeer> createState() => _AddSubZkeerState();
}
class _AddSubZkeerState extends State<AddSubZkeer> {
  @override
    final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title; int? maxNum;
  @override
  Widget build(BuildContext context) {
       return BlocProvider(
      create: (context) => AddSubZkeerCubit(),
      child: BlocConsumer<AddSubZkeerCubit, AddSubZkeerState>(
        listener: (context, state) {
          if (state is AddSubZkeerFailure) {}
          if (state is AddSubZkeerSuccess) {
            BlocProvider.of<ZkeerCubit>(context).fetchAllZkeers();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: AbsorbPointer(
              absorbing: state is AddSubZkeerLoading ? true : false,
              child:
               Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),    
                  child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                      autovalidateMode: autovalidateMode,
                            child:  Column(
                        children: [
                          const SizedBox( height: 32, ),
                          CustomTextField(
                            onSaved: (value) {title = value;},
                            hint: 'عنوان الذكر', maxLines: 5, ),
                          const SizedBox(height: 16, ),
                          CustomTextField(
                            onChanged: (value) {maxNum = int.parse(value) ;},             
                            hint: 'عدد مرات التكرار',      
                          ),
                          
                          const SizedBox( height: 32,),
                        //  const ColorsListView(),
                          const SizedBox(height: 32,),
                          BlocBuilder<AddSubZkeerCubit, AddSubZkeerState>(
                            builder: (context, state) {
                  return  CustomButton(
                   isLoading: state is AddSubZkeerLoading ? true : false,
                   onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var subzkeerModel = ZkeerModel(
                            title: title!,
                              date: widget.zkeermodel.date,
                               color: widget.zkeermodel.color,
                            maxNum: maxNum!,
                         done : false,
                         curNum: 0
                          );
                       BlocProvider.of<AddSubZkeerCubit>(context).addSubZkeer(widget.index,subzkeerModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                            },
                          ),
                          const SizedBox( height: 16,),
                        ],),),
                  ),
              ),
              ),
          );
  }
      ),
       );
}
}