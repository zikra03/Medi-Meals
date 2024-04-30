import 'dart:convert';

class OnboardingModel {
  String imageUrl;
  String headline;
  OnboardingModel({
    required this.imageUrl,
    required this.headline,

  });

  OnboardingModel copyWith({
    String? imageUrl,
    String? headline,
  }) {
    return OnboardingModel(
      imageUrl: imageUrl ?? this.imageUrl,
      headline: headline ?? this.headline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'headline': headline,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      imageUrl: map['imageUrl'] ?? '',
      headline: map['headline'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'OnboardingData(imageUrl: $imageUrl, headline: $headline,)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnboardingModel &&
        other.imageUrl == imageUrl &&
        other.headline == headline ;
  }

  @override
  int get hashCode =>
      imageUrl.hashCode ^ headline.hashCode;
}
