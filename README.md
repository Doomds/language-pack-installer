# language-pack-installer
Ce script PowerShell installe automatiquement des packs de langue Windows (fichiers .cab) et ajoute des fonctionnalités comme la reconnaissance vocale et l’écriture manuscrite. 
Il est utile pour automatiser les installations multilingues sur Windows 10, notamment en post-installation d’image.

### Fonctionnalités principales :
- Installation silencieuse des fichiers .cab de langue via lpksetup.
- Ajout des capacités optionnelles : Handwriting et Speech via Add-WindowsCapability.
- Lecture automatique de tous les fichiers .cab présents dans un dossier.

### Fonctionnalités installées pour chaque langue :
- Handwriting.
- Speech.
- Text-to-speech (si défini dans le script).
- Reconnaissance vocale.

### Pré-requis :
- Droits administrateur.
- Fichiers .cab de langue valides présents localement.
- Connexion Internet recommandée pour l'installation de certaines capacités.

### Utilisation :
- Copier les .cab dans le dossier indiqué par $chemin.
- Lancer le script PowerShell en tant qu’administrateur.
- Suivre les messages affichés pour vérifier la bonne installation.

### License
This project is licensed under the MIT License.
