import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  // const OwnMessageCard({Key key, this.message, this.time}) : super(key: key);
  // final String message;
  // final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color.fromARGB(255, 87, 172, 247),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: const Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  "hnukjghjfghhjv huigujgbiu huihoih gfrdjkgvnk jkfndk jkgfnrelk jigofrejo jgklre",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      "4.00",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 232, 236, 237),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      color: Color.fromARGB(255, 233, 227, 227),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
