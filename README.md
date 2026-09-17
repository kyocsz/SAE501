# Projet Infrastructure Réseau & Conteneurisation

## 1. Présentation du projet

Ce projet consiste à concevoir, déployer, sécuriser et documenter une infrastructure réseau reposant notamment sur des services conteneurisés.

L'infrastructure devra intégrer une segmentation réseau, des mécanismes de routage et de filtrage, plusieurs services réseau, de la supervision ainsi que des mesures de sécurité et de durcissement.

L'objectif est également de rendre l'infrastructure reproductible et de disposer d'une documentation technique permettant de comprendre son architecture, ses choix et son fonctionnement.

---

## 2. Objectifs du projet

- [ ] Concevoir l'architecture globale de l'infrastructure
- [ ] Mettre en place les réseaux **Users**, **Servers** et **Admin**
- [ ] Définir le plan d'adressage
- [ ] Définir l'assignation des conteneurs aux différents réseaux
- [ ] Configurer et déployer le firewall
- [ ] Définir les flux autorisés (**PASS**) et interdits (**DENY**)
- [ ] Mettre en place le serveur Web avec HTTPS
- [ ] Créer/utiliser des images Docker personnalisées pour le serveur Web
- [ ] Mettre en place le serveur DNS
- [ ] Mettre en place les postes de travail Linux utilisateurs
- [ ] Mettre en place la supervision
- [ ] Centraliser/analyser les logs avec Wazuh
- [ ] Vérifier le fonctionnement des communications avec Wireshark
- [ ] Sécuriser et durcir les services
- [ ] Automatiser le déploiement et la configuration
- [ ] Rendre l'infrastructure reproductible
- [ ] Produire la documentation technique
- [ ] Préparer la démonstration et la soutenance

---

# 3. Architecture de l'infrastructure

## 3.1 Vue globale

> **À compléter : insérer ici le schéma général de l'architecture.**

```text
                         ┌─────────────────────┐
                         │     Infrastructure  │
                         │       réseau        │
                         └──────────┬──────────┘
                                    │
                 ┌──────────────────┼──────────────────┐
                 │                  │                  │
                 ▼                  ▼                  ▼
          ┌────────────┐     ┌────────────┐     ┌────────────┐
          │   Users    │     │  Servers   │     │   Admin    │
          │   réseau   │     │   réseau   │     │   réseau   │
          └────────────┘     └────────────┘     └────────────┘
```

Le schéma définitif devra présenter les équipements, les réseaux, les conteneurs, les services et les flux principaux.

---

## 3.2 Réseaux

L'infrastructure est organisée autour de trois réseaux :

| Réseau | Rôle | Adresse | Passerelle | Éléments |
|---|---|---|---|---|
| Users | Postes utilisateurs | À définir | À définir | À définir |
| Servers | Services et serveurs | À définir | À définir | À définir |
| Admin | Administration | À définir | À définir | À définir |

> Les informations d'adressage seront complétées lors de la conception de l'infrastructure.

---

## 3.3 Plan d'adressage

| Équipement / Service | Réseau | Adresse IP | Masque | Passerelle | DNS |
|---|---|---|---|---|---|
| Firewall | À définir | À définir | À définir | - | À définir |
| Serveur Web | Servers | À définir | À définir | À définir | À définir |
| Serveur DNS | Servers | À définir | À définir | À définir | À définir |
| Poste Linux | Users | À définir | À définir | À définir | À définir |
| Administration | Admin | À définir | À définir | À définir | À définir |

---

## 3.4 Assignation des conteneurs aux réseaux

| Conteneur | Fonction | Réseau(x) | Ports exposés | Statut |
|---|---|---|---|---|
| Web | Serveur Web | À définir | À définir | ⬜ |
| DNS | Serveur DNS | À définir | À définir | ⬜ |
| Wazuh | Supervision / logs | À définir | À définir | ⬜ |
| Autre | À définir | À définir | À définir | ⬜ |

---

# 4. Services

## 4.1 Serveur Web

Le projet prévoit la mise en place d'un serveur Web accessible en **HTTPS**.

Éléments prévus :

- [ ] Déploiement du serveur Web
- [ ] Création/utilisation d'une image Docker personnalisée
- [ ] Configuration HTTPS
- [ ] Vérification de l'accès depuis le réseau Users
- [ ] Vérification des restrictions depuis les autres réseaux
- [ ] Documentation de la configuration

### Informations

- Nom du conteneur : `À définir`
- Image : `À définir`
- Adresse IP : `À définir`
- Port HTTPS : `À définir`
- Certificat : `À définir`

---

## 4.2 Serveur DNS

Un serveur DNS devra être intégré à l'infrastructure.

- [ ] Déploiement
- [ ] Configuration
- [ ] Définition des zones/domaines nécessaires
- [ ] Tests de résolution
- [ ] Vérification des communications
- [ ] Documentation

### Informations

- Nom du conteneur : `À définir`
- Image : `À définir`
- Adresse IP : `À définir`
- Domaine : `À définir`

---

## 4.3 Postes de travail Linux

Des postes de travail Linux seront utilisés sur le réseau **Users**.

- [ ] Installation/configuration
- [ ] Configuration réseau
- [ ] Configuration DNS
- [ ] Tests d'accès aux services
- [ ] Vérification du filtrage réseau

---

## 4.4 Supervision

La supervision doit permettre notamment de suivre :

- les conteneurs actifs ;
- les conteneurs arrêtés ;
- la consommation des ressources ;
- les erreurs des services ;
- les logs des conteneurs.

Wazuh est prévu pour la partie supervision/journalisation.

- [ ] Déployer Wazuh
- [ ] Configurer la récupération des logs
- [ ] Vérifier la remontée des événements
- [ ] Vérifier les erreurs de services
- [ ] Documenter la supervision

---

# 5. Réseau

## 5.1 Routage

Le routage entre les différents réseaux devra être défini selon les besoins de l'infrastructure.

- [ ] Identifier les réseaux nécessitant une communication
- [ ] Définir les routes
- [ ] Configurer le routage
- [ ] Tester les communications autorisées
- [ ] Vérifier les communications interdites

---

## 5.2 Firewall

Le firewall constitue le point de contrôle des communications entre les différents réseaux.

- [ ] Définir la politique de filtrage
- [ ] Configurer le firewall
- [ ] Déployer la configuration
- [ ] Tester les règles
- [ ] Documenter les règles

---

## 5.3 Politique de filtrage

Les flux devront être explicitement identifiés comme autorisés (**PASS**) ou interdits (**DENY**).

### Tableau de filtrage

| Source | Destination | Service / Port | Action | Justification |
|---|---|---|---|---|
| Users | Web | HTTPS | PASS | Accès au serveur Web |
| Users | DNS | DNS | PASS | Résolution DNS |
| Users | Admin | À définir | DENY | À justifier |
| Users | Servers | À définir | DENY/PASS | À définir |
| Admin | Servers | Administration | PASS | Administration |
| Admin | Users | À définir | DENY/PASS | À définir |

> Le tableau devra être complété et adapté à l'architecture finale.

---

## 5.4 Analyse réseau avec Wireshark

Wireshark sera utilisé pour analyser le fonctionnement des communications réseau.

- [ ] Capturer les échanges réseau
- [ ] Identifier les flux entre les réseaux
- [ ] Vérifier les communications autorisées
- [ ] Vérifier les communications bloquées
- [ ] Analyser les protocoles utilisés
- [ ] Conserver les éléments utiles à la démonstration

---

# 6. Conteneurisation

## 6.1 Docker Compose

Les différents services devront être déployés de manière structurée, notamment au moyen de Docker Compose.

- [ ] Créer le fichier `docker-compose.yml`
- [ ] Définir les services
- [ ] Définir les réseaux Docker
- [ ] Définir les volumes
- [ ] Définir les variables de configuration
- [ ] Définir les dépendances entre services
- [ ] Définir les règles de redémarrage

---

## 6.2 Règles de redémarrage

Les règles de démarrage/redémarrage devront être définies dans `docker-compose.yml`, notamment avec la clé :

```yaml
restart:
```

- [ ] Définir les politiques de redémarrage
- [ ] Tester le redémarrage des services
- [ ] Vérifier le comportement après un arrêt/reboot

---

## 6.3 Dépendances entre services

Les dépendances nécessaires entre les différents services devront être documentées et configurées.

- [ ] Identifier les dépendances
- [ ] Configurer les dépendances dans Docker Compose
- [ ] Tester le démarrage dans le bon ordre
- [ ] Vérifier le comportement après redémarrage

---

## 6.4 Volumes

Les données nécessitant une persistance devront être stockées dans des volumes adaptés.

| Service | Volume | Données stockées | Persistance |
|---|---|---|---|
| Web | À définir | À définir | À définir |
| DNS | À définir | À définir | À définir |
| Wazuh | À définir | À définir | À définir |

---

## 6.5 Variables de configuration

Les variables de configuration devront être séparées de la configuration principale lorsque cela est pertinent.

Un fichier `.env` pourra être utilisé.

```text
.env
```

> Les secrets ne doivent pas être exposés directement dans le dépôt ou dans les fichiers de configuration versionnés.

---

## 6.6 Réseaux Docker

Les réseaux Docker devront être configurés afin de contrôler les communications entre les conteneurs.

- [ ] Créer les réseaux nécessaires
- [ ] Affecter chaque conteneur au(x) réseau(x) approprié(s)
- [ ] Limiter les communications inter-conteneurs
- [ ] Tester l'isolation

---

# 7. Sécurité et durcissement

La sécurité doit être intégrée à l'ensemble de l'infrastructure.

## 7.1 Utilisateurs non privilégiés

Les services doivent, lorsque cela est possible, s'exécuter avec un utilisateur non privilégié.

- [ ] Identifier les services concernés
- [ ] Créer/configurer les utilisateurs nécessaires
- [ ] Vérifier les privilèges effectifs

---

## 7.2 Réduction de la surface d'exposition

Les ports inutiles devront être supprimés ou ne pas être exposés.

- [ ] Identifier les ports nécessaires
- [ ] Supprimer les ports inutiles
- [ ] Vérifier les ports ouverts
- [ ] Documenter les ports conservés

---

## 7.3 Limitation des capacités

Les capacités matérielles et ressources des conteneurs devront être limitées lorsque cela est pertinent.

- [ ] Définir les limites de ressources
- [ ] Limiter CPU/mémoire si nécessaire
- [ ] Vérifier la consommation
- [ ] Documenter les limites

---

## 7.4 Réseaux dédiés

L'utilisation de réseaux dédiés permettra de limiter les communications inutiles.

- [ ] Définir les réseaux
- [ ] Affecter les services aux réseaux nécessaires
- [ ] Vérifier l'isolation

---

## 7.5 Limitation des communications inter-conteneurs

Les communications entre conteneurs devront être limitées au strict nécessaire.

- [ ] Identifier les communications nécessaires
- [ ] Bloquer les communications inutiles
- [ ] Tester les règles
- [ ] Documenter les flux

---

## 7.6 Gestion des secrets

Les secrets devront être gérés correctement.

- [ ] Identifier les secrets nécessaires
- [ ] Éviter leur présence en clair dans le dépôt
- [ ] Sécuriser les fichiers contenant des informations sensibles
- [ ] Documenter la méthode de gestion retenue

---

## 7.7 Limitation des privilèges

Les conteneurs et services devront disposer uniquement des privilèges nécessaires à leur fonctionnement.

- [ ] Vérifier les privilèges
- [ ] Réduire les privilèges inutiles
- [ ] Vérifier les capacités Linux/Docker
- [ ] Documenter les choix

---

## 7.8 Images minimales

Les images Docker devront être aussi minimales que possible afin de réduire la surface d'attaque.

- [ ] Choisir des images adaptées
- [ ] Supprimer les composants inutiles
- [ ] Éviter les outils inutiles dans les images finales
- [ ] Documenter les images utilisées

---

## 7.9 Mise à jour des images

Les images utilisées devront être maintenues à jour.

- [ ] Vérifier les versions
- [ ] Mettre à jour les images
- [ ] Tester après mise à jour
- [ ] Documenter les versions utilisées

---

# 8. Automatisation et reproductibilité

L'infrastructure doit pouvoir être redéployée de manière reproductible.

## 8.1 Déploiement

- [ ] Automatiser le déploiement des services
- [ ] Centraliser les configurations
- [ ] Éviter les configurations manuelles inutiles
- [ ] Documenter les commandes de déploiement

---

## 8.2 Configuration

Les paramètres nécessaires au fonctionnement de l'infrastructure devront être clairement identifiés.

- [ ] Variables d'environnement
- [ ] Configuration Docker
- [ ] Configuration réseau
- [ ] Configuration firewall
- [ ] Configuration DNS
- [ ] Configuration HTTPS

---

## 8.3 Reproduction de l'infrastructure

Une nouvelle installation doit pouvoir être réalisée à partir des fichiers du projet et de la documentation.

### Procédure prévue

```bash
# À compléter
```

---

# 9. Tests et validation

## 9.1 Tests réseau

- [ ] Test de connectivité Users
- [ ] Test de connectivité Servers
- [ ] Test de connectivité Admin
- [ ] Test du routage
- [ ] Test du DNS
- [ ] Test du serveur Web

---

## 9.2 Tests du firewall

Pour chaque règle :

- [ ] Vérifier les flux autorisés
- [ ] Vérifier les flux interdits
- [ ] Vérifier les ports accessibles
- [ ] Vérifier les communications inter-réseaux

---

## 9.3 Tests des services

| Service | Test | Résultat | Date |
|---|---|---|---|
| Web | Accès HTTPS | ⬜ | |
| DNS | Résolution | ⬜ | |
| Wazuh | Remontée de logs | ⬜ | |
| Docker | Redémarrage | ⬜ | |

---

## 9.4 Tests de sécurité

- [ ] Vérifier les ports ouverts
- [ ] Vérifier les privilèges
- [ ] Vérifier les utilisateurs des conteneurs
- [ ] Vérifier les communications inter-conteneurs
- [ ] Vérifier les secrets
- [ ] Vérifier les images
- [ ] Vérifier les limites de ressources

---

## 9.5 Analyse Wireshark

Les captures Wireshark devront permettre de démontrer le comportement réel de l'infrastructure.

> **À compléter : ajouter ici les captures et conclusions importantes.**

---

# 10. Documentation technique

La documentation devra présenter les éléments suivants :

- [ ] Architecture
- [ ] Plan d'adressage
- [ ] Réseaux
- [ ] Services
- [ ] Firewall
- [ ] Choix techniques
- [ ] Mesures de sécurité
- [ ] Conteneurisation
- [ ] Procédure de déploiement
- [ ] Procédure de test
- [ ] Résultats

---

## 10.1 Choix techniques

Pour chaque choix important :

| Choix | Solution retenue | Justification |
|---|---|---|
| Conteneurisation | À définir | À compléter |
| Réseaux | À définir | À compléter |
| Firewall | À définir | À compléter |
| DNS | À définir | À compléter |
| Web | À définir | À compléter |
| Supervision | Wazuh / à confirmer | À compléter |

---

# 11. Démonstration

La démonstration devra présenter le fonctionnement concret de l'infrastructure.

## Scénario envisagé

1. Présentation rapide de l'architecture
2. Présentation des trois réseaux
3. Présentation des services conteneurisés
4. Démonstration de la résolution DNS
5. Accès au serveur Web en HTTPS
6. Démonstration du routage
7. Démonstration du filtrage firewall
8. Vérification d'un flux autorisé
9. Vérification d'un flux interdit
10. Présentation de la supervision et des logs
11. Analyse d'un flux avec Wireshark
12. Présentation des mesures de sécurité
13. Démonstration de la reproductibilité du déploiement

> Le scénario définitif sera adapté à l'état final de l'infrastructure.

---

# 12. Soutenance

La soutenance finale est prévue pour environ **20 minutes par binôme**, avec une partie consacrée à la démonstration.

Une partie de la soutenance comporte également des **questions individuelles** destinées à vérifier la compréhension de chaque membre du binôme.

## Préparation

- [ ] Préparer le support de présentation
- [ ] Préparer le schéma d'architecture
- [ ] Préparer la démonstration
- [ ] Préparer les captures Wireshark
- [ ] Préparer les éléments de sécurité
- [ ] Préparer les commandes importantes
- [ ] Vérifier que chaque membre maîtrise l'ensemble du projet
- [ ] Faire une répétition chronométrée

---

# 13. Suivi de l'avancement

| Domaine | État |
|---|---|
| Analyse et conception de l'architecture | ⬜ |
| Conteneurisation et services | ⬜ |
| Réseaux et segmentation | ⬜ |
| Routage et filtrage | ⬜ |
| Sécurité et durcissement | ⬜ |
| Automatisation et reproductibilité | ⬜ |
| Documentation | ⬜ |
| Démonstration et soutenance | ⬜ |

### Légende

- ⬜ À faire
- 🟨 En cours
- 🟩 Terminé
- 🟥 Bloqué

---

# 14. Arborescence du projet

```text
projet/
├── README.md
├── docker-compose.yml
├── .env
├── docker/
│   ├── web/
│   │   └── Dockerfile
│   ├── dns/
│   │   └── Dockerfile
│   └── ...
├── config/
│   ├── firewall/
│   ├── dns/
│   ├── web/
│   └── ...
├── scripts/
│   └── ...
├── documentation/
│   ├── architecture/
│   ├── reseau/
│   ├── securite/
│   └── captures/
└── tests/
    └── ...
```

> L'arborescence sera adaptée à l'organisation réelle du projet.

---

# 15. Informations à compléter

- [ ] Nom définitif du projet
- [ ] Membres du binôme
- [ ] Architecture finale
- [ ] Plan d'adressage
- [ ] VLAN/réseaux définitifs si utilisés
- [ ] Solution de routage
- [ ] Solution firewall
- [ ] Images Docker utilisées
- [ ] Services définitifs
- [ ] Ports
- [ ] Adresses IP
- [ ] Configuration DNS
- [ ] Configuration HTTPS
- [ ] Configuration Wazuh
- [ ] Méthode d'automatisation
- [ ] Procédure de déploiement
- [ ] Résultats des tests

---

# 16. Références du barème

Le projet est organisé autour des domaines d'évaluation suivants :

| Domaine | Points |
|---|---:|
| Analyse et conception de l'architecture | 10 |
| Conteneurisation et services | 15 |
| Réseaux et segmentation | 15 |
| Routage et filtrage | 15 |
| Sécurité et durcissement | 15 |
| Automatisation et reproductibilité | 10 |
| Documentation | 10 |
| Démonstration et soutenance | 10 |
| **Total** | **100** |

Le README suit volontairement cette structure afin de faciliter le suivi du projet et la préparation de la soutenance.
