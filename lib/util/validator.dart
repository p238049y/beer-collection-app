String? inputValidation(String value, int characterLimit) {
  if (value == '') {
    return 'こちらは必須項目です。';
  } else if (value.contains(' ') && value.trim() == '') {
    return '空文字は受け付けていません。';
  } else if (value.contains('　') && value.trim() == '') {
    return '空文字は受け付けていません。';
  } else if (value.length >= characterLimit) {
    return '$characterLimit文字以下にしてください。';
  } else {
    return null;
  }
}
