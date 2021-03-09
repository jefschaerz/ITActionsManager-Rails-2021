[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/jefschaerz/ITActionsManager-Rails-2021.git)

# ITActionsManager-Rails-2021
Application écrite en Ruby on Rails pour gérer les interventions réalisées sur des équipements informatiques.

<a name="top"></a>
Ce repository contient les sources du projet "ITActionManager" réalisé dans le cadre du CAS-DAR RoR / 2021.

- [Description de l'application](#description-application)
- [Utilisation de l'application](#utilisation-application)
- [Choix lors du développpement](#choix-developpement)
- [Remplir la base de données](#remplir-db)
- [Ressources externes](#ressources-externes)
- [Remarques sur le projet](#remarques-projet)

<a name="description-application"></a>
# Description de l'application
L'application "ITActionsManager" permet à des gérer les actions et interventions réalisées sur des équipements informatiques de plusieurs types. 
C'est en fait un journal des actions de suivi sur les équipements.

<a name="utilisation-application"></a>
# Utilisation de l'application
L'utilisateur doit d'abord se connecter dans l'application avec son nom d'utilisateur et son mot de passe. 
Pour un nouvel utilisteur, il est nécessaire de s'inscrire en fournissant un username et une adresse e-mail aini qu'un mot de passe.
Ce nouvel utilisateur ne sera que "Contributor".

Deux types d'utilisateur sont possibles (role) :
* Admin
* Contributor 

L'utilisateur "Contributor" ne peut que :
** Editer son profil
** Visualiser la liste des équipements, la liste des types d'intervention et la liste des appareils
** Visualiser, créer et modifier des interventions sur des équipements (modification seulement sur ces propre inteventions).

L'utilisateur "Admin" a, en plus, le droit de  :
* Créer/modifier ou effacer des types d'équipements, des types d'interventions et des équipements
* Créer un nouvel utilisateur Contributor ou Admin.

Lors de la création d'une nouvelle intervention ou équipement, il faut fournir les informations nécessaires.

Les équipements (device) possèdent les informations suivantes :
* No d'équipement (unique) / Auto
* Description (ex PC001)
* Type (PC ou Serveur ou Imprimante)

Les "interventions" sont créées en fournissant les informations :
* No intervention (unique)
* Date d'intervention
* Créer par User
* Catégorie (Maintenance, Update, Incident)
* Choix de l'équipement (ci-dessus)
* Détails de l'intervention
* Etat de l'intervention (Open, Close ou Pending)

<a name="choix-developpementn"></a>
# Choix du développpement
Tables nécessaires :
* Pour les users (id, username: string, email:string, password_digest:string, firstname:string, lastname:string, role:string)
* Pour les types d'équipement (id, description:string)
* Pour les devices (id, description:string, type_equipement:reference)
* Pour les types d'intervention (id, description:string)
* Pour les interventions (id, date:datetime, user:id, intervention_type:id, resource:Id, details:text, intervention_state:id)
* Pour les états des interventions (id, description:string)

<a name="remplir-db"></a>
# Remplir la base de donnéesdb
Un fichier seed.rb permet de remplir la base avec une certain nombre de resources.
Lancer la commande "rails db:setup db:seed"
Les utilisateurs utilisent le même mot de passe : 1234 avec notamment une utilisateur "Admin".

<a name="ressources-externes"></a>
# Ressources externes
* Bootstrap v5.0 (par CDN) 
* GEM Bcrypt pour l'encryption des mots de passe
* Flash messages : https://www.rubyguides.com/2019/11/rails-flash-messages/
* Simple_Form :https://github.com/heartcombo/simple_form
* Pagy V3.11 pour la pagination : https://github.com/ddnexus/pagy
* Utilsation de scope pour filtrer les résultats selon http://filterrific.clearcove.ca/pages/active_record_scope_patterns.html
* Faker : https://github.com/faker-ruby/faker

<a name="remarques-projet"></a>
# Remarques sur le projet
* Les fonctionnalités du frameworok Ruby on rails sont très intéressantes et les scaffold pemettent de développer rapidement une application CRUD.
* Le mise en place de test System n'a pas fonctionné. Quelques tests au niveau du model ont par contre été mis en place automatiquement par l'utilisation du scaffold,
mais aussi après coup manuellement pour test quelques possibilités de base.

Il y a un nombre impressionant de GEM a disposition pour faciliter l'utilisation des form, filtres, etc.
Difficile de savoir lequel utiliser sans avoir un peu joué avec et testé les fonctionnalités.

<a name="Améliorations possibles"></a>
# Améliorations possibles...
* Validation approfondie des champs saisis 
* Utilisation d'un objet "session" pour la gestion d'un utilisateur connecté
* L'utilisation des partials pour diminuer la duplication de code dans les vues pour les New ou Edit
* Activation de la suppression d'un User ou Intervention type, mais gestion des dépendances lors d'effacement par modificaton des foreign key en "On Delete Cascade" (et pas en On Delete Restrict par défaut)
* Utilisation d'un model pour le role et pas uniquement une string dans le model user.