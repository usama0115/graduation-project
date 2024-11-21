class OnboardingModel{
  String image;
  String disc;
  OnboardingModel({
    required this.disc,
    required this.image,
  });
}

List <OnboardingModel> OnboardingItem = [
  OnboardingModel(disc: 'Professional call center', image: 'assets/on1.png'),
  OnboardingModel(disc: 'Professional team for maintenance all types of filters', image: 'assets/on2.png'),
  OnboardingModel(disc: 'Fast delivery', image: 'assets/gif4.gif'),
];