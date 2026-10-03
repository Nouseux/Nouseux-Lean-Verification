#!/bin/bash

echo "# 📊 RAPPORT COMPLET - NOUSEUX-LEAN-VERIFICATION"
echo "**Date** : $(date '+%d %B %Y, %H:%M')"
echo "**Commit** : $(git rev-parse --short HEAD)"
echo ""

echo "## ✅ MODULES COMPILÉS"
echo ""
lake build 2>&1 | grep -E "Built|Replayed" | tail -10
echo ""

echo "## 📈 STATISTIQUES"
echo ""
echo "| Métrique | Valeur |"
echo "|----------|--------|"
echo "| Fichiers .lean | $(find Nouseux -name "*.lean" | wc -l) |"
echo "| Lignes de code | $(find Nouseux -name "*.lean" -exec cat {} \; | wc -l) |"
echo "| Théorèmes (Regimes) | $(grep -c "^theorem" Nouseux/FoldDED/Regimes.lean) |"
echo "| Théorèmes (Theorems) | $(grep -c "^theorem" Nouseux/FoldDED/Theorems.lean) |"
echo "| Définitions | $(find Nouseux -name "*.lean" -exec grep -h "^def " {} \; | wc -l) |"
echo ""

echo "## 🧩 THÉORÈMES REGIMES"
echo ""
echo '```lean'
grep "^theorem" Nouseux/FoldDED/Regimes.lean
echo '```'
echo ""

echo "## 🔬 THÉORÈMES PRINCIPAUX"
echo ""
echo '```lean'
grep "^theorem\|^axiom" Nouseux/FoldDED/Theorems.lean
echo '```'
echo ""

echo "## 🎯 PROCHAINES ÉTAPES"
echo ""
echo "- [ ] Créer NeuralValidation.lean (3 théorèmes)"
echo "- [ ] Créer HumanCondition.lean (4 théorèmes)"
echo "- [ ] Créer Guardian.lean (8 théorèmes)"
echo "- [ ] Ajouter tests unitaires"
echo "- [ ] Documentation complète"
echo ""

echo "## 📚 STRUCTURE DU PROJET"
echo ""
echo '```'
tree -L 3 Nouseux/ 2>/dev/null || find Nouseux -type f -name "*.lean" | head -20
echo '```'
echo ""

echo "---"
echo "**Généré automatiquement par generate_full_report.sh**"
