import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/watch_utils.dart';

class WatchHeartComponent extends StatelessWidget {
  const WatchHeartComponent(this._heartRateStream, {super.key});
  final Stream<List<int>> _heartRateStream;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: StreamBuilder(
          stream: _heartRateStream,
          builder: (context, snapshot) {
            var values = snapshot.data;
            debugPrint(values.toString());
            var hr = WatchUtils.getHR(values ?? []);
            debugPrint('hr: $hr');
            return Center(child: Text(hr.toString()));
          },
        ),
      ),
    );
  }
}
