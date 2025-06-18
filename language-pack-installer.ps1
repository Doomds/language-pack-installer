# Spécifie le chemin où se trouvent les fichiers de pack linguistique
$chemin = "C:\Temp\NewLap\Language packs Win 10 22h2"

# Vérifie si le répertoire existe
if (Test-Path $chemin -PathType Container) {
    # Obtiens la liste de tous les fichiers .cab dans le répertoire
    $fichiers = Get-ChildItem -Path $chemin -Filter "*.cab" -File

    if ($fichiers.Count -gt 0) {
        # Installe chaque pack linguistique
        foreach ($fichier in $fichiers) {
            Write-Host "Installation de $($fichier.Name)..."
            Start-Process -FilePath "lpksetup.exe" -ArgumentList "/i /p `"$($fichier.FullName)`"" -Wait -NoNewWindow
            Write-Host "$($fichier.Name) installé avec succès."
        }
    } else {
        Write-Warning "Aucun fichier .cab trouvé dans $chemin."
    }
} else {
    Write-Warning "Le répertoire $chemin est introuvable."
}

# Obtient une liste de tous les packs de langues installés sur le système
$languePacks = Get-WinUserLanguageList | Select-Object -ExpandProperty LanguageTag

# Installe Handwriting et speech pour chaque pack de langues
foreach ($langue in $languePacks) {
    Write-Host "Installation des fonctionnalités pour le pack de langue $langue..."

    # Handwriting
    Add-WindowsCapability -Online -Name Handwriting.Service -Language $langue -NoRestart

    # Speech
    Add-WindowsCapability -Online -Name Speech_OnlineHandwritingRecognizer -Language $langue -NoRestart

    Write-Host "Fonctionnalités installées pour le pack de langue $langue."
}
