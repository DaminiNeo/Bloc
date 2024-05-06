String get margaritaLink =>
    'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita';

class DataConstants {
  static int tempValue = 10;
  static const _amount = 10;
  static get amountVal => _amount;

  static intValues() {
    print('intVal => $tempValue');
  }
}
