import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kumupro_mvp/core/constants/app_colors.dart';
import 'package:kumupro_mvp/core/constants/app_sizes.dart';
import 'package:kumupro_mvp/core/constants/game_constants.dart';
import 'package:kumupro_mvp/data/models/character_model.dart';
import 'package:kumupro_mvp/data/models/card_model.dart';
import 'package:kumupro_mvp/data/models/block_model.dart';
import 'package:kumupro_mvp/domain/entities/game_state.dart';
import 'package:kumupro_mvp/domain/entities/position.dart';
import 'package:kumupro_mvp/presentation/providers/game_state_provider.dart';

class GameScreen extends ConsumerWidget {
  final String stageId;

  const GameScreen({
    super.key,
    required this.stageId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider(stageId));

    if (gameState == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return _GameScreenContent(gameState: gameState, stageId: stageId);
  }
}

class _GameScreenContent extends ConsumerWidget {
  final GameState gameState;
  final String stageId;

  const _GameScreenContent({
    required this.gameState,
    required this.stageId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.gameBackground,
      appBar: AppBar(
        title: Text(gameState.currentStage.name),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () => _navigateToCamera(context),
          ),
          // テスト用ボタン
          PopupMenuButton<int>(
            icon: const Icon(Icons.science),
            onSelected: (pattern) => _setTestPattern(ref, pattern),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 0, child: Text('パターン1: 右移動')),
              const PopupMenuItem(value: 1, child: Text('パターン2: L字移動')),
              const PopupMenuItem(value: 2, child: Text('パターン3: 鍵取得')),
              const PopupMenuItem(value: 3, child: Text('パターン4: 繰り返し')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // ステージ説明
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.paddingM),
            color: AppColors.surface,
            child: Text(
              gameState.currentStage.description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // ゲームグリッド
          Expanded(
            flex: 3,
            child: _GameGrid(gameState: gameState),
          ),

          // 認識されたカード・ブロック表示
          if (gameState.hasCommands)
            Container(
              height: 120,
              padding: const EdgeInsets.all(AppSizes.paddingS),
              color: AppColors.surface,
              child: _CommandsDisplay(gameState: gameState),
            ),

          // コントロールパネル
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingM),
            color: AppColors.surface,
            child: Column(
              children: [
                // 実行ボタンエリア
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: gameState.hasCommands && gameState.status != GameStatus.running
                          ? () => _executeCommands(ref)
                          : null,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('実行'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: AppColors.textLight,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _resetGame(ref),
                      icon: const Icon(Icons.refresh),
                      label: const Text('リセット'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.warning,
                        foregroundColor: AppColors.textLight,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _navigateToCamera(context),
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('カメラ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.info,
                        foregroundColor: AppColors.textLight,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.paddingM),

                // ステータス表示
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSizes.paddingS),
                  decoration: BoxDecoration(
                    color: _getStatusColor(gameState.status),
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                  child: Text(
                    _getStatusText(gameState.status),
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // エラーメッセージ
                if (gameState.errorMessage != null)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: AppSizes.paddingS),
                    padding: const EdgeInsets.all(AppSizes.paddingS),
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                    child: Text(
                      gameState.errorMessage!,
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCamera(BuildContext context) {
    context.push('/camera/$stageId');
  }

  void _executeCommands(WidgetRef ref) {
    ref.read(gameStateProvider(stageId).notifier).executeCommands();
  }

  void _resetGame(WidgetRef ref) {
    ref.read(gameStateProvider(stageId).notifier).resetGame();
  }

  void _setTestPattern(WidgetRef ref, int pattern) {
    ref.read(gameStateProvider(stageId).notifier).setTestPattern(pattern);
  }

  Color _getStatusColor(GameStatus status) {
    switch (status) {
      case GameStatus.idle:
        return AppColors.textSecondary;
      case GameStatus.recognizing:
        return AppColors.info;
      case GameStatus.ready:
        return AppColors.success;
      case GameStatus.running:
        return AppColors.warning;
      case GameStatus.completed:
        return AppColors.success;
      case GameStatus.failed:
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  String _getStatusText(GameStatus status) {
    switch (status) {
      case GameStatus.idle:
        return 'カメラでカードを認識してください';
      case GameStatus.recognizing:
        return '認識中...';
      case GameStatus.ready:
        return '実行準備完了';
      case GameStatus.running:
        return '実行中...';
      case GameStatus.completed:
        return 'ステージクリア！';
      case GameStatus.failed:
        return '失敗しました';
      default:
        return '';
    }
  }
}

class _GameGrid extends StatelessWidget {
  final GameState gameState;

  const _GameGrid({required this.gameState});

  @override
  Widget build(BuildContext context) {
    final stage = gameState.currentStage;

    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingM),
      child: AspectRatio(
        aspectRatio: stage.width / stage.height,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: stage.width,
            crossAxisSpacing: AppSizes.gridSpacing,
            mainAxisSpacing: AppSizes.gridSpacing,
          ),
          itemCount: stage.width * stage.height,
          itemBuilder: (context, index) {
            final x = index % stage.width;
            final y = index ~/ stage.width;
            final position = Position(x: x, y: y);
            final tileType = stage.grid[y][x];

            return _GridTile(
              position: position,
              tileType: tileType,
              character: gameState.character.position == position
                  ? gameState.character
                  : null,
            );
          },
        ),
      ),
    );
  }
}

class _GridTile extends StatelessWidget {
  final Position position;
  final String tileType;
  final CharacterModel? character;

  const _GridTile({
    required this.position,
    required this.tileType,
    this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getTileColor(tileType),
        border: Border.all(color: AppColors.gridLine, width: 1),
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
      ),
      child: Stack(
        children: [
          // タイルアイコン
          if (tileType != GameConstants.tileEmpty) _getTileIcon(tileType),

          // キャラクター
          if (character != null)
            Center(
              child: Container(
                width: AppSizes.characterSize,
                height: AppSizes.characterSize,
                decoration: const BoxDecoration(
                  color: AppColors.character,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    _getCharacterIcon(character!.direction),
                    color: AppColors.textLight,
                    size: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getTileColor(String tileType) {
    switch (tileType) {
      case GameConstants.tileWall:
        return AppColors.wallTile;
      case GameConstants.tileGoal:
        return AppColors.goalTile;
      case GameConstants.tileKey:
        return AppColors.keyTile;
      case GameConstants.tileStart:
        return AppColors.gameBackground;
      default:
        return AppColors.surface;
    }
  }

  Widget _getTileIcon(String tileType) {
    IconData icon;
    Color color;

    switch (tileType) {
      case GameConstants.tileGoal:
        icon = Icons.flag;
        color = AppColors.textLight;
        break;
      case GameConstants.tileKey:
        icon = Icons.vpn_key;
        color = AppColors.textLight;
        break;
      case GameConstants.tileStart:
        icon = Icons.start;
        color = AppColors.success;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Center(
      child: Icon(icon, color: color, size: 24),
    );
  }

  IconData _getCharacterIcon(String direction) {
    switch (direction) {
      case GameConstants.directionUp:
        return Icons.keyboard_arrow_up;
      case GameConstants.directionDown:
        return Icons.keyboard_arrow_down;
      case GameConstants.directionLeft:
        return Icons.keyboard_arrow_left;
      case GameConstants.directionRight:
        return Icons.keyboard_arrow_right;
      default:
        return Icons.circle;
    }
  }
}

class _CommandsDisplay extends StatelessWidget {
  final GameState gameState;

  const _CommandsDisplay({required this.gameState});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '認識されたコマンド:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.paddingXS),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // カード表示
              ...gameState.recognizedCards.map((card) => _CommandCard(card: card)),
              // ブロック表示
              ...gameState.recognizedBlocks.map((block) => _CommandBlock(block: block)),
            ],
          ),
        ),
      ],
    );
  }
}

class _CommandCard extends StatelessWidget {
  final CardModel card;

  const _CommandCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: AppSizes.paddingS),
      decoration: BoxDecoration(
        color: _getCardColor(card.type),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        border: Border.all(color: AppColors.gridLine),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getCardIcon(card.type, card.direction),
            color: AppColors.textLight,
            size: 24,
          ),
          const SizedBox(height: AppSizes.paddingXS),
          Text(
            card.type.displayName,
            style: const TextStyle(
              color: AppColors.textLight,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (card.direction.isNotEmpty)
            Text(
              card.direction.displayName,
              style: const TextStyle(
                color: AppColors.textLight,
                fontSize: 8,
              ),
            ),
        ],
      ),
    );
  }

  Color _getCardColor(CardType type) {
    switch (type) {
      case CardType.move:
        return AppColors.moveUpCard;
      case CardType.grab:
        return AppColors.grabCard;
      case CardType.jump:
        return AppColors.jumpCard;
    }
  }

  IconData _getCardIcon(CardType type, String direction) {
    switch (type) {
      case CardType.move:
        switch (direction) {
          case GameConstants.directionUp:
            return Icons.keyboard_arrow_up;
          case GameConstants.directionDown:
            return Icons.keyboard_arrow_down;
          case GameConstants.directionLeft:
            return Icons.keyboard_arrow_left;
          case GameConstants.directionRight:
            return Icons.keyboard_arrow_right;
          default:
            return Icons.arrow_forward;
        }
      case CardType.grab:
        return Icons.pan_tool;
      case CardType.jump:
        return Icons.trending_up;
    }
  }
}

class _CommandBlock extends StatelessWidget {
  final BlockModel block;

  const _CommandBlock({required this.block});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: AppSizes.paddingS),
      decoration: BoxDecoration(
        color: _getBlockColor(block.type),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        border: Border.all(color: AppColors.gridLine),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getBlockIcon(block.type),
            color: AppColors.textLight,
            size: 24,
          ),
          const SizedBox(height: AppSizes.paddingXS),
          Text(
            block.type.displayName,
            style: const TextStyle(
              color: AppColors.textLight,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (block.type == BlockType.repeat)
            Text(
              '${block.repeatCount}回',
              style: const TextStyle(
                color: AppColors.textLight,
                fontSize: 8,
              ),
            ),
        ],
      ),
    );
  }

  Color _getBlockColor(BlockType type) {
    switch (type) {
      case BlockType.start:
        return AppColors.startBlock;
      case BlockType.repeat:
        return AppColors.repeatBlock;
      case BlockType.ifBlock:
        return AppColors.ifBlock;
    }
  }

  IconData _getBlockIcon(BlockType type) {
    switch (type) {
      case BlockType.start:
        return Icons.play_circle_filled;
      case BlockType.repeat:
        return Icons.repeat;
      case BlockType.ifBlock:
        return Icons.help_outline;
    }
  }
}