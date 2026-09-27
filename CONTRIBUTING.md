# Guide de Contribution — Projet Nouseux

Merci de l'intérêt que vous portez au projet **Nouseux : Spécification et Vérification Formelle** !

## 📋 Prérequis

- [Elan](https://github.com/leanprover/elan) (gestionnaire de versions Lean).
- Toolchain Lean **`v4.35.0-rc2`** (via `lean-toolchain`).
- Connaissance de [Lean 4](https://leanprover.github.io/theorem_proving_in_lean4/) et [Mathlib4](https://leanprover-community.github.io/).
- Un compte GitHub.

## 🔧 Mise en place

1. Forkez le dépôt sur GitHub.
2. Clonez votre fork : `git clone https://github.com/VOTRE-USER/Nouseux-Lean-Verification.git`
3. Récupérez le cache Mathlib : `lake exe cache get`
4. Compilez : `lake build`

## 🌱 Branche de travail

Ne travaillez jamais directement sur `main` :
`git checkout -b feature/nom-fonctionnalite`

### Conventions de nommage
- `feature/...` — nouveau théorème.
- `fix/...` — correction.
- `docs/...` — documentation.
- `refactor/...` — restructuration.

## ✍️ Règles pour le code Lean

### Zéro sorry toléré
Aucun `sorry` ou `admit` accepté dans `Nouseux/Formal/`.

Vérification : `grep -rn "sorry\|admit" Nouseux/Formal/`

### Style
- Noms explicites en `snake_case` (ex : `N_next_bounded`).
- Documentation avec `/-- ... -/`.
- Preuves structurées avec `by` et tactiques lisibles.

## ✅ Checklist avant Pull Request

- [ ] `lake build` sans erreur.
- [ ] Aucun `sorry` / `admit`.
- [ ] Nouveaux théorèmes documentés.
- [ ] README mis à jour si nécessaire.
- [ ] Messages de commit conformes.

## 📝 Convention des commits (Conventional Commits)

- `feat:` nouveau théorème
- `fix:` correction
- `docs:` documentation
- `refactor:` restructuration
- `chore:` maintenance (CI, .gitignore, etc.)

Exemple : `feat: prove N_next_monotone_in_eta`

## 🚀 Soumettre une Pull Request

1. Poussez votre branche : `git push origin feature/nom-fonctionnalite`
2. Ouvrez une PR vers `Nouseux/Nouseux-Lean-Verification:main`.
3. Décrivez : motivation, changements, vérifications.

## 🐛 Signaler un bug

Ouvrez une Issue avec :
- Version Lean (`lean --version`)
- OS
- Description reproductible
- Comportement attendu vs observé

## 📜 Code de conduite

Échanges respectueux, rigoureux et constructifs. Le harcèlement entraîne une exclusion.

## 📚 Ressources

- [Theorem Proving in Lean 4](https://leanprover.github.io/theorem_proving_in_lean4/)
- [Mathlib4 Docs](https://leanprover-community.github.io/mathlib4_docs/)
- [Lean Zulip](https://leanprover.zulipchat.com/)

---
*Merci de contribuer à Nouseux !*
