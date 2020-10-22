import 'package:flutter/material.dart';

class ChatMessege extends StatelessWidget {
  final Map <String, dynamic> data;
  final bool myMsg;

   ChatMessege(this.data, this.myMsg);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10, horizontal: 10
      ),
      child: Row(
        children: [
          !myMsg ?
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage:NetworkImage(data["photoUrl"]) ,
          ),
          ): Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:myMsg?CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                data['imgURL'] != null ? Image.network(data['imgURL'], width: 260,) : Text(
                  data['text'],
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                Text(
                  data['senderName'],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          myMsg ?
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              backgroundImage:NetworkImage(data["photoUrl"]) ,
            ),
          ): Container(),
        ],
      ),
    );
  }
}
