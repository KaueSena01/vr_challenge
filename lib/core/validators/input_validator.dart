dynamic storagePassword = "";

String? nameValidator(name) {
  if (name == null || name.isEmpty) {
    return "Digite seu nome";
  }

  final names = name.split(' ');

  if (names.length == 1) {
    return 'Digite seu nome completo!';
  }

  if (name.length <= 8) {
    return 'Nome muito pequeno!';
  }

  return null;
}

String? emailValidator(email) {
  if (email == null || email.isEmpty) {
    return "Digite seu e-mail";
  }

  final exp = RegExp(r"^([\w\.-_]+)(@+)([\w]+)((\.+\w{2,3}){1,2})$");

  if (!exp.hasMatch(email ?? '')) {
    return 'E-mail inválido!';
  }

  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return "Digite sua senha";
  }

  if (password.length <= 7) {
    return "A senha deve ter pelo menos 8 caracteres";
  }

  storagePassword = password;

  return null;
}

String? courseNameValidator(name) {
  if (name == null || name.isEmpty) {
    return "Digite o nome do curso";
  }
  return null;
}

String? courseDescriptionValidator(description) {
  if (description == null || description.isEmpty) {
    return "Digite a descrição do curso";
  }

  if (description.length <= 20) {
    return "Descrição curta";
  }

  return null;
}

String? courseSyllabusValidator(syllabus) {
  if (syllabus == null || syllabus.isEmpty) {
    return "Digite a ementa do curso";
  }

  if (syllabus.length <= 20) {
    return "Ementa inválida";
  }

  return null;
}
