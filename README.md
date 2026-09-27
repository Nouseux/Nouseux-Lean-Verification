# Nouseux : Spécification et Vérification Formelle (v5.2.1)

Ce dépôt contient la spécification mathématique et la vérification formelle en **Lean 4** (avec **Mathlib4**) du noyau récursif et des propriétés de l'indicateur du modèle **Nouseux**. 

Le projet formalise et prouve mécaniquement les propriétés de partition d'espace, de bornitude, de monotonie, de stabilité et de convergence (point fixe) d'un opérateur de transition relationnelle soumis à des variables d'interaction collective. L'ensemble du dépôt est validé et compile sans erreur avec la toolchain **Lean `v4.35.0-rc2`**.

---

## 📌 Aperçu du Modèle Mathématique

Le modèle décrit l'évolution d'une variable d'état d'activation relationnelle $$N(t) \in [0, 1]$$ (représentant l'intensité d'intégration ou d'orientation collective implicite) selon l'équation de récurrence corrigée suivante :

$$N(t+1) = (1 - \mu)N(t) + \eta \cdot \mathbf{1}[I_{norm}(X_t; Y_t) \in \Omega_N] \cdot P(t) \cdot \|O(t)\|$$

Où :
- $$N(t) \in [0, 1]$$ est l'état d'activation relationnelle au temps $$t$$.
- $$\mu \in [0, 1]$$ est le taux de décroissance ou d'oubli (friction interne).
- $$\eta \in [0, 1]$$ est le gain de consolidation (influence externe).
- $$\mathbf{1}[\cdot]$$ est la fonction indicatrice d'appartenance à la **bande du Nouseux** $$\Omega_N = [\varepsilon_L, \varepsilon_U]$$.
- $$I_{norm}(X_t; Y_t) \in [0, 1]$$ est la mesure de couplage normalisée entre les pôles relationnels.
- $$P(t) \in [0, 1]$$ est l'intensité d'activation (Pression).
- $$\|O(t)\| \in [0, 1]$$ est la norme du vecteur d'orientation collective.

---

## 📂 Structure des Preuves Formelles (`Nouseux/Formal/`)

Le noyau formel est composé de **26 théorèmes validés** (zéro `sorry`) répartis dans 6 fichiers sources interconnectés :

1. **`NAI_Bounds_Full.lean`** :
   - Définition de l'indice composite d'activation du Nouseux ($$NAI$$) sur 6 sous-indices ($$ISI$$, $$IPM$$, $$ICM$$, $$IAI$$, $$IDC$$, $$ICI$$).
   - Preuve des bornes théoriques exactes de l'indice : $$NAI \in [-1/6, 5/6]$$.
   - Preuve de la monotonie stricte (12 théorèmes) de l'indice par rapport à la croissance de ses composantes positives et à la décroissance du contrôle délibéré ($$IDC$$).
2. **`Threshold_Full.lean`** :
   - Définition de la bande du Nouseux $$\Omega_N = [\varepsilon_L, \varepsilon_U]$$ et des trois régimes : *Indépendance/Vide*, *Habitabilité/Nouseux*, et *Fusion/Rigide*.
   - Preuve d'**exhaustivité** des régimes : tout niveau de couplage appartient nécessairement à l'un des trois régimes.
   - Preuve d'**exclusion mutuelle** : un état de couplage ne peut appartenir à deux régimes simultanément.
3. **`Recursion_Full.lean`** :
   - Définition de l'opérateur de transition temporelle `N_next`.
   - Preuve d'**invariance des bornes** (`N_next_bounded`) : sous la contrainte $$0 \le \eta \le \mu \le 1$$, si $$N(t) \in [0, 1]$$, alors $$N(t+1) \in [0, 1]$$.
4. **`Recursion_Invariance.lean`** :
   - Définition de la suite temporelle globale `Nseq` sur $$\mathbb{N}$$.
   - Preuve par **récurrence mathématique** (`induction`) de la stabilité globale de la suite dans l'intervalle unité $$[0, 1]$$ pour tout $$t$$.
5. **`Recursion_Monotonicity.lean`** :
   - Preuves de monotonie de l'opérateur de transition par rapport à l'état initial $$N$$, à l'intensité d'activation $$P$$, à l'orientation $$O$$ et au gain $$\eta$$.
6. **`Recursion_FixedPoint.lean`** :
   - Définition du point fixe théorique $$N^* = \frac{\eta \cdot P \cdot O_{norm}}{\mu}$$ (pour $$\mu > 0$$).
   - Preuve formelle que $$N^*$$ est un point fixe de l'opérateur `N_next` sous régime habitable (`true`).
   - Preuve de la **convergence géométrique** (contraction linéaire) vers le point fixe à un taux de $$(1 - \mu)$$ à chaque pas.

---

## 🚀 Installation et Compilation

### Prérequis
- [Elan](https://github.com/leanprover/elan) (le gestionnaire de versions de Lean).
- La toolchain Lean **`v4.35.0-rc2`** (configurée automatiquement via le fichier `lean-toolchain`).

### Instructions de build

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/votre-utilisateur/Nouseux-Lean-Verification.git
   cd Nouseux-Lean-Verification
Récupérer le cache de Mathlib4 (évite de recompiler l'intégralité de la bibliothèque standard) :

Copier
lake exe cache get
Compiler l'intégralité du projet :

Copier
lake build
Le compilateur doit afficher un succès complet sans erreur :
Build completed successfully (3109 jobs).

🔍 Extraits des Théorèmes Clés (Lean 4)
Invariance des Bornes (N_next_bounded)
Copier
theorem N_next_bounded
    (N P Onorm μ η : ℝ) (inBand : Bool)
    (hN : 0 ≤ N ∧ N ≤ 1)
    (hP : 0 ≤ P ∧ P ≤ 1)
    (hO : 0 ≤ Onorm ∧ Onorm ≤ 1)
    (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) (hμ0 : 0 ≤ μ) :
    0 ≤ N_next N P Onorm μ η inBand ∧ N_next N P Onorm μ η inBand ≤ 1
Attractivité et Contraction du Point Fixe (N_fixed_point_attractor)
Copier
theorem N_fixed_point_attractor
    (N P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next N P Onorm μ η true - (η * P * Onorm / μ) =
    (1 - μ) * (N - (η * P * Onorm / μ))
Bornes de l'Indice Composite NAI (NAI_104_bounds)
Copier
theorem NAI_104_bounds (ISI IPM ICM IAI IDC ICI : ℝ)
    (h1 : 0 ≤ ISI ∧ ISI ≤ 1) (h2 : 0 ≤ IPM ∧ IPM ≤ 1)
    (h3 : 0 ≤ ICM ∧ ICM ≤ 1) (h4 : 0 ≤ IAI ∧ IAI ≤ 1)
    (h5 : 0 ≤ IDC ∧ IDC ≤ 1) (h6 : 0 ≤ ICI ∧ ICI ≤ 1) :
    -1/6 ≤ NAI_104 ISI IPM ICM IAI IDC ICI ∧ NAI_104 ISI IPM ICM IAI IDC ICI ≤ 5/6
🎓 Originalité Scientifique et Contribution
Le projet Nouseux se distingue des travaux traditionnels en méthodes formelles par :

La formalisation de l'habitabilité relationnelle : Contrairement aux systèmes cyber-physiques classiques (qui cherchent souvent à maximiser ou minimiser une variable), ce modèle prouve la stabilité d'un système au sein d'une bande intermédiaire métastable, évitant à la fois la dissociation (découplage) et la fusion (sur-couplage coercitif).
Un pont rigoureux entre phénoménologie et calcul mécanique : Traduction formelle complète de concepts issus des sciences cognitives et de l'interaction humaine en théorèmes mathématiques vérifiés par ordinateur.
Projet développé et vérifié formellement avec Lean 4 et Mathlib4.
