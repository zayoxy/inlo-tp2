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


### Exercice 3 - GitLab CI/CD

#### a)

##### Que fait le job pytest ?

Il build le projet avec pip (uv du coup), et il lance les unit tests avec pytest.

##### Que fait le job image-creation ?

Il build l'image docker en utilisant le `Dockerfile` et le publie
sur le container registry de GitLab (de la he-arc du coup).

Container registry: <https://gitlab-etu.ing.he-arc.ch/alexandre.guillaume/inlo-tp2/container_registry>

##### Que fait le job package-creation ?

Il crée un fichier wheel du projet, qui le rendrait installable en utilisant pip (ou uv) et le publie sur le package registry du GitLab de la he-arc aussi.

Package registry: <https://gitlab-etu.ing.he-arc.ch/alexandre.guillaume/inlo-tp2/-/packages>

##### Dans quel ordre les différents jobs s'executent-ils et pourquoi ?

Les pipelines de GitLab fonctionnent avec des stage, notre CI est composé des stages suivants:

- test
- package
- test-package

Tous les jobs du même stage sont exécutés en parallèle, 
et tout les jobs doivent avoir fini un stage avant que les runners puissent passer au stage suivant.

#### b)

Installer le package depuis le registry: 

```bash
pip install tp2 --index-url https://gitlab-ci-token:<TOKEN>@gitlab-etu.ing.he-arc.ch/api/v4/projects/6003/packages/pypi/simple
```

> Le token doit avoir les accès `read_api` pour pouvoir download le package.

#### c)


##### A quel moment de la pipeline ce job s'execute-t-il et pourquoi ?

Dans le dernier stage (`test-package`) donc après que les 2 tests dans le stage `package`.

##### Que fait le job wheel-testing ?

Il installe le package `tp2` qui à été publié au préable sur le Package registry de la he-arc.

Ensuite il lance un petit programme python ou il essaie de l'importer et de l'utiliser afin de voir que tout est fonctionnel.
