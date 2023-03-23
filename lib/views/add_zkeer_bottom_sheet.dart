import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_zkeer_cubit/add_zkeer_cubit.dart';
import '../cubit/add_zkeer_cubit/add_zkeer_states.dart';
import '../cubit/zkeer_cubit/appcubit.dart';
import '../models/zkeerModel.dart';
import '../views/colors_list_view.dart';
import '../views/custom_button.dart';
import '../views/custom_text_field.dart';

class AddZkeerBottomSheet extends StatefulWidget {
  const AddZkeerBottomSheet({super.key});

  @override
  State<AddZkeerBottomSheet> createState() => _AddZkeerBottomSheetState();
}

class _AddZkeerBottomSheetState extends State<AddZkeerBottomSheet> {
    final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title; int? maxNum;
  @override
  Widget build(BuildContext context) {
       return BlocProvider(
      create: (context) => AddZkeerCubit(),
      child: BlocConsumer<AddZkeerCubit, AddZkeerState>(
        listener: (context, state) {
          if (state is AddZkeerFailure) {}
          if (state is AddZkeerSuccess) {
            BlocProvider.of<ZkeerCubit>(context).fetchAllZkeers();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddZkeerLoading ? true : false,
            child: Padding(
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
                        const ColorsListView(),
                        const SizedBox(height: 32,),
                        BlocBuilder<AddZkeerCubit, AddZkeerState>(
                          builder: (context, state) {
                return  CustomButton(
                 isLoading: state is AddZkeerLoading ? true : false,
                 onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedCurrentDate = DateFormat('dd-mm-yyyy').format(currentDate);
                      var zkeerModel = ZkeerModel(
                          title: title!,
                            date: formattedCurrentDate,
                             color: Colors.blue.value,
                          maxNum: maxNum!,
                       done : false,
                       curNum: 0
                        );
                     BlocProvider.of<AddZkeerCubit>(context).addZkeer(zkeerModel);
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
            );
  }
      ),
       );
}}