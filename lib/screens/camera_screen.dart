import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import 'package:kumupro_mvp/core/constants/app_colors.dart';
import 'package:kumupro_mvp/core/constants/app_sizes.dart';

class CameraScreen extends ConsumerStatefulWidget {
  final String stageId;

  const CameraScreen({
    super.key,
    required this.stageId,
  });

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.medium,
        );

        await _cameraController!.initialize();

        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Camera initialization error: $e');
    }
  }

  Future<void> _captureAndRecognize() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile image = await _cameraController!.takePicture();

      // SSg��ko;ύXAPI�|s�W
      await Future.delayed(const Duration(seconds: 2)); // !�j�B�

      // �XP�����;bk;Y
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('��ɒ�XW~W_'),
            backgroundColor: AppColors.success,
          ),
        );

        // ���;bk;�
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('�Xk1WW~W_: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() {
        _isCapturing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('��ɍX'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: _isInitialized
          ? _buildCameraView()
          : const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
    );
  }

  Widget _buildCameraView() {
    if (_cameraController == null) {
      return const Center(
        child: Text(
          '���L)(gM~[�',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Stack(
      children: [
        // ��������
        Positioned.fill(
          child: CameraPreview(_cameraController!),
        ),

        // ��������	
        Positioned.fill(
          child: _buildOverlay(),
        ),

        // ������
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildControls(),
        ),
      ],
    );
  }

  Widget _buildOverlay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
      ),
      child: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primary,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
          ),
          child: const Center(
            child: Text(
              '��ɒSSk\nMnWfO`UD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingL),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radiusL),
          topRight: Radius.circular(AppSizes.radiusL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '��ïh��ɒD�[f�qWfO`UD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.paddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // �����ܿ�
              _ControlButton(
                icon: Icons.photo_library,
                label: '�����',
                onPressed: _isCapturing ? null : _openGallery,
              ),

              // �qܿ�
              _CaptureButton(
                isCapturing: _isCapturing,
                onPressed: _isCapturing ? null : _captureAndRecognize,
              ),

              // -�ܿ�
              _ControlButton(
                icon: Icons.settings,
                label: '-�',
                onPressed: _isCapturing ? null : _openSettings,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openGallery() {
    // �����K�;ϒx�Y�_�*��	
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('�����_�o*��gY')),
    );
  }

  void _openSettings() {
    // ���-�;b*��	
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('-�_�o*��gY')),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _ControlButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: onPressed != null
                ? AppColors.primary
                : AppColors.textSecondary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        const SizedBox(height: AppSizes.paddingXS),
        Text(
          label,
          style: TextStyle(
            color: onPressed != null
                ? Colors.white
                : AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _CaptureButton extends StatelessWidget {
  final bool isCapturing;
  final VoidCallback? onPressed;

  const _CaptureButton({
    required this.isCapturing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isCapturing ? AppColors.warning : AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: isCapturing
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.white,
                  iconSize: 40,
                ),
        ),
        const SizedBox(height: AppSizes.paddingXS),
        Text(
          isCapturing ? '�X-...' : '�q',
          style: TextStyle(
            color: onPressed != null
                ? Colors.white
                : AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}