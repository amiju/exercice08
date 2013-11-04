library exercice8;

import 'dart:math';

part 'fonctions08.dart';


ex8_1() {
  print('Ex. 8.1');
  var groupeMots = [];
  //Chaque expérience te rapproche de ton but. N’abandonne pas tes rêves parce que tu as eu un mauvais départ.
  groupeMots.add('chaque');
  groupeMots.add('expérience');
  groupeMots.add('te');
  groupeMots.add('rapproche');
  groupeMots.add('de');
  groupeMots.add('ton');
  groupeMots.add('but');
  groupeMots.add('n\'abandonne');
  groupeMots.add('pas');
  groupeMots.add('tes');
  groupeMots.add('rêves');
  groupeMots.add('parce');
  groupeMots.add('que');
  groupeMots.add('tu');
  groupeMots.add('as');
  groupeMots.add('eu');
  groupeMots.add('un');
  groupeMots.add('mauvais');
  groupeMots.add('départ');
  groupeMots.add('.');

  var numberOfItems = groupeMots.length;
  var phraseAleatoire;
   for (var i=0 ; i<numberOfItems~/2; i++){
     phraseAleatoire = randomPhrases(groupeMots, numberOfItems);
     print('\n$phraseAleatoire');
   }
  print('');
}

ex8_2() {
  print('Ex. 8.2');
  var associations = [
                  {'name': 'IS', 'description': 'Information Systems', 'members':
                      [{'firstName': 'Dzenan', 'lastName': 'Ridjanovic', 'email': 'dr@gmail.com'},
                          {'firstName': 'Robert', 'lastName': 'Nelson', 'email': 'rn@gmail.com'}]},
                  {'name': 'CS', 'description': 'Computer Science',  'members':
                      [{'firstName': 'David', 'lastName': 'Curtis', 'email': 'dc@gmail.com'}]}
                     ];
  print('\nVoici la liste de chacune des associations avec leurs membres: ');
  showall(associations);

  print('\nVoici la liste triée des membres d\'une association donnée: ');
  getSortedMembers(associations, 'IS');

  print('\nVoici la liste des membres dont le nom commence par la lettre passée en paramètre: ');
  getSpecificMembers('R', associations);

  print('');
}

ex8_3() {
  print('Ex. 8.3');
  var associations = [
                      {'name': 'IS', 'members':
                        [{'firstName': 'Dzenan', 'lastName': 'Ridjanovic', 'email': 'dr@gmail.com'},
                         {'firstName': 'Robert', 'lastName': 'Nelson', 'email': 'rn@gmail.com'}]},
                         {'name': 'CS', 'members':
                           [{'firstName': 'David', 'lastName': 'Curtis', 'email': 'dc@gmail.com'},
                            {'firstName': 'Dzenan', 'lastName': 'Ridjanovic', 'email': 'dr@gmail.com'}]}
                         ];
  print('\nVoici la liste de chacune des associations avec leurs membres: ');
  showall(associations);

  print('\nVoici la liste triée des membres d\'une association donnée: ');
  addAssociation(associations, 'MM');
 // getSortedMembers(associations, 'IS');

  print('\nVoici le nouveau membre ajouté: ');
  addMember(associations, 'MM', 'Olga', 'Behanzin', 'ob@gmail.com');

  print('\nVoici le nouveau membre retiré: ');
  removeMember(associations, 'MM', 'Olga', 'Behanzin', 'ob@gmail.com');

  print('\nVoici le nouveau membre ajouté: ');
  addMember(associations, 'MM', 'Olga', 'Behanzin', 'ob@gmail.com');

  print('\nVoici le nouveau membre mis à jour: ');
  updateMember(associations, 'MM', 'Olga', 'Behanzin', 'ob@gmail.com',
      'Sena', 'Behanzin', 'sb@gmail.com');

  print('');
}

ex8_4() {
  print('Ex. 8.4');
  List<List<int>> matrix = new  List<List<int>>();
  List<List<bool>> booleen = new  List<List<bool>>();
  var currentDepth = 0;

  for (var i = 0; i < 2 ; i++) {
    List<int> list = new List<int>();

    for (var j = 0; j < 8 ; j++){
      list.add(0);
    }
    matrix.add(list);
  }

  matrix[0][0] = 1;
  matrix[0][2] = 1;
  matrix[0][3] = 1;
  matrix[0][4] = 1;
  matrix[1][0] = 1;
  matrix[1][2] = 1;
  matrix[1][3] = 1;
  matrix[1][7] = 1;

  print (matrix);

  for (var i = 0; i < 2 ; i++) {
    List<bool> list = new List<bool>();

    for (var j = 0; j < 8 ; j++){
      list.add(false);
    }
    booleen.add(list);
  }

  print(findMaxDepth(currentDepth, matrix, booleen, 4, 1));

  print('');
}

void main() {
  ex8_1();
  ex8_2();
  ex8_3();
  ex8_4();

}
