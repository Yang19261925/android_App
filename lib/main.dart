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

        // 左上の戻るボタン
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // 上部（3）
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

          // 中部（2）
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

          // 下部（1）
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  print('問題ボタンが押されました');
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