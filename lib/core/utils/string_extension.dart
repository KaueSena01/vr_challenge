extension StringExtension on String {
  String removeDiacritics() {
    return replaceAll(RegExp('[ÁÀÂÃ]'), 'A')
        .replaceAll(RegExp('[ÉÈÊ]'), 'E')
        .replaceAll(RegExp('[ÍÌÎ]'), 'I')
        .replaceAll(RegExp('[ÓÒÔÕ]'), 'O')
        .replaceAll(RegExp('[ÚÙÛ]'), 'U')
        .replaceAll(RegExp('[Ç]'), 'C');
  }
}
