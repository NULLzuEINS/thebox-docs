# La boîte

Bonjour et bienvenue dans la « Box » ! Lorsque je voyage, j'aime aussi séjourner dans des AirBnB et parfois j'aimerais avoir un morceau de papier avec toutes les informations nécessaires sur l'hébergement, l'enregistrement et le départ et voici ma tentative pour l'améliorer :

## Enregistrement

### Clé

Vous obtenez deux paires de clés, chacune avec une clé pour le bas et une pour le haut. Il y a aussi une clé sur un porte-clés que vous pouvez utiliser pour verrouiller votre chambre.

### accès Internet

```txt
SSID:     hamburg-bei-nacht
Passwort: landungsbruecken
```

Ou vous scannez ce QR code, il vous connectera automatiquement au réseau :

\|![WiFi](assets/wlan.png)

## Les chambres

!\[[actifs/thebox-map-detail.png]]

### Cuisine

Comme je mange habituellement en bas avec ma famille, la cuisine est très spartiate. Malheureusement, la vaisselle ne peut être faite que dans le lavabo de la salle de bain.

**Les éléments suivants sont à votre disposition :**

1.  Troupeau
2.  Bouilloire
3.  Vaisselle couverts
4.  Réfrigérateur
5.  Pizza de
6.  Eau minérale
7.  Station de recharge de téléphone portable sur l'étagère
8.  Machine à laver

**Le poêle ne fonctionne pas ?**Veuillez dire « Ordinateur, établi allumé »

#### Ta chambre

**Les matelas**se trouvent uniquement les uns sur les autres pour le stockage. Vous pouvez les distribuer selon vos besoins. Si vous remplacez les coussins du canapé par un matelas, vous obtenez un bon lit.

**L'ordinateur**et le**Drucker**vous êtes invités à l'utiliser.

```txt
Nutzer:   thebox
Passwort: thebox
```

**Les éléments suivants sont à votre disposition :**

1.  Tous les meubles et lits
2.  Ordinateur
3.  Télécommandes pour lumières et électricité

**La lumière ne s'allume pas ou clignote énormément ?**Utilisez les télécommandes.

#### salle de bain

**La douche**vous pouvez l'utiliser debout. Ce n'est pas grave si le sol est un peu mouillé. Ouvrez seulement 1/3 d'eau et suspendez le tapis de bain au-dessus du radiateur pour le faire sécher.

**Meurs Alexa**sur le mur s'appelle « Ordinateur » et diffuse également votre musique ou votre radio préférée. Par exemple. "_Ordinateur, joue à Deutschlandfunk Nova_"

**les serviettes**Vous pourrez l'accrocher à tous les crochets et ranger vos affaires n'importe où.

#### Couloir

Vous pouvez laisser vos chaussures ici. J'ai aussi un petit bloc-notes sur l'étagère au cas où tu voudrais me dire quelque chose.

## Vérifier

Le**Remise des clés**nous discutons individuellement.**Literie**vous pouvez le laisser. Le**Vaisselle**et le**Ordures**Je le fais aussi.

> **Court:**Laissez la clé là, fermez la porte, c'est tout.

* * *

## Conseils

Avec l'application Leipzig MOVE, vous bénéficiez de 10 trajets gratuits de 15 minutes chacun_Suivantbikes_. A noter que cela coûte plus cher si vous ne garez pas vos vélos dans les rues principales (en violet sur le plan). Les scooters électriques ne peuvent être garés que sur certaines places de stationnement.

## Des questions?

Si vous avez des questions ou avez besoin d'aide, je serai heureux de vous aider. Si vous êtes pressé, il est préférable de le faire par téléphone`+49 170 73 53 067`. Vous pouvez également utiliser l'application de messagerie préinstallée avec des fonctionnalités limitées (SMS). Sinon, j'ai un bloc-notes et un stylo dans le couloir.

Bon séjour à Leipzig !
André

* * *

# la boîte

> Ce projet concerne un réservoir d'eau intelligent. Il mesure le niveau d'eau et envoie les données à un serveur. Le serveur peut être utilisé pour contrôler la pompe à eau. La pompe peut être contrôlée via une interface Web ou via un robot télégramme. Il utilise un capteur à ultrasons HC-SR04 pour mesurer le niveau d'eau. Les données sont envoyées à TTN via une passerelle LoRaWAN.

?> Le document original a été rédigé en[Anglais](README.md). La traduction a été réalisée avec Google Translate. Si vous trouvez des erreurs, essayez de les ignorer. Merci!

* * *

## Table des matières

1.  **Démarrage rapide**
    1.  Introduction
    2.  Matériel
    3.  Logiciel Flash
2.  **Matériel**
    1.  Capteurs
    2.  Source de courant
    3.  Logement
    4.  Microcontrôleur
    5.  Passerelle (facultatif)
3.  **Assemblage**
    1.  Capteur à contrôleur
    2.  Alimentation du contrôleur
    3.  Dépannage
4.  **Installation**
    1.  TTN
        1.  Créer un compte
        2.  Créer une application
        3.  Configurer le décodeur
        4.  Copier les informations d'identification
    2.  Appareil
        1.  Télécharger le pilote
        2.  Clignotant
        3.  Configuration
5.  **Débogage**
    1.  Moniteur série
    2.  Console TTN
    3.  Client MQTT
    4.  Pièges
6.  **Ingénierie des données**
    1.  Nœud ROUGE
    2.  Grafana
    3.  Compétence Alexa
    4.  Azure Connect

* * *

## Démarrage rapide

### Démarrage rapide - Introduction

Le démarrage rapide est destiné aux personnes qui souhaitent démarrer immédiatement et avoir des connaissances approfondies sur l'IoT avec le framework Arudino. Si vous voulez comprendre comment cela fonctionne, vous pouvez lire le[Documentation](#hardware).

### Démarrage rapide - Présentation du matériel

Vous avez besoin des pièces suivantes :

-   Microcontrôleur avec puce LoRa
-   Capteur
-   Source de courant
-   Logement

?> Si vous souhaitez en savoir plus sur les pièces, vous pouvez lire le[documentation matérielle](#Hardware).

### Démarrage rapide - Logiciel Flash

1.  Connectez votre carte à votre ordinateur et
2.  Cliquez sur le bouton suivant :

?> Si vous souhaitez en savoir plus sur le processus de flashage, vous pouvez lire le[documentation de configuration](#Setup).

## Matériel

1.  [Capteurs](#Sensors)
2.  [Source de courant](#Power-supply)
3.  [Logement](#Housing)
4.  [Microcontrôleur](#Microcontroller)
5.  [passerelle](#Gateway)

### Capteurs

Pour mesurer le niveau d'eau, vous avez besoin d'un capteur. Ce n’est pas une tâche facile de trouver un capteur étanche et pouvant être utilisé dans un réservoir d’eau. Les capteurs suivants sont pris en charge et recommandés :

#### Débutant

Si vous êtes débutant, nous vous recommandons d'utiliser des capteurs bon marché pour construire votre premier prototype. Les capteurs suivants sont pris en charge et recommandés :

| Partie                                              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![HC-S04 sensor](_media/hardware/sensor-hcsr04.svg) | [Capteur à ultrasons HC-SR04](https://amzn.to/3MHNrbJ)Le capteur est relativement bon marché et facile à utiliser. Il n'est pas étanche. Il faut le mettre dans un boîtier étanche. Nous recommandons ce capteur si vous souhaitez simplement l'essayer. Il n'est pas recommandé pour une utilisation à long terme. Le**HC-SR04**Le capteur est un capteur à ultrasons utilisé pour la mesure de distance. Il émet des ondes sonores à haute fréquence et détecte le temps nécessaire aux ondes pour rebondir après avoir heurté un objet. Ce temps est ensuite utilisé pour calculer la distance entre le capteur et l'objet. Il a une portée allant jusqu'à 4 mètres et peut être interfacé avec des microcontrôleurs comme Arduino, Raspberry Pi, etc. Le HC-SR04 est couramment utilisé dans la robotique, l'automatisation, les systèmes de sécurité et d'autres applications nécessitant une détection de distance précise et fiable. |
| ![](_media/hardware/sensor-vl6180x.svg)             | [BL6180X](https://amzn.to/3zVEFPM)Le capteur de temps de vol est relativement bon marché et facile à utiliser. Le module de distance laser VL6180X est un capteur qui utilise un laser pour mesurer la distance entre le capteur et un objet. Il s'agit d'un capteur de temps de vol (ToF), ce qui signifie qu'il mesure le temps nécessaire à la lumière laser pour rebondir sur un objet et revenir au capteur. Le capteur n'est pas étanche mais a une précision plus élevée. Il faut le mettre dans un boîtier étanche. Nous recommandons ce capteur si vous souhaitez simplement l'essayer. Il n'est pas recommandé pour une utilisation à long terme.                                                                                                                                                                                                                                                                                 |

#### Avancé

Si vous souhaitez utiliser ce projet pendant une longue période, nous vous recommandons d'utiliser des capteurs plus coûteux. Les capteurs suivants sont pris en charge et recommandés :

| Partie                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ---------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![CQRobot](_media/hardware/sensor-water-CQRobot.svg)                   | [capteur de niveau d'eau](https://amzn.to/41sKAaL)Ce capteur utilise des principes optiques pour détecter les niveaux de liquide et est connu sous le nom de capteur photoélectrique de niveau de liquide d'eau. Un avantage majeur de ce type de capteur est son excellente sensibilité et l’absence de pièces mécaniques, ce qui conduit à un étalonnage moins fréquent. La sonde du capteur elle-même est petite et flexible en termes d'orientation de placement, ce qui lui permet de détecter diverses conditions telles que le déversement de solution, la sécheresse et le niveau horizontal. De plus, ce capteur peut fonctionner comme un système de rappel et d’alarme. L'appareil comporte une diode électroluminescente et un phototransistor intégrés, la partie chargée étant complètement isolée du liquide contrôlé, garantissant ainsi la sécurité.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ![Water proof Ultrasonic Sensor](_media/hardware/sensor-JSN-SR04T.svg) | [Capteur ultrasonique étanche à l'eau](https://amzn.to/3MNk4F2)Le JSN-SR04T est un module de capteur à ultrasons qui utilise la technologie sonar pour détecter la distance des objets. Ce module compact et facile à utiliser présente une précision et une fiabilité élevées, ce qui en fait un choix idéal pour une large gamme d'applications, notamment la robotique, l'automatisation et les systèmes de sécurité. Le capteur a une portée de détection allant jusqu'à 5 mètres et peut détecter des objets dans un angle de 15 degrés. Il fonctionne à une fréquence de 40 kHz et a une résolution de 1 cm. Le module comprend également une fonction de compensation de température intégrée, garantissant des lectures stables et précises même dans des conditions de température variables.**Le JSN-SR04T**Le module est conçu avec un boîtier étanche à l'eau et à la poussière, ce qui le rend adapté à une utilisation dans des environnements difficiles. Il est facile à installer et s'intègre parfaitement à une large gamme de microcontrôleurs, tels que Arduino et Raspberry Pi, grâce à sa simple interface à trois broches. Dans l'ensemble, le module de capteur à ultrasons JSN-SR04T est un excellent choix pour tous ceux qui recherchent une solution de mesure de distance fiable et précise pour leurs projets. |

### Source de courant

Pour alimenter le microcontrôleur, vous avez besoin d'une alimentation. L’accu 18650 est la meilleure option. C'est bon marché et vous pouvez le recharger avec un panneau solaire. Mais vous pouvez également utiliser une banque d'alimentation ou une alimentation USB.

| Partie                                                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![18650 battery](_media/hardware/hardware-18650.svg)    | Il existe de nombreux types de piles. Les plus courants sont le lithium-ion, le lithium polymère et le lithium fer phosphate. Le**Batterie 18650**est une batterie Lithium Ion. C'est la meilleure option pour ce projet. C'est bon marché et vous pouvez le recharger avec un panneau solaire. Il est composé de Lithium Ion et peut être chargé jusqu'à 500 fois. La batterie 18650 a une tension de 3,7 V et peut avoir une capacité d’environ 2 200 mAh. Le panneau solaire a une tension de 5V et une puissance de 2W. Le panneau solaire peut charger la batterie en 3 heures. Notre capteur a besoin de 5V et 100mA. Le microcontrôleur a besoin de 5 V et 100 mA. Il nous faut donc deux accus 18650 et un régulateur de tension pour obtenir 5V. La batterie n'est pas étanche. Il faut le mettre dans un boîtier étanche. Faites également attention aux températures élevées. La batterie peut exploser si elle est trop chaude. Nous recommandons cette batterie si vous souhaitez l'utiliser pendant une longue période. |
| ![Solar panel](_media/hardware/hardware-solarpanel.svg) | **Panneau solaire:**Puisque nous sommes dans notre jardin, nous pouvons utiliser un panneau solaire. Il est étanche et peut être utilisé sous la pluie. Il est en silicium polycristallin et a une puissance de 2W. Si vous achetez un panneau solaire, vous devez vous assurer qu'il dispose d'une sortie 5 V avec au moins 400 mA. Pour charger nos batteries, nous avons besoin d'un contrôleur de charge. Heureusement, le microcontrôleur intègre un contrôleur de charge. Nous pouvons donc utiliser le panneau solaire directement.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

### Logement

Pour protéger le capteur et le microcontrôleur, vous avez besoin d'un boîtier. Le boîtier doit être étanche et un peu résistant aux températures élevées et aux rayons UV.
Utiliser**PETG**c'est bon pour les prototypes. Il n'est pas étanche et peut être détruit par les rayons UV. Utiliser**PETG**pour une utilisation à long terme. Il est imperméable et résistant aux UV. Vous pouvez aussi utiliser**abdos**. Il est imperméable et résistant aux UV.

Même**tupperware**est une bonne option. Il est imperméable et résistant aux UV.

### Microcontrôleur

Le microcontrôleur est le cerveau du système. Il se charge de mesurer le niveau d’eau et d’envoyer les données au serveur. Les microcontrôleurs suivants sont pris en charge et recommandés :

| Partie                                                              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![Seamuing SX1262 LoRa Modul](_media/hardware/hardware-esplora.svg) | Le[Seamuing SX1262 Module LoRa 868](https://amzn.to/3UFRGq5)est un microcontrôleur avec un module LoRa. Il est bon marché et facile à utiliser. Le SX1262 est un émetteur-récepteur longue portée de faible consommation hautement intégré conçu pour être utilisé dans une variété d'applications de communication sans fil. Il dispose d'un mode de consommation d'énergie ultra faible, ce qui le rend idéal pour les applications alimentées par batterie nécessitant une longue durée de vie de la batterie. Le SX1262 utilise la technique de modulation LoRa, qui permet une communication longue portée avec une consommation d'énergie minimale. Avec une portée allant jusqu'à 15 km en visibilité directe et jusqu'à 2 km en environnement urbain, le SX1262 est un excellent choix pour les applications de communication sans fil longue portée. L'émetteur-récepteur fonctionne dans la gamme de fréquences 860-930 MHz, ce qui le rend compatible avec un large éventail d'exigences réglementaires régionales. Il présente également une sensibilité élevée de -148 dBm, permettant une communication fiable même dans des environnements bruyants ou à signal faible. Le SX1262 est conçu avec une interface hautement configurable, ce qui facilite son intégration dans une large gamme d'applications. Il dispose également d'un mode veille à faible consommation, qui réduit la consommation d'énergie lorsque l'émetteur-récepteur n'est pas utilisé. Dans l'ensemble, le SX1262 est une solution d'émetteur-récepteur très polyvalente et fiable, idéale pour une large gamme d'applications de communication sans fil, notamment l'IoT, les compteurs intelligents et l'automatisation industrielle.**Il n'est pas étanche.**Il faut le mettre dans un boîtier étanche. Nous recommandons ce microcontrôleur si vous souhaitez simplement l'essayer. Il n'est pas recommandé pour une utilisation à long terme. |

### passerelle

Consultez la carte TTN pour voir s'il y a une passerelle près de chez vous. S'il n'y a pas de passerelle près de chez vous, vous pouvez acheter une passerelle mais vous avez besoin d'une connexion Internet. La passerelle est le pont entre le microcontrôleur et le serveur TTN. Les passerelles suivantes sont prises en charge et recommandées :

| Partie                                               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![TTN gateway](_media/hardware/hardware-gateway.svg) | [Passerelle intérieure TTN](https://amzn.to/3L1x1JN)La passerelle est conçue pour fonctionner de manière transparente avec The Things Network v3, qui offre une gamme de fonctionnalités telles que l'activation sécurisée des appareils, une couverture mondiale et une gestion simple des appareils. Il intègre également la prise en charge du Bluetooth Low Energy (BLE) et du Wi-Fi, permettant une configuration et une gestion faciles à l'aide d'un smartphone ou d'un ordinateur. Dans l’ensemble, la passerelle intérieure Things Indoor LoRaWAN TTNv3 est un excellent choix pour tous ceux qui recherchent une passerelle fiable et facile à utiliser pour leur réseau LoRaWAN. Il est abordable, économe en énergie et doté de fonctionnalités qui en font un choix idéal pour les applications IoT commerciales et industrielles. |

## 3. Assemblage

1.  [Capteur à contrôleur](#sensor-to-controller)
2.  [Alimentation du contrôleur](#power-to-controller)
3.  [Dépannage](#trouble-shooting)

### Capteur à contrôleur

Cet exemple illustre comment assembler le capteur HC-SR04 au microcontrôleur. Le capteur est connecté au microcontrôleur avec un câble à 4 broches. Le câble jaune est le câble de déclenchement. Le câble bleu est le câble d'écho. Le câble rouge est le câble 5V. Le câble noir est le câble de masse.

![Schema for ultra sonic sensor](_media/schema/schema-thebox-ultrasonic.png)

### Alimentation du contrôleur

### Dépannage

* * *

#### LoRaWAN

-   Passerelle LoRaWAN

#### Microcontrôleur

Il est évident qu'il faut une carte pour exécuter le logiciel. Mais vous avez également besoin d’une puce LoRa pour envoyer les données au TTN. Les cartes suivantes sont prises en charge :

-   [En route pour Raa](Hardware/TTGOLoRa32.md)
-   [Heltec LoRa32](Hardware/HeltecLoRa32.md)

### Schématique

![Schematic](https://raw.githubusercontent.com/TheBox/TheBox/master/Hardware/Schematic.png)

### Pièces imprimées en 3D

## Logiciel

### Arduino

-   [Arduino](Software/Arduino/README.md)

### Serveur

-   [Serveur](Software/Server/README.md)

### Bot de télégramme

-   [Bot de télégramme](Software/TelegramBot/README.md)

* * *

_Réalisé avec ❤️ par[docsifier](https://docsify.js.org/)_
