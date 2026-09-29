# Formal Proofs — V1.04ter Rigorous Structure

This folder contains Lean 4 proofs of selected mathematical properties of the Nouseux model (Version 1.04ter). The guarantees below depend on the hypotheses of each theorem; they do not constitute a complete formal verification of the model.

## 📂 Files

### ✅ `NAI_Bounds_Full.lean` — NAI bounds and related properties

**Theorems include:**

- `NAI_1_04_bounds`: Bounds the corresponding NAI definition.
- `NAI_1_05_bounds`: Establishes a value in `[0, 1]` under its stated parameter hypotheses.

**Mathematical statement:**

```lean
theorem NAI_1_05_bounds (μ η : ℝ)
    (hμ : 0 ≤ μ ∧ μ ≤ 1) (hη : 0 ≤ η ∧ η ≤ μ) :
    0 ≤ NAI_1_05 μ η ∧ NAI_1_05 μ η ≤ 1
```

The reviewed text contains **19 theorems** in this file. Consult the Lean statements for their exact hypotheses and conclusions. Monotonicity expressed using `≤` is non-strict.

### ✅ `Threshold_Full.lean` — Partition into three regimes

This file defines membership in a closed band:

```lean
def inNouseuxBand (Inorm εL εU : ℝ) : Prop :=
  εL ≤ Inorm ∧ Inorm ≤ εU
```

It contains **three theorems**:

- `band_well_formed`: Restates the supplied conditions on the band boundaries.
- `regimes_exhaustive`: Every real value is below the band, inside the closed band, or above the band.
- `regimes_mutually_exclusive`: For strictly ordered boundaries, no two regimes hold simultaneously.

**Limitation:** The reviewed file does not contain `threshold_iff` and does not prove that a Boolean threshold function computes `inNouseuxBand`. The latter is a proposition (`Prop`), not a Boolean function.

### ✅ `Recursion_Full.lean` — One-step boundedness

**Theorem:** `N_next_bounded`

The recursive update has two branches:

- If `inBand = false`, the next state is `(1 - μ) * N`.
- If `inBand = true`, the next state is `(1 - μ) * N + η * P * Onorm`.

Under the theorem's hypotheses, including `N`, `P` and `Onorm` in `[0, 1]` and `0 ≤ η ≤ μ ≤ 1`, the next state lies in `[0, 1]`.

This proves **one-step boundedness**, not convergence. The theorem assumes that `Onorm` lies in `[0, 1]`; it does not establish that this input is the norm of another quantity.

### ✅ `Recursion_Invariance.lean` — Sequence invariance

**Theorem:** `Nseq_bounded`

If the initial state and the required inputs lie in `[0, 1]`, and the parameter hypotheses hold, every state of the recursive sequence lies in `[0, 1]`. This holds for any Boolean sequence `inBand`.

This is an **invariance** result, not a convergence theorem.

### ✅ `Recursion_Monotonicity.lean` — Non-strict monotonicity

This file contains three one-step monotonicity theorems for the branch `inBand = true`:

- `N_next_mono_P`: Monotonicity in `P`.
- `N_next_mono_O`: Monotonicity in `Onorm`.
- `N_next_mono_η`: Monotonicity in `η`.

These results are **non-strict** and subject to the hypotheses in their Lean declarations. They do not imply that a trajectory increases over time.

### ✅ `Recursion_FixedPoint.lean` — Fixed-point results

This file contains **two theorems** concerning a fixed point and an identity for the difference between an updated state and that fixed point.

These results should not be described as a general convergence or strict-contraction theorem unless those statements are proved separately.

## 🎯 Mathematical Guarantees

- **NAI bounds:** Established under the hypotheses of the corresponding theorems.
- **Regime partition:** The three regimes are exhaustive and, with strictly ordered boundaries, mutually exclusive.
- **One-step boundedness:** A recursive update preserves `[0, 1]` under the required hypotheses.
- **Sequence invariance:** The recursive sequence remains in `[0, 1]` when the hypotheses hold at every step.

**Not established by these files:** A Boolean implementation of band membership, convergence of a general time-varying trajectory, or empirical validity of the model.

## 🔬 Verification Status

| File | Theorems in the reviewed text | Proved scope |
|---|---:|---|
| `NAI_Bounds_Full.lean` | 19 | NAI bounds and related properties |
| `Threshold_Full.lean` | 3 | Conditions and partition of regimes |
| `Recursion_Full.lean` | 1 | One-step boundedness |
| `Recursion_Invariance.lean` | 1 | Sequence invariance |
| `Recursion_Monotonicity.lean` | 3 | Non-strict, one-step monotonicity |
| `Recursion_FixedPoint.lean` | 2 | Fixed-point results |
| **Total for these six reviewed files** | **29** | |

The theorem count should be checked against the exact repository revision. A successful build confirms compilation; checking unwanted axiom dependencies requires additional inspection, for example with `#print axioms`.

## 🚀 Building the Proofs

Use the Lean version specified in the repository's `lean-toolchain` file.

```bash
# Install elan
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# Clone the repository
git clone https://github.com/Nouseux/Nouseux-Lean-Verification
cd Nouseux-Lean-Verification

# Update dependencies and build
lake update
lake build Nouseux
```

## 📚 References

- **Nouseux V1.04ter Specification** — Section 9: Recursive Operator
- **Lean 4 Documentation** — https://lean-lang.org/
- **Mathlib4** — https://github.com/leanprover-community/mathlib4


