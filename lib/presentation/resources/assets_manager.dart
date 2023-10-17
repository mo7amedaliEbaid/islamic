const String assetPath = "assets/";
const String jsonPath = "assets/json";
const String imagePath = "assets/images";
const String pillarsPath = "assets/images/pillars";

sealed class ImageAsset {
  //Bot Nav Icons
  static const String quranIcon = "$imagePath/quran-ic.svg";
  static const String hadithIcon = "$imagePath/hadith-ic.svg";
  static const String prayerIcon = "$imagePath/mosque-ic.svg";
  static const String adhkarIcon = "$imagePath/adhkar-ic.svg";
  static const String launcherIcon = "$imagePath/islamic_ic.png";
  static List<String> pillarsimgd = [
    "$pillarsPath/pillar1.png",
    "$pillarsPath/pillar2.jpg",
    "$pillarsPath/pillar3.png",
    "$pillarsPath/pillar4.png",
    "$pillarsPath/pillar5.jpeg",
  ];
}

sealed class JsonAsset {
  static const String quranAsset = "$jsonPath/quran.json";
  static const String adhkarAsset = "$jsonPath/adhkar.json";
  static const String hadithAsset = "$jsonPath/40_hadith_nawawi.json";
}
