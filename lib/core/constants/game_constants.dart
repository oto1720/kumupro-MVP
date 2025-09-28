class GameConstants {
  GameConstants._();

  // Grid configuration
  static const int defaultGridWidth = 8;
  static const int defaultGridHeight = 6;
  static const int maxGridWidth = 12;
  static const int maxGridHeight = 10;

  // Movement
  static const int movementAnimationDuration = 300;
  static const int characterRotationDuration = 150;

  // Card types
  static const String cardMoveUp = 'move_up';
  static const String cardMoveDown = 'move_down';
  static const String cardMoveLeft = 'move_left';
  static const String cardMoveRight = 'move_right';
  static const String cardGrab = 'grab';
  static const String cardJump = 'jump';

  // Block types
  static const String blockRepeat = 'repeat';
  static const String blockIf = 'if';
  static const String blockStart = 'start';

  // Game states
  static const String gameStateIdle = 'idle';
  static const String gameStateRunning = 'running';
  static const String gameStateCompleted = 'completed';
  static const String gameStateFailed = 'failed';

  // Tile types
  static const String tileEmpty = 'empty';
  static const String tileWall = 'wall';
  static const String tileGoal = 'goal';
  static const String tileKey = 'key';
  static const String tileStart = 'start';

  // Directions
  static const String directionUp = 'up';
  static const String directionDown = 'down';
  static const String directionLeft = 'left';
  static const String directionRight = 'right';

  // Stage configuration
  static const int maxCommandsPerStage = 10;
  static const int maxRepeatCount = 5;

  // Recognition settings
  static const double recognitionConfidenceThreshold = 0.7;
  static const int maxRecognitionRetries = 3;
}