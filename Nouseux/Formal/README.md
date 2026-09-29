Formal Proofs — V1.04ter Rigorous Structure
This folder contains Lean 4 proofs of selected mathematical properties of the Nouseux model (Version 1.04ter). The guarantees below are conditional on the hypotheses stated in the corresponding theorems; they are not a complete formal verification of the model.

📂 Files
✅ NAI_Bounds_Full.lean — Bounds and related properties of NAI
Theorems include:

NAI_1_04_bounds: Bounds the corresponding NAI definition.
NAI_1_05_bounds: Establishes a value in [0, 1] under its stated parameter hypotheses.
Mathematical statement:

theorem NAI_1_05_bounds (μ η : ℝ) (hμ : 0 ≤ μ ∧ μ ≤ 1) (hη : 0 ≤ η ∧ η ≤ μ) :
    0 ≤ NAI_1_05 μ η ∧ NAI_1_05 μ η ≤ 1
The reviewed text contains 19 theorems in this file. Consult the Lean statements for the exact hypotheses and conclusions of each result. Monotonicity stated using ≤ is non-strict.

✅ Threshold_Full.lean — Partition into three regimes
This file defines membership in a closed band:

def inNouseuxBand (Inorm εL εU : ℝ) : Prop :=
  εL ≤ Inorm ∧ Inorm ≤ εU
It contains three theorems:

band_well_formed: Restates the supplied conditions on the band boundaries.
regimes_exhaustive: Every real value is below the band, inside the closed band, or above the band.
regimes_mutually_exclusive: If εL < εU, no two of these regimes hold simultaneously.
Important limitation: The reviewed file does not contain a theorem named threshold_iff or prove that a Boolean threshold function computes inNouseuxBand. The latter is a proposition (Prop), not a Boolean function.

✅ Recursion_Full.lean — One-step boundedness of the recursive operator
Theorem: N_next_bounded

The update uses a Boolean input inBand. In mathematical notation, its two branches are:

N
t
+
1
=
{
(
1
−
μ
)
N
t
+
η
P
t
 
O
n
o
r
m
t
,
if ‘inBand = true‘,
(
1
−
μ
)
N
t
,
if ‘inBand = false‘.
N 
t+1
​
 ={ 
(1−μ)N 
t
​
 +ηP 
t
​
 Onorm 
t
​
 ,
(1−μ)N 
t
​
 ,
​
  
if ‘inBand = true‘,
if ‘inBand = false‘.
​
 
Theorem conclusion, with its essential hypotheses:

-- Assuming N, P and Onorm lie in [0, 1],
-- and 0 ≤ η, η ≤ μ, μ ≤ 1:
0 ≤ N_next N P Onorm μ η inBand ∧
  N_next N P Onorm μ η inBand ≤ 1
This excerpt summarizes the result; consult Recursion_Full.lean for the complete Lean declaration.

Proof strategy:

Case 1 (inBand = false): The next state is (1-μ) * N, which lies in [0, 1].
Case 2 (inBand = true): The additional term is non-negative and at most η. Since η ≤ μ, the next state is at most (1-μ) + η ≤ 1.
The theorem establishes one-step boundedness, not convergence. The proof assumes that Onorm is in [0, 1]; it does not establish that this input is the norm of another quantity.

✅ Recursion_Invariance.lean — Boundedness of the full sequence
Theorem: Nseq_bounded

If the initial state lies in [0, 1], both input sequences take values in [0, 1] at every step, and 0 ≤ η ≤ μ ≤ 1, then every state of Nseq lies in [0, 1]. This holds for any Boolean sequence inBand.

This is an invariance result. It does not assert that the sequence converges.

✅ Recursion_Monotonicity.lean — One-step, non-strict monotonicity
The file proves three results for the branch inBand = true:

N_next_mono_P: Non-strict monotonicity in P.
N_next_mono_O: Non-strict monotonicity in Onorm.
N_next_mono_η: Non-strict monotonicity in η.
Each result has the non-negativity hypotheses stated in its Lean declaration. These results do not say that a trajectory increases over time.

✅ Recursion_FixedPoint.lean — Fixed-point identities
This file contains two theorems concerning a fixed point and the difference between an updated state and that fixed point, under the conditions specified in the file.

An algebraic identity for this difference must not be described as a formally proved convergence or strict-contraction theorem unless those conclusions are also stated and proved separately.

🎯 Mathematical Guarantees
✅ NAI bounds: Bounds established under the hypotheses of the corresponding theorems.

✅ Regime partition: The three real-valued regimes are exhaustive and, for ordered boundaries, mutually exclusive.

✅ Recursive boundedness: A single update preserves [0, 1] under the required hypotheses.

✅ Sequence invariance: The full recursive sequence remains in [0, 1] when those hypotheses hold at every step.

Not established by these files: A Boolean implementation of band membership, convergence of a general time-varying trajectory, or empirical validity of the model.

🔬 Verification Status
File	Theorems in the reviewed text	Proved scope
NAI_Bounds_Full.lean	19	NAI bounds and related properties
Threshold_Full.lean	3	Conditions and partition of regimes
Recursion_Full.lean	1	One-step boundedness
Recursion_Invariance.lean	1	Sequence invariance
Recursion_Monotonicity.lean	3	Non-strict, one-step monotonicity
Recursion_FixedPoint.lean	2	Fixed-point results
Total for these six reviewed files	29	
This count should be checked against the exact repository revision before being attributed to a release or commit. A successful build confirms compilation; checking unwanted axiom dependencies requires additional inspection, for example with #print axioms.

🚀 Building the Proofs
Use the Lean version specified in the repository's lean-toolchain file.

# Install elan, the Lean toolchain manager
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# Clone the repository
git clone https://github.com/Nouseux/Nouseux-Lean-Verification
cd Nouseux-Lean-Verification

# Update dependencies
lake update

# Build
lake build Nouseux
📚 References
Nouseux V1.04ter Specification — Section 9: Recursive Operator
Lean 4 Documentation — https://lean-lang.org/
Mathlib4 — https://github.com/leanprover-community/mathlib4
