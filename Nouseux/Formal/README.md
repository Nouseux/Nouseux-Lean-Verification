## Formal Proofs — V1.04ter Rigorous Structure

This folder contains the complete mathematical proofs for the Nouseux model (Version 1.04ter), formally verified in Lean 4.

### 📂 Files

#### ✅ `NAI_Bounds_Full.lean` — Certified proofs for NAI bounds

**Theorems**
- `NAI_1_04_bounds`: Proves `NAI_1.04 ∈ [-1/6, 5/6]`
- `NAI_1_05_bounds`: Proves `NAI_1.05 ∈ [0, 1]`

**Mathematical statement**
```lean
theorem NAI_1_05_bounds (μ η : ℝ) (hμ : 0 ≤ μ ∧ μ ≤ 1) (hη : 0 ≤ η ∧ η ≤ μ) :
    0 ≤ NAI_1_05 μ η ∧ NAI_1_05 μ η ≤ 1
```

**Status:** ✅ DEPLOYED — Fully verified with `nlinarith` tactic

---

#### ✅ `Threshold_Full.lean` — Formal proof of regime activation thresholds

**Theorem:** `threshold_iff`

Proves that the threshold function correctly implements band-pass filtering:
```lean
theorem threshold_iff (I_norm Ω_min Ω_max : ℝ) :
    threshold I_norm Ω_min Ω_max = true ↔ Ω_min ≤ I_norm ∧ I_norm ≤ Ω_max
```

**Status:** ✅ DEPLOYED — Fully verified with boolean decidability

---

#### ✅ `Recursion_Full.lean` — Complete stability analysis of the recursive operator `N(t+1)`

**Theorem:** `N_next_bounded`

Proves the boundedness of the recursive update operator:

$$
N(t+1) = (1-\mu)\cdot N(t) + \eta\cdot 1[\text{InBand}] \cdot P(t)\cdot \|O(t)\|
$$

**Mathematical statement**
```lean
theorem N_next_bounded
    (hN : 0 ≤ N ∧ N ≤ 1)
    (hP : 0 ≤ P ∧ P ≤ 1)
    (hO : 0 ≤ Onorm ∧ Onorm ≤ 1)
    (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) :
    0 ≤ N_next N P Onorm μ η inBand ∧
    N_next N P Onorm μ η inBand ≤ 1
```

**Note on notation**
- `Onorm` corresponds to `‖O(t)‖`.

**Proof strategy**
- Case 1 (`inBand = false`): `N(t+1) = (1-μ)·N(t)`, bounded by `[0, 1-μ] ⊆ [0, 1]`
- Case 2 (`inBand = true`): `N(t+1) = (1-μ)·N(t) + η·P·‖O‖ ≤ (1-μ) + η ≤ 1` (since `η ≤ μ`)

**Status:** ✅ DEPLOYED — Fully proved with case analysis and `nlinarith` tactic

---

### 🎯 Mathematical Guarantees
- ✅ **Stability:** NAI never diverges or produces invalid values
- ✅ **Correctness:** Threshold function implements exact band-pass logic
- ✅ **Boundedness:** Recursive updates preserve the `[0,1]` constraint

---

### 🔬 Verification Status

| File | Status | Verification Method |
|---|---|---|
| `NAI_Bounds_Full.lean` | ✅ Verified | `nlinarith` tactic |
| `Threshold_Full.lean` | ✅ Verified | Boolean decidability |
| `Recursion_Full.lean` | ✅ Verified | Case analysis + `nlinarith` |

---

### 🚀 Building the Proofs

```bash
# Install Lean 4.35.0-rc2
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# Clone the repository
git clone https://github.com/Nouseux/Nouseux-Lean-Verification
cd Nouseux-Lean-Verification

# Update dependencies
lake update

# Build (requires ~30-60 minutes for mathlib compilation)
lake build Nouseux
```

---

### 📚 References
- Nouseux V1.04ter Specification — Section 9: Recursive Operator
- Lean 4 Documentation — https://lean-lang.org/
- Mathlib4 — https://github.com/leanprover-community/mathlib4




