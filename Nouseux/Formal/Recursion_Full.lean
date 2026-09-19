import Mathlib.Tactic

namespace NouseuxRecursion

variable (N P Onorm μ η : ℝ) (inBand : Bool)

/-- Indicator function matching 1[·] in Version 5.0, Section 9. -/
def indicator (b : Bool) : ℝ := if b then 1 else 0

/-- Corrected recursive operator:
    N(t+1) = (1 - μ) * N(t) + η * 1[I_norm ∈ Ω_N] * P(t) * ‖O(t)‖ -/
def N_next (N P Onorm μ η : ℝ) (inBand : Bool) : ℝ :=
  (1 - μ) * N + η * indicator inBand * P * Onorm

/-- Boundedness of the recursive operator under the stated constraints
    0 ≤ N, P, ‖O‖ ≤ 1 and 0 ≤ η ≤ μ ≤ 1. -/
theorem N_next_bounded
    (hN : 0 ≤ N ∧ N ≤ 1)
    (hP : 0 ≤ P ∧ P ≤ 1)
    (hO : 0 ≤ Onorm ∧ Onorm ≤ 1)
    (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) :
    0 ≤ N_next N P Onorm μ η inBand ∧
    N_next N P Onorm μ η inBand ≤ 1 := by
  obtain ⟨hN1, hN2⟩ := hN
  obtain ⟨hP1, hP2⟩ := hP
  obtain ⟨hO1, hO2⟩ := hO
  unfold N_next indicator
  cases inBand with
  | false =>
      simp only [if_false]
      constructor
      · nlinarith
      · nlinarith
  | true =>
      simp only [if_true]
      constructor
      · nlinarith
      · nlinarith

end NouseuxRecursion
