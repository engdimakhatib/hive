import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/views/zkeer_item.dart';

import '../cubit/zkeer_cubit/appcubit.dart';
import '../cubit/zkeer_cubit/appstates.dart';
import '../models/zkeerModel.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZkeerCubit, ZkeerState>(
      builder: (context, state) {
        List<ZkeerModel> zkeers = BlocProvider.of<ZkeerCubit>(context).zkeers!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: zkeers.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Zkeer_Item(
                    zkeermodel: zkeers[index],
                   onTapAddCurNum:(ZkeerModel newZkeerData){},
                   onTapAddSubZkeer:(ZkeerModel newZkeerData){},
                  onTapDelete:(ZkeerModel newZkeerData){},
                  onTapEditSettings:(ZkeerModel newZkeerData){},
                  onTapInfo:(ZkeerModel newZkeerData){},
                  ),
                );
              }),
        );
      },
    );
  }
}