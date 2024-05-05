import 'package:flutter/material.dart';

enum SingingCharacter { SangatTidakSetuju, TidakSetuju, Netral, Setuju, SangatSetuju }

class QuestionnaireAnswerCard extends StatefulWidget {
  const QuestionnaireAnswerCard({super.key});

  @override
  State<QuestionnaireAnswerCard> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<QuestionnaireAnswerCard> {
  SingingCharacter? _character = SingingCharacter.SangatTidakSetuju;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sangat Tidak Setuju'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.SangatTidakSetuju,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Tidak Setuju'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.TidakSetuju,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          
        ),ListTile(
          title: const Text('Netral'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Netral,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),ListTile(
          title: const Text('Setuju'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Setuju,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),ListTile(
          title: const Text('Sangat Setuju'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.SangatSetuju,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
