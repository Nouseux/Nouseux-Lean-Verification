import Mathlib.Tactic

namespace NouseuxRecursion

/-- Indicator function matching 1[·] in Version 5.0, Section 9. -/
def indicator (b : Bool) : ℝ := if b then 1 else 0

/-- Corrected recursive operator:
    N(t+1) = (1 - μ) * N(t) + η * 1[I_norm ∈ Ω_N] * P(t) * ‖O(t)‖ -/
def N_next (N P Onorm μ η : ℝ) (inBand : Bool) : ℝ :=
  (1 - μ) * N + η * indicator inBand * P * Onorm

/-- Boundedness of the recursive operator under the stated constraints. -/
theorem N_next_bounded
    (N P Onorm μ η : ℝ) (inBand : Bool)
    (hN : 0 ≤ N ∧ N ≤ 1)
    (hP : 0 ≤ P ∧ P ≤ 1)
    (hO : 0 ≤ Onorm ∧ Onorm ≤ 1)
    (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) :
    0 ≤ N_next N P Onorm μ η inBand ∧
    N_next N P Onorm μ η inBand ≤ 1 := by
  obtain ⟨hN0, hN1⟩ := hN
  obtain ⟨hP0, hP1⟩ := hP
  obtain ⟨hO0, hO1⟩ := hO
  have hμ0 : 0 ≤ μ := le_trans hη0 hημ
  have h1μ0 : 0 ≤ 1 - μ := by linarith
  have hterm1_nonneg : 0 ≤ (1 - μ) * N := mul_nonneg h1μ0 hN0
  have hterm1_le : (1 - μ) * N ≤ 1 - μ := by
    calc (1 - μ) * N ≤ (1 - μ) * 1 := mul_le_mul_of_nonneg_left hN1 h1μ0
    _ = 1 - μ := by ring
  have hPO_nonneg : 0 ≤ P * Onorm := mul_nonneg hP0 hO0
  have hPO_le1 : P * Onorm ≤ 1 := by
    calc P * Onorm ≤ 1 * 1 := mul_le_mul hP1 hO1 hO0 (by norm_num)
    _ = 1 := by ring
  have hterm2_nonneg : 0 ≤ η * P * Onorm := by
    have h := mul_nonneg hη0 hPO_nonneg
    calc (0:ℝ) ≤ η * (P * Onorm) := h
    _ = η * P * Onorm := by ring
  have hterm2_le : η * P * Onorm ≤ μ := by
    have step : η * (P * Onorm) ≤ η * 1 :=
      mul_le_mul_of_nonneg_left hPO_le1 hη0
    have eq1 : η * (P * Onorm) = η * P * Onorm := by ring
    linarith [step, eq1]
  unfold N_next
  cases inBand with
  | false =>
    have hi : indicator false = 0 := rfl
    rw [hi]
    ring_nf
    constructor
    · linarith [hterm1_nonneg]
    · linarith [hterm1_le]
  | true =>
    have hi : indicator true = 1 := rfl
    rw [hi]
    ring_nf
    constructor
    · linarith [hterm1_nonneg, hterm2_nonneg]
    · linarith [hterm1_le, hterm2_le]

end NouseuxRecursion
