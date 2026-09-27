# Formal Proofs — V5.2.1 Rigorous Structure
[![Lean Build](https://github.com/Nouseux/Nouseux-Lean-Verification/actions/workflows/lean-build.yml/badge.svg)](https://github.com/Nouseux/Nouseux-Lean-Verification/actions/workflows/lean-build.yml)

This folder contains the complete mathematical proofs for the **Nouseux model (Version 5.2.1)**, formally verified in **Lean 4** with **Mathlib4**.

**Total: 26 verified theorems, zero `sorry`.**

---

## 📂 Files Overview

| File | Theorems | Status |
|---|---|---|
| `NAI_Bounds_Full.lean` | 14 (bounds + 12 monotonicity lemmas) | ✅ Verified |
| `Threshold_Full.lean` | 3 (regime partition) | ✅ Verified |
| `Recursion_Full.lean` | 1 (boundedness) | ✅ Verified |
| `Recursion_Invariance.lean` | 2 (global sequence stability) | ✅ Verified |
| `Recursion_Monotonicity.lean` | 4 (operator monotonicity) | ✅ Verified |
| `Recursion_FixedPoint.lean` | 2 (fixed point + contraction) | ✅ Verified |

---

## ✅ `NAI_Bounds_Full.lean` — NAI Composite Index Bounds and Monotonicity

Defines the composite Nouseux Activation Index over 6 sub-indices ($ISI$, $IPM$, $ICM$, $IAI$, $IDC$, $ICI$).

### Key theorems

- **`NAI_104_bounds`** — Proves $NAI_{1.04} \in [-1/6, 5/6]$.
- **`NAI_105_bounds`** — Proves $NAI_{1.05} \in [0, 1]$.
- **12 monotonicity lemmas** — Strict monotonicity of NAI with respect to each positive component and inverse monotonicity with respect to $IDC$ (deliberate control).

### Sample statement

```lean
theorem NAI_104_bounds (ISI IPM ICM IAI IDC ICI : ℝ)
    (h1 : 0 ≤ ISI ∧ ISI ≤ 1) (h2 : 0 ≤ IPM ∧ IPM ≤ 1)
    (h3 : 0 ≤ ICM ∧ ICM ≤ 1) (h4 : 0 ≤ IAI ∧ IAI ≤ 1)
    (h5 : 0 ≤ IDC ∧ IDC ≤ 1) (h6 : 0 ≤ ICI ∧ ICI ≤ 1) :
    -1/6 ≤ NAI_104 ISI IPM ICM IAI IDC ICI ∧
    NAI_104 ISI IPM ICM IAI IDC ICI ≤ 5/6
