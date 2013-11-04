part of principal08;

//exercice08_01
randomPhrases(var myElements, var numberOfItems) {
    var i = 0;
    int randomNum ;
    var randomSentence = '';
    var newWord = '';
    var arrayLenght = myElements.length;
    //print(arrayLenght);
    do{
      randomNum = new Random().nextInt(arrayLenght);
      newWord = myElements[randomNum];
      //print(randomNum);
      randomSentence = randomSentence + ' ' + newWord;
      i++;
    }while(i< numberOfItems);
  return(randomSentence);
}

//exercice08_02
showall(var associations){
  for (var i = 0; i < associations.length; i++) {
    var association = associations[i];
   association.forEach((x,y) => print('$x: $y'));
  }
}

//liste triée des membres d'une association
getSortedMembers(var associations, var associationName) {
  var membersSort = new List();
  var keyIndex;
  
  for (var i = 0; i < associations.length; i++) {
    var association = associations[i];
    if (association.containsValue(associationName)){
      membersSort = association['members'];
      break;
    }  
  }
  
  var sortList =  new List();
  for(var keyMember in membersSort){    
    sortList.add(keyMember['lastName']);
  }
  sortList.sort((m,n) => m[0].compareTo(n[0]));
  print('\nLa liste des membres avant le tri: ');
  print(membersSort);
  var newListMembers = new List();
  for (var listMember in sortList){
    for (var keyMember in membersSort){
      if(keyMember.containsValue(listMember)){
        newListMembers.add(keyMember);
        break;
      }
    }
  }
  print('\nLa liste des membres après le tri: ');
  print(newListMembers);
  
}
//Membre dont la premiere lettre commence par lettre
 getSpecificMembers(var letter, var associations) {
  var listMembers = new List();
  var tempoMembers = new List();
  
  for (var i = 0; i < associations.length; i++) {
    var association = associations[i];
    tempoMembers = association['members'];
    for (var member in tempoMembers){
      if (member['lastName'].startsWith(letter)){
        listMembers.add(member);
      }  
    }
   }    
    print(listMembers);
  }
 

//exercice08_03
// showall(var associations){
//   for (var i = 0; i < associations.length; i++) {
//     var association = associations[i];
//     association.forEach((x,y) => print('$x: $y'));
//   }
// }

 addAssociation(var associations, var nameAssociation){
   var newMap = new Map();
   var check = false;
   for (var i = 0; i < associations.length; i++) {
     var association = associations[i];
     if (association.containsValue(nameAssociation)){
       check = true;
       break;
     }
   }
   
   if (check == true){
     print('Cette association existe déjà');
   }else{
     newMap['name'] = nameAssociation;
     newMap['members'] = [];
     associations.add(newMap);
   }
   
   showall(associations);
   
 }

 addMember(var associations, var associationName, var memberFirstName, var memberLastName, var memberEmail){
   var newMap = new Map();
   newMap = {'firstName': memberFirstName, 'lastName':  memberLastName, 'email': memberEmail};
   
   for (var i = 0; i < associations.length; i++) {
     var association = associations[i];
     if (association.containsValue(associationName)){
       association['members'].add(newMap);
       break;
     }  
   }
   showall(associations);
 }

 removeMember(var associations, var associationName, var memberFirstName, var memberLastName, var memberEmail){
   var newMap = new Map();
   var membersList = new List();
   int indexList;
   
   newMap = {'firstName': memberFirstName, 'lastName':  memberLastName, 'email': memberEmail};
   
   for (var i = 0; i < associations.length; i++) {
     var association = associations[i];
     if (association.containsValue(associationName)){
       membersList = association['members'];
       print(membersList);
       indexList = 0;
       for (var memList in membersList){
         
         if (memList['firstName']== memberFirstName && memList['lastName']== memberLastName && 
             memList['email']== memberEmail){
           membersList.removeAt(indexList);
           break;
         }
         indexList++;
       }
     }  
   }
   showall(associations);
 }

 updateMember(var associations, var associationName, var oldFirstName, var oldLastName, 
     var oldEmail, var newFirstName, var newLastName, var newEmail){
   removeMember(associations, associationName, oldFirstName, oldLastName, oldEmail);
   addMember(associations, associationName, newFirstName, newLastName, newEmail);
 }


//exercice08_04
 findMaxDepth(var currentDepth, var matrix, var booleen, int i, int j) {  
   // Check if i, j (indexes) are within the size of array
   // Check if the cell is already traversed or not using bool array
   // Check if the cell value is 1 before counting it as part of a sector
   if(i >= 0 && i < matrix.length && j >=0 && j < matrix[0].length
       && booleen[i][j] != true && matrix[i][j] != 0) {
     currentDepth++;

     // Mark the status of the cell for backtracking purpose
     booleen[j] = true;

     // left traversal
     findMaxDepth(currentDepth, matrix, booleen, i-1, j);
     // right traversal
     findMaxDepth(currentDepth, matrix, booleen, i+1, j);

     // top traversal
     findMaxDepth(currentDepth, matrix, booleen, i, j-1);
     // bottom traversal
     findMaxDepth(currentDepth, matrix, booleen, i, j+1);

     // Top-Bottom diagnol
     // diagnol-down traversal
     findMaxDepth(currentDepth, matrix, booleen, i+1, j+1);
     // diagnol-up traversal
     findMaxDepth(currentDepth, matrix, booleen, i-1, j-1);

     // Bottom-Top diagnol
     // diagnol-down traversal
     findMaxDepth(currentDepth, matrix, booleen, i+1, j-1);
     // diagnol-up traversal
     findMaxDepth(currentDepth, matrix, booleen, i-1, j+1);
   }
   
   return currentDepth;
 }

//exercice08_05



