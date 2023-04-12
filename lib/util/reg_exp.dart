class Expression {
  static const String mobile=r'^(\+?\d{1,3}[\-\s]?)?\(?\d{3}\)?[\-\s]?\d{3}[\-\s]?\d{4}$';
  static const String dateDMY = r'\d{2}-\d{2}-\d{4}';
  static const String webUrl = r"(https?|http)://([-A-Z\d.]+)(/[-A-Z\d+&@#/%=~_|!:,.;]*)?(\?[A-Z\d+&@#/%=~_|!:‌​,.;]*)?";
  static const String email = r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+";
}