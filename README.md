[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/jefschaerz/ITActionsManager-Rails-2021.git)

# ITActionsManager-Rails-2021
Application écrite en Ruby on Rails pour gérer les interventions réalisées sur des équipements informatiques.

<a name="top"></a>
Ce repository contient les sources du projet "ITActionManager" réalisé dans le cadre du CAS-DAR RoR / 2021.

- [Description de l'application](#description-application)
- [Utilisation de l'application](#utilisation-application)
- [Choix lors du développpement](#choix-developpement)
- [Ressources externes](#ressources-externes)
- [Remarques sur le projet](#remarques-projet)

<a name="description-application"></a>
# Description de l'application
L'application "ITActionsManager" permet à des utilisateurs de type "Admin" ou "User" de saisir des informations sur les actions réalisées 
sur des équipements informatiques de plusieurs type (PC, serveurs ou imprimantes).
C'est en fait un journal des actions de suivi.

<a name="utilisation-application"></a>
# Utilisation de l'application
L'utilisateur doit d'abord se connecter dans l'application avec son nom d'utilisateur et mot de passe.
Deux types d'utilisateur sont possibles :
* L'utilisateur "Admin" a le droit de créer/modifier ou effacer des équipements. 
	Il peut créer un nouvel utilisateur User ou Admin.
	Il peut également effectuer toutes les opérations du "User".
* L'utilisateur "User" ne peut que visualiser, créer ou modifier des interventions sur des équipements.

Lors de la création d'une nouvelle intervention ou équipement, il faut fournir les informations nécessaires.

Les équipements possèdent les informations suivantes :
* No d'équipement (unique) / Auto
* Description (ex PC001)
* Type (PC ou Serveur ou Imprimante)

Les interventions sont créées en fournissant les informations :
* No intervention (unique)
* Date d'intervention
* Créer par User
* Catégorie (Maintenance, Update, Incident)
* Choix de l'équipement (ci-dessus)
* Détails de l'intervention
* Eventuellement : Etat de l'intervention (Ouvert, Clos)

<a name="choix-developpementn"></a>
# Choix du développpement
Tables nécessaires :
* Pour les users (id, username: string, email:string, password_digest:string, firstname:string, lastname:string, role:string)
* Pour les types d'équipement (id, description:string)
* Pour les resources (id, description:string, type_equipement:reference)
* Pour les types d'intervention (id, description:string)
* Pour les interventions (id, date:datetime, user:id, intervention_type:id, resource:Id, details:text, open_state:boolean)

<a name="ressources-externes"></a>
# Ressources externes
*Bootstrap v5.0 (par CDN) 
*GEM Bcrypt pour password
*Flash messages : https://www.rubyguides.com/2019/11/rails-flash-messages/


<a name="remarques-projet"></a>
# Remarques sur le projet
* Utilisation d'un objet "session" pour la gestion d'un utilisateur connecté