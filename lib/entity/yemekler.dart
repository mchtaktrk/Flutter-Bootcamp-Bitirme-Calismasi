class Yemekler {
  final yemek_id;
  final yemek_adi;
  final yemek_resim_adi;
  final yemek_fiyat;

  Yemekler({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat});

  factory Yemekler.fromJson(Map<String, dynamic> json){
    return Yemekler(
        yemek_id: json["yemek_id"],
        yemek_adi: json["yemek_adi"],
        yemek_resim_adi: json["yemek_resim_adi"],
        yemek_fiyat: json["yemek_fiyat"]
    );
  }
}