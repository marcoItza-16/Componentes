import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esta es la pagina de avatar "),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/30/11/9f/30119f5578e36677df1b9bdd9c06a858.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("MA"),
              backgroundColor: Color.fromARGB(244, 43, 52, 69),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://i.pinimg.com/564x/30/11/9f/30119f5578e36677df1b9bdd9c06a858.jpg'),
          placeholder: AssetImage('assets/cargando.gif'),
        ),
      ),
    );
  }
}
