import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

// =====================
// 地図用データ
// =====================

enum PlaceType {
  tourist,
  shelter,
}

class Place {
  final String name;
  final LatLng location;
  final PlaceType type;

  const Place({
    required this.name,
    required this.location,
    required this.type,
  });
}

const List<Place> places = [
  Place(
    name: 'JR大阪駅',
    location: LatLng(34.7025, 135.4959),
    type: PlaceType.tourist,
  ),
  Place(
    name: '大阪工業大学 梅田キャンパス',
    location: LatLng(34.7050, 135.4983),
    type: PlaceType.shelter,
  ),
];

// =====================
// メインアプリ
// =====================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '防災アプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(
        title: '防災マップ',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // =====================
          // 地図
          // =====================
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(4),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(34.7037, 135.4971),
                  initialZoom: 16,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: places.map((place) {
                      final color =
                          place.type == PlaceType.tourist
                              ? Colors.red
                              : Colors.blue;

                      return Marker(
                        point: place.location,
                        width: 100,
                        height: 80,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: color,
                              size: 40,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              color: Colors.white,
                              child: Text(
                                place.name,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          // =====================
          // 災害情報 + 詳細
          // =====================
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange.shade100,
                    child: const Center(
                      child: Text(
                        '災害情報\n（後で追加）',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue.shade100,
                    child: const Center(
                      child: Text(
                        '詳細',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =====================
          // 問題ボタン
          // =====================
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const QuizPage(),
                    ),
                  );
                },
                child: const Text(
                  '問題',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================
// 問題画面
// =====================

void select1() {
  debugPrint('選択肢1');
}

void select2() {
  debugPrint('選択肢2');
}

void select3() {
  debugPrint('選択肢3');
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('小テスト'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 220,
              color: Colors.deepOrange,
            ),
            const SizedBox(height: 24),
            const Text(
              '正しいものを1つ選んでください',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: select1,
              child: const Text('選択肢1',
              style: TextStyle(fontSize: 35)),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: select2,
              child: const Text('選択肢2',
              style: TextStyle(fontSize: 35)),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: select3,
              child: const Text('選択肢3',
              style: TextStyle(fontSize: 35)
              ),
            ),
          ],
        ),
      ),
    );
  }
}