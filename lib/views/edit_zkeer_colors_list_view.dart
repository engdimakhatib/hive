import 'package:flutter/material.dart';
import '../constants.dart';
import '../../models/zkeerModel.dart';
import 'colors_list_view.dart';

class EditZkeerColorsList extends StatefulWidget {
  const EditZkeerColorsList({super.key, required this.zkeer});
  final ZkeerModel zkeer;
  @override
  State<EditZkeerColorsList> createState() => _EditZkeerColorsListState();
}
class _EditZkeerColorsListState extends State<EditZkeerColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.zkeer.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.zkeer.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}