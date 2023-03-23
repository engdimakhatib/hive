import 'package:flutter/material.dart';
import '../../models/zkeerModel.dart';
import 'edit_zkeer_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.zkeer}) : super(key: key);
  final ZkeerModel zkeer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditZkeerViewBody(
        zkeer: zkeer,
      ),
    );
  }
}