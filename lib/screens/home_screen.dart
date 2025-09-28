import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kumupro_mvp/core/constants/app_colors.dart';
import 'package:kumupro_mvp/core/constants/app_sizes.dart';
import 'package:kumupro_mvp/data/repositories/stage_repository.dart';
import 'package:kumupro_mvp/data/models/stage_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final StageRepository _stageRepository = StageRepository();
  List<StageModel> _stages = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStages();
  }

  Future<void> _loadStages() async {
    try {
      final stages = await _stageRepository.getAllStages();
      setState(() {
        _stages = stages;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gameBackground,
      appBar: AppBar(
        title: const Text(
          'KumuPro',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(AppSizes.paddingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ステージを選んでください',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSizes.paddingL),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppSizes.paddingM,
                        mainAxisSpacing: AppSizes.paddingM,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: _stages.length,
                      itemBuilder: (context, index) {
                        final stage = _stages[index];
                        return _StageCard(
                          stage: stage,
                          onTap: () => _navigateToGameScreen(stage),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _navigateToGameScreen(StageModel stage) {
    context.push('/game/${stage.id}');
  }
}

class _StageCard extends StatelessWidget {
  final StageModel stage;
  final VoidCallback onTap;

  const _StageCard({
    required this.stage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _getDifficultyColor(stage.difficulty),
                  borderRadius: BorderRadius.circular(AppSizes.radiusL),
                ),
                child: Center(
                  child: Text(
                    stage.difficulty.toString(),
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.paddingS),
              Text(
                stage.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.paddingXS),
              Text(
                stage.description,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (stage.isCompleted) ...[
                const SizedBox(height: AppSizes.paddingXS),
                const Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: AppSizes.iconS,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(int difficulty) {
    switch (difficulty) {
      case 1:
        return AppColors.success;
      case 2:
        return AppColors.info;
      case 3:
        return AppColors.warning;
      case 4:
        return AppColors.secondary;
      default:
        return AppColors.error;
    }
  }
}