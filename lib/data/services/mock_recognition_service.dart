import 'dart:math' as math;
import 'dart:math';
import 'package:kumupro_mvp/data/models/card_model.dart';
import 'package:kumupro_mvp/data/models/block_model.dart';

class MockRecognitionService {
  static final MockRecognitionService _instance = MockRecognitionService._internal();
  factory MockRecognitionService() => _instance;
  MockRecognitionService._internal();

  final Random _random = Random();

  // モック認識結果のパターン
  static const List<List<Map<String, dynamic>>> _mockPatterns = [
    // パターン1: 基本的な右移動
    [
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
    ],

    // パターン2: L字移動
    [
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
      {'type': 'card', 'cardType': 'move', 'direction': 'down'},
      {'type': 'card', 'cardType': 'move', 'direction': 'down'},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
    ],

    // パターン3: 鍵を取る
    [
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
      {'type': 'card', 'cardType': 'grab', 'direction': ''},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
    ],

    // パターン4: 繰り返しブロック
    [
      {'type': 'block', 'blockType': 'repeat', 'repeatCount': 3},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
    ],

    // パターン5: 複雑なパターン
    [
      {'type': 'block', 'blockType': 'start'},
      {'type': 'card', 'cardType': 'move', 'direction': 'right'},
      {'type': 'block', 'blockType': 'if', 'condition': 'has_key'},
      {'type': 'card', 'cardType': 'move', 'direction': 'up'},
      {'type': 'card', 'cardType': 'grab', 'direction': ''},
    ],
  ];

  /// 画像からカード・ブロックを認識する（モック実装）
  Future<RecognitionResult> recognizeImage(String imagePath) async {
    // 実際の処理時間をシミュレート
    await Future.delayed(Duration(milliseconds: 1500 + _random.nextInt(1000)));

    // ランダムにパターンを選択
    final patternIndex = _random.nextInt(_mockPatterns.length);
    final pattern = _mockPatterns[patternIndex];

    final List<CardModel> cards = [];
    final List<BlockModel> blocks = [];

    for (int i = 0; i < pattern.length; i++) {
      final item = pattern[i];
      final id = 'mock_${DateTime.now().millisecondsSinceEpoch}_$i';

      if (item['type'] == 'card') {
        cards.add(_createMockCard(id, item));
      } else if (item['type'] == 'block') {
        blocks.add(_createMockBlock(id, item, cards));
      }
    }

    // 成功率のシミュレート（90%の確率で成功）
    final isSuccess = _random.nextDouble() > 0.1;

    return RecognitionResult(
      isSuccess: isSuccess,
      cards: isSuccess ? cards : [],
      blocks: isSuccess ? blocks : [],
      confidence: isSuccess ? 0.8 + _random.nextDouble() * 0.2 : 0.3,
      errorMessage: isSuccess ? null : 'カードが認識できませんでした。明るい場所で再度お試しください。',
      processingTime: 1500 + _random.nextInt(1000),
    );
  }

  CardModel _createMockCard(String id, Map<String, dynamic> data) {
    return CardModel(
      id: id,
      type: _parseCardType(data['cardType']),
      direction: data['direction'] ?? '',
      confidence: 0.8 + _random.nextDouble() * 0.2,
    );
  }

  BlockModel _createMockBlock(String id, Map<String, dynamic> data, List<CardModel> availableCards) {
    final List<CardModel> blockCards = [];

    // ブロックにカードを含める場合のシミュレーション
    if (data['blockType'] != 'start' && availableCards.isNotEmpty) {
      final cardCount = math.min(2, availableCards.length);
      blockCards.addAll(availableCards.take(cardCount));
    }

    return BlockModel(
      id: id,
      type: _parseBlockType(data['blockType']),
      cards: blockCards,
      repeatCount: data['repeatCount'] ?? 1,
      condition: data['condition'],
      confidence: 0.8 + _random.nextDouble() * 0.2,
    );
  }

  CardType _parseCardType(String type) {
    switch (type) {
      case 'move':
        return CardType.move;
      case 'grab':
        return CardType.grab;
      case 'jump':
        return CardType.jump;
      default:
        return CardType.move;
    }
  }

  BlockType _parseBlockType(String type) {
    switch (type) {
      case 'start':
        return BlockType.start;
      case 'repeat':
        return BlockType.repeat;
      case 'if':
        return BlockType.ifBlock;
      default:
        return BlockType.start;
    }
  }

  /// テスト用の特定パターンを返す
  Future<RecognitionResult> recognizeTestPattern(int patternIndex) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (patternIndex < 0 || patternIndex >= _mockPatterns.length) {
      return RecognitionResult(
        isSuccess: false,
        cards: [],
        blocks: [],
        confidence: 0.0,
        errorMessage: '無効なパターンです',
        processingTime: 500,
      );
    }

    final pattern = _mockPatterns[patternIndex];
    final List<CardModel> cards = [];
    final List<BlockModel> blocks = [];

    for (int i = 0; i < pattern.length; i++) {
      final item = pattern[i];
      final id = 'test_${patternIndex}_$i';

      if (item['type'] == 'card') {
        cards.add(_createMockCard(id, item));
      } else if (item['type'] == 'block') {
        blocks.add(_createMockBlock(id, item, cards));
      }
    }

    return RecognitionResult(
      isSuccess: true,
      cards: cards,
      blocks: blocks,
      confidence: 0.95,
      errorMessage: null,
      processingTime: 500,
    );
  }
}

class RecognitionResult {
  final bool isSuccess;
  final List<CardModel> cards;
  final List<BlockModel> blocks;
  final double confidence;
  final String? errorMessage;
  final int processingTime;

  const RecognitionResult({
    required this.isSuccess,
    required this.cards,
    required this.blocks,
    required this.confidence,
    this.errorMessage,
    required this.processingTime,
  });

  int get totalCommands => cards.length + blocks.length;

  bool get hasCommands => cards.isNotEmpty || blocks.isNotEmpty;

  String get summary {
    if (!isSuccess) return 'Recognition failed';
    return 'Recognized ${cards.length} cards and ${blocks.length} blocks';
  }
}