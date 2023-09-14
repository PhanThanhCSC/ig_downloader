class EnvConfig {
  final String appName;
  final String baseUrlAuthen;
  final String baseUrlUtility;
  final String baseGraphQLUrlCore;
  final bool shouldCollectCrashLog;

  EnvConfig({
    required this.appName,
    required this.baseUrlAuthen,
    required this.baseUrlUtility,
    required this.baseGraphQLUrlCore,
    this.shouldCollectCrashLog = false,
  }) {}
}
