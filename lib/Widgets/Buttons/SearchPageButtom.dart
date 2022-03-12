import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchPageButton extends StatefulWidget {
  const SearchPageButton({Key? key}) : super(key: key);

  @override
  _SearchPageButtonState createState() => _SearchPageButtonState();
}

class _SearchPageButtonState extends State<SearchPageButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: "Search".text.scale(1.2).white.make().centered(),
          decoration: BoxDecoration(
            color: Colors.red[900],
          ),
        ).pOnly(bottom: 15, top: 25, right: 25, left: 25),
        Container(
          height: 40,
          child: "Register as Doner".text.scale(1.2).white.make().centered(),
          decoration: BoxDecoration(
            color: Color(0xfff505050),
          ),
        ).pOnly(
          right: 25,
          left: 25,
        )
      ],
    );
  }
}
