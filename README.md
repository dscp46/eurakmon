# EurakMon
Surveillance de présence secteur sur les alimentations type SLAT Eurak Titan

## Schéma câblage

3 GPIO sont nécessaires pour assurer le bon fonctionnement du montage:
  - `GPIO_EDF` => Présence secteur. Relier sur le contact NO présence secteur (pins `1` et `2` sur le port DB15 pour des Eurak Titan).
  - `GPIO_ALIM` => Présence alimentation, utilisé pour détecter l'arrachement/coupure du cable de supervision. Relier sur un contact NO fonctionnement redresseur (pins `4` et `5` sur le port DB15 pour des Eurak Titan).
  - `GPIO_LOOP` => Présence accessoire. Si votre accessoire n'est pas solidaire du système supervisant, forcer cette GPIO à la masse. Etat logique inversé.

> [!NOTE]
> TODO: Schéma de câblage

## Table d'états

| Etat | Sévérité Alarme | Icone APRS | Code Icone | 
| --- | :---: | :---: | :---: |
| Sur secteur | *Effacée* | ![Aprs Icon PW](pic/aprs-ok.png) | PW |
| Sur batterie | Mineure | ![Aprs Icon P0](pic/aprs-bat.png) | P0 |
| Liaison de supervision KO | Majeure | ![Aprs Icon Pn](pic/aprs-maj.png) | Pn |
| Cable non connecté sur supervisant | Majeure | ![Aprs Icon Pn](pic/aprs-maj.png) | Pn |
| Aucune remontée | Critique | *N/A* | *N/A* |

## Installation

```bash
apt install -y gpiod
git clone "https://github.com/dscp46/eurakmon"
cd eurakmon
```

Editer le fichier `eurakmon` pour mettre à jour les éléments suivants:
  * Le callsign relais (champ `QRZ`).
  * Le passcode APRS-IS (champ `PASSCODE`).
  * La localisation du relais (champs `LAT` et `LON`).
  * Si applicable, le FQDN du serveur APRS-IS de rattachement (champ `SERVER`).
  * Si applicable, les numéros des pins GPIO utilisées (voir schéma).

```bash
bash install.sh
```
