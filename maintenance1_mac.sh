#!/bin/bash

# Script de maintenance macOS
# Auteur : Gwendal Minidré
# Date : 04-09-2025
# Description : Nettoyage et diagnostic rapide du système

echo "=== DÉBUT DE LA MAINTENANCE macOS ==="

# 1️⃣ Vider la corbeille
echo "Vider la corbeille..."
rm -rf ~/.Trash/*

# 2️⃣ Supprimer les caches temporaires
echo "Nettoyer les caches système et utilisateurs..."
rm -rf ~/Library/Caches/*
sudo rm -rf /Library/Caches/*

# 3️⃣ Mettre à jour Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "Mise à jour de Homebrew et des applications installées..."
    brew update
    brew upgrade
else
    echo "Homebrew non installé, passez à l'installation si nécessaire."
fi

# 4️⃣ Afficher l’espace disque
echo "=== Espace disque ==="
df -h /

# 5️⃣ Afficher l’utilisation mémoire
echo "=== Mémoire RAM utilisée ==="
top -l 1 | head -n 10

# 6️⃣ Nettoyer les logs système (optionnel)
echo "Nettoyer les logs système (facultatif)..."
sudo rm -rf /private/var/log/*

echo "=== MAINTENANCE TERMINÉE ==="
