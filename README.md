# TP2

HE-Arc - Cours d'industrialisation du logiciel

Introduction à:

- GitHub Actions
- GitLab CI/CD

## Réponses

### Exercice 1 - GitHub Actions

#### b)

##### Quelles étapes (steps) sont réalisées par cette action

- Clone du repos pour y avoir accès dans le runner (action fournie par github)
- Install des dépendances avec pip (flake et pytest)
- Lint avec flake
- Test avec pytest

##### Un step défini au minimum par 2 éléments

- name, nom de l'étape
- run qui contient les étapes OU uses qui utilise une action externe

##### Mot de clé `with`

Permet de passer des paramètres à une action

### Exercice 2 - Qualité de code

#### a)

#####  Sur l’onglet Summary d’une analyse de code, SonarCloud fournit 4 indicateurs. Quels sont-ils et quelles sont leurs utilités ?

- New issues, nouveaux problèmes depuis le code
- Accepted issues, Les "issues" depuis SonarQube cloud qui ont été résolues
- Coverage (il faut l'activer), Coverage en pourcentage du code
- Duplications: Code dupliqué j'imagine

##### À quoi sert l'indicateur Quality Gate ? 

QualityGate: Pas accès pour l'instant

#### b)

#####  Quelle est la différence entre les sections "New code" et "Overall Code" ?

- New Code: Récemment push
- Overall Code: Tout le code dans le repos

##### Y a-t-il des Code Smells ? Si oui, combien et pour quelle(s) raison(s) ?

Oui, il y en à 3.

- 2 fois, "unused parameters" dans la fonction "spend_cash" et "spend_money".
- 1 fois, "spend_money" qui fait exactement la même chose que "spend_cash"


##### Y a-t-il des Security Hotspots ? Si oui, combien et pour quelle(s) raison(s) ?

Oui, 1 seul.

Dans l'action de sonarqube, on utilise un tag, ce qui n'est pas une bonne pratique,
car un tag n'est pas immuable, on pourrait faire de "l'injection de tag".

Sonarqube suggère d'utiliser le hash du commit à la place.
