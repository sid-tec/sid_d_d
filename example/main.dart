import 'package:sid_d_d/sid_d_d.dart';

void main() {
  final name = Name(what: 'nome', value: 'asdasdas dasdHitler');
  //
  print(name.value);

  print(name);

  print('failures');
  for (var failure in name.failures) {
    print(failure);
  }

  final date = Date(what: 'data', value: DateTime.now().toString());
  print(date.value);

  print('failures:');
  var datev = date.failures;
  print(datev);

  var name4 = Name(what: 'nome', value: 'Adolf Hitler');
  var name2 = Name(what: 'nome', value: 'Adolf');
  var name3 = Name(what: 'nome', value: 'Adolf');
  print('igualdade must be false:');
  print(name4 == name2);
  print('igualdade must be true:');
  print(name3 == name2);

  final person = Person.create(
    nome: 'Elisa',
    idade: 55,
    nascimento: DateTime.now().toString(),
    nome1: 'ladeira',
    nascimento1: '1974-06-30 17:09:21.422952',
    nome2: 'carioca',
    nascimento2: '2016-06-30 17:09:21.422952',
  );
  print(person.value);
  //print(person.value('name').getOr(replace: 'ERRO'));
  //print(person.value('name').runtimeType);

    print(person.value);
 /*  for (var element in person.value) {
  } */
  //Helper.treePrint(person.value);
  var nome = Name(what: 'nome', value: 'Adolf');
  print(nome.value);
  print(nome.runtimeType);
  var erros = nome.failures;
  print(erros);
  //print(person.toMapOrCrash());

  var mino = Person.create(
    idade: -33,
    uid: '879a9470-f8b0-11ec-8bb4-2367f911d84e',
    nome: '123456789910\n45464', //'Adolf', //
    nascimento: '2022-06-30 17:09:21.422952',
    nome1: 'Adolf',
    nascimento1: '2022-06-30 17:09:21.422952',
    nome2: 'Adolf',
    nascimento2: 'xx', // '2022-06-30 17:09:21.422952', //
  );
  var mino2 = Person.create(
    idade: 33,
    uid: '879a9470-f8b0-11ec-8bb4-2367f911d84e',
    nome: 'Adolf',
    nascimento: '2022-06-30 17:09:21.422952',
    nome1: 'Adolf',
    nascimento1: '2022-06-30 17:09:21.422952',
    nome2: 'Adolf',
    nascimento2: '2022-06-30 17:09:21.422952',
  );

  //print(mino.toMapOrCrash());
  //print(mino2.toMapOrCrash());
  print(mino == mino2);

  print(mino.failures);
  print(mino.isValid);
  print(mino2.failures);
  print(mino2.isValid);

  //Helper.treePrint(mino.failures);

/*   final persons = Container<Person>();
  persons.add(group: person);
  persons.add(group: mino);
  persons.add(group: mino2);

  print(persons.groups);
  persons.remove(index: 1);
  print(persons.groups);
  var groups = persons.groups; */
}
