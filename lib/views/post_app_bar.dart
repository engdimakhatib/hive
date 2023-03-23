import 'package:flutter/material.dart';

class postAppBar extends StatelessWidget {
  const postAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
           mainAxisAlignment :MainAxisAlignment.spaceBetween,
        children: [
     InkWell(
      onTap: () {Navigator.of(context).pop();},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color : Colors.white,boxShadow: [BoxShadow(color:Colors.black26,blurRadius: 6)]),
      child: Icon(Icons.arrow_back,size:28),
      ),
     ),
        InkWell(
      onTap: () {Navigator.of(context).pop();},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color : Colors.white,boxShadow: [BoxShadow(color:Colors.black26,blurRadius: 6)]),
      child: const Icon(Icons.favorite, color: Colors.redAccent,size:28),
      ),
     ),
      ],),
    );
  }
}