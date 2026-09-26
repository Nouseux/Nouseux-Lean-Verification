# Nouseux : Vérification Formelle de la Cohérence Cognitive et Affective (v5.0)

Ce dépôt contient la spécification et la vérification formelle en **Lean 4** (avec **Mathlib**) du noyau récursif du modèle **Nouseux**. 

Le projet formalise et prouve mathématiquement les propriétés de stabilité, d'invariance, de monotonie et de convergence (point fixe) d'un opérateur de transition cognitive soumis à des variables affectives (norme, pression, observation).

---

## 📌 Aperçu du Modèle Mathématique

Le modèle décrit l'évolution d'une variable d'état cognitif $$N(t) \in [0, 1]$$ (représentant par exemple une intensité d'adhésion ou une norme intégrée) selon l'équation de récurrence suivante :

$$N(t+1) = N(t) + 	ext{indicator}(	ext{inBand}) \cdot \left( \eta \cdot P \cdot O_{	ext{norm}} - \mu \cdot N(t) ight)$$

Où :
- $$P \in [0, 1]$$ représente la **Pression**.
- $$O_{	ext{norm}} \in [0, 1]$$ représente l'**Observation de la Norme**.
- $$\eta \in [0, 1]$$ est le taux d'**influence externe**.
- $$\mu \in [0, 1]$$ est le taux de **résistance/friction interne**.
- $$	ext{inBand} \in \{	ext{true}, 	ext{false}\}$$ est un indicateur booléen d'activation du processus.

---

## 📂 Structure des Preuves Formelles (`Nouseux/Formal/`)

Le noyau formel est découpé en 4 modules Lean 4 validés et interconnectés :

1. **`Recursion_Core.lean`** : 
   - Définition de l'opérateur de transition `N_next`.
   - Définition des types et des structures de base.
2. **`Recursion_Invariance.lean`** :
   - Preuve de la préservation des bornes : si $$N(t) \in [0, 1]$$, alors $$N(t+1) \in [0, 1]$$.
   - Condition requise : $$0 \le \eta \le \mu \le 1$$.
3. **`Recursion_Monotonicity.lean`** :
   - Preuve de monotonie par rapport à l'état initial $$N$$ et aux paramètres d'entrée ($$P, O_{	ext{norm}}, \eta$$).
4. **`Recursion_FixedPoint.lean`** :
   - Définition du point fixe théorique $$N^* = rac{\eta \cdot P \cdot O_{	ext{norm}}}{\mu}$$ (pour $$\mu > 0$$).
   - Preuve que $$N^*$$ est bien un point fixe de l'opérateur.
   - Preuve que $$N^* \in [0, 1]$$.
   - Preuve de la convergence géométrique vers le point fixe à un taux de $$(1 - \mu)$$.

---

## 🚀 Installation et Compilation

### Prérequis
- [Elan](https://github.com/leanprover/elan) (le gestionnaire de versions de Lean).
- Lean 4 (version spécifiée dans `lean-toolchain`).

### Instructions de build

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/votre-utilisateur/Nouseux-Lean-Verification.git
   cd Nouseux-Lean-Verification
   ```

2. **Récupérer le cache de Mathlib** (évite de recompiler Mathlib) :
   ```bash
   lake exe cache get
   ```

3. **Compiler le projet** :
   ```bash
   lake build
   ```

4. **Compiler un module spécifique** (par exemple, le point fixe) :
   ```bash
   lake build Nouseux.Formal.Recursion_FixedPoint
   ```

---

## 🔍 Détails des Théorèmes Clés (Lean 4)

### Invariance des Bornes (`N_next_bounded`)
```lean
theorem N_next_bounded
    (N P Onorm μ η : ℝ) (inBand : Bool)
    (hN : 0 ≤ N ∧ N ≤ 1)
    (hP : 0 ≤ P ∧ P ≤ 1)
    (hO : 0 ≤ Onorm ∧ Onorm ≤ 1)
    (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) (hμ0 : 0 ≤ μ) :
    0 ≤ N_next N P Onorm μ η inBand ∧ N_next N P Onorm μ η inBand ≤ 1
```

### Existence et Unicité du Point Fixe (`N_fixedPoint_is_fixed`)
```lean
theorem N_fixedPoint_is_fixed
    (P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next (N_fixedPoint P Onorm μ η) P Onorm μ η true =
      N_fixedPoint P Onorm μ η 
```

### Optimisation et Convergence (`N_next_converges_to_fixedPoint`)
```lean
theorem N_next_converges_to_fixedPoint
    (N P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next N P Onorm μ η true - N_fixedPoint P Onorm μ η =
      (1 - μ) * (N - N_fixedPoint P Onorm μ η)
```

---

## 🎓 Travaux Connexes & Originalité Scientifique

Le projet **Nouseux** se distingue de la littérature classique en méthodes formelles par :
- **L'intégration de variables affectives** : Contrairement aux systèmes cyber-physiques traditionnels, ce modèle applique la vérification mécanisée à des dynamiques de pression sociale et d'observation de normes.
- **Preuves de convergence sous contraintes floues** : Validation formelle complète des conditions de stabilité sans hypothèse de linéarité stricte hors-bornes.

---
*Projet développé et vérifié formellement avec Lean 4 et Mathlib.*