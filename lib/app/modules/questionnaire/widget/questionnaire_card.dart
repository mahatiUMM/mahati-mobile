import 'package:flutter/material.dart';

class QuestionnaireCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onPressed;

  const QuestionnaireCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            color: const Color(0xFFFFFFFF),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF40D99E),
                  ),
                  child: const Text(
                    "Mulai",
                    style: TextStyle(
                      color: Color.fromARGB(255, 24, 82, 60),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
