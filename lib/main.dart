import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'プロット',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(
        title: '二枚目イメージ図',
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
    Navigator.pop(context);
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
          // 上部
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue.shade100,
              child: const Center(
                child: Text(
                  '画像と詳細',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),

          // 中部
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange.shade100,
                    child: const Center(
                      child: Text(
                        '災害情報',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green.shade100,
                    child: const Center(
                      child: Text(
                        'マップ',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 下部
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
                child: const Text(
                  '問題',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===== 小テスト画面 =====

void select1() {
  debugPrint("選択肢1");
}

void select2() {
  debugPrint("選択肢2");
}

void select3() {
  debugPrint("選択肢3");
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: const Text('選択肢1'),
            ),
            ElevatedButton(
              onPressed: select2,
              child: const Text('選択肢2'),
            ),
            ElevatedButton(
              onPressed: select3,
              child: const Text('選択肢3'),
            ),
          ],
        ),
      ),
    );
  }
}