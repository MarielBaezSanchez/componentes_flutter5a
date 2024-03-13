class Data {
  String? nombre;
  bool? gustoFlutter;
  int? califFlutter;
  String? comida;
  bool? helado;
  bool? chocoflan;
  bool? pastel;

  Data(
      {required String nomb,
      required bool flutter,
      required int calif,
      required String food,
      required bool icecream,
      required bool flan,
      required bool cake}) {
    nombre = nomb;
    gustoFlutter = flutter;
    califFlutter = calif;
    comida = food;
    helado = icecream;
    chocoflan = flan;
    pastel = cake;
  }
}
