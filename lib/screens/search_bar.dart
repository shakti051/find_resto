import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _search = TextEditingController();
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .7,
          margin: EdgeInsets.only(left: 16, top: 16, right: 60),
          height: 40,
          child: TextFormField(
            controller: _search,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(18.0),
                ),
              ),
              labelText: 'Search',
              prefixIcon: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black38,
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
