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

##### Question 1

Sur l’onglet Summary d’une analyse de code, SonarCloud fournit 4 indicateurs.
Quels sont-ils et quelles sont leurs utilités ?

- New issues, nouveaux problèmes depuis le code
- Accepted issues, Les "issues" depuis SonarQube cloud qui ont été résolues
- Coverage (il faut l'activer), Coverage en pourcentage du code
- Duplications: Code dupliqué j'imagine

##### Question 2

QualityGate: Pas accès pour l'instant