abstract class FeatureInjector {
  void inject() {
    injectExceptionHandler();
    injectAnalytics();
    injectRepositories();
    injectUseCases();
    injectViewModels();
  }

  void injectRepositories();
  void injectUseCases();
  void injectViewModels();
  void injectAnalytics();
  void injectExceptionHandler();
}
