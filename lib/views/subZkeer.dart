import 'package:flutter/material.dart';
import '../../models/subZkeerModel.dart';

class SubZkeer extends StatefulWidget {

   SubZkeer({Key? key, required this.subzkeer ,required this.onTapAddCurNum}) : super(key: key);
  final subZkeerModel subzkeer;
  late Function(subZkeerModel newModelData) onTapAddCurNum;
  @override
  State<SubZkeer> createState() => _SubZkeerState();
}

class _SubZkeerState extends State<SubZkeer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() { widget.subzkeer.curNum++; });
                        widget.onTapAddCurNum(widget.subzkeer);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return EditNoteView(
        //       note: widget.note,
        //     );
        //   }),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(widget.subzkeer.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                widget.subzkeer.text,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  widget.subzkeer.curNum.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                 // widget.note.delete();
                 // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.subzkeer.maxNum.toString(),
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
