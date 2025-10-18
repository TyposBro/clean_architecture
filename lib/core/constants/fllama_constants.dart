/// Configuration for the on-device FLLAMA model.
class FllamaConstants {
  FllamaConstants._();

  /// File name used when storing the GGUF model locally.
  static const String modelFileName = 'Llama-3.2-1B-Instruct-Q4_K_M.gguf';

  /// Remote URL for downloading the GGUF model if it does not exist locally.
  static const String modelUrl =
      'https://huggingface.co/telosnex/fllama/resolve/main/Llama-3.2-1B-Instruct-Q4_K_M.gguf';

  /// Optional asset path for bundling a model with the app (e.g. `assets/llm/...`).
  /// Leave `null` to skip asset extraction.
  static const String? bundledAssetPath = null;

  /// Optional multimodal projection model path / URL (unused for text-only models).
  static const String? mmprojFileName = null;
  static const String? mmprojUrl = null;

  /// Model identifier to use when running on the web with MLC's backend.
  static const String webModelId = 'Llama-3.2-1B-Instruct-q4f16_1-MLC';

  /// Generation defaults aligned with recommended FLLAMA settings.
  static const int maxTokens = 256;
  static const int contextSize = 2048;
  static const int numGpuLayers = 99;
  static const double temperature = 0.1;
  static const double topP = 1.0;
  static const double frequencyPenalty = 0.0;
  static const double presencePenalty = 1.1;
}
