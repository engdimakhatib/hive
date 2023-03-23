
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/zkeer_cubit/appcubit.dart';
import '../../models/zkeerModel.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';
import 'edit_zkeer_colors_list_view.dart';

class EditZkeerViewBody extends StatefulWidget {
  const EditZkeerViewBody({Key? key, required this.zkeer}) : super(key: key);
  final ZkeerModel zkeer;
  @override
  State<EditZkeerViewBody> createState() => _EditZkeerViewBodyState();
}
class _EditZkeerViewBodyState extends State<EditZkeerViewBody> {
  String? title; int? maxNum; int? content;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body:  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(  height: 50,),
          CustomAppBar(
            onPressed: () {
              widget.zkeer.title = title ?? widget.zkeer.title;
              widget.zkeer.maxNum = content ?? widget.zkeer.maxNum ;
              /*
              Update User
              Future<List<User>> updateUserInfo(User user) async {
    final userToUpdate = await _userBox.values.firstWhere((element) {
      return element.id == user.id;
    });
    final index = userToUpdate.key;
    await _userBox.put(index, user);

    return getUsers();
}
*/              widget.zkeer.save();
              BlocProvider.of<ZkeerCubit>(context).fetchAllZkeers();
              Navigator.pop(context);
            },
            title: 'تعديل الذكر',
            icon: Icons.check,
          ),
          const SizedBox(  height: 50,),
          CustomTextField(
            onChanged: (value) { title = value; },
            hint: widget.zkeer.title,
          ),
          const SizedBox(  height: 16, ),
          CustomTextField(
            onChanged: (value) { content = value; },
            hint: widget.zkeer.maxNum.toString(),
            maxLines: 5,
          ),
          const SizedBox(height: 16,),
         EditZkeerColorsList( zkeer: widget.zkeer, ),
        ],),
         ), );
  }
}