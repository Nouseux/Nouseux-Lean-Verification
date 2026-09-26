import Nouseux.Formal.Recursion_Core

namespace NouseuxRecursion

noncomputable def N_fixedPoint (P Onorm μ η : ℝ) : ℝ :=
  if μ = 0 then 0 else (η * P * Onorm) / μ

theorem N_fixedPoint_is_fixed
    (P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next (N_fixedPoint P Onorm μ η) P Onorm μ η true =
      N_fixedPoint P Onorm μ η := by
  unfold N_next N_fixedPoint indicator
  rw [if_neg hμ]
  field_simp
  ring

theorem N_fixedPoint_bounded
    (P Onorm μ η : ℝ)
    (hP : 0 ≤ P ∧ P ≤ 1)
    (hO : 0 ≤ Onorm ∧ Onorm ≤ 1)
    (hη0 : 0 ≤ η) (hημ : η ≤ μ) (_hμ1 : μ ≤ 1) (hμ0 : 0 < μ) :
    0 ≤ N_fixedPoint P Onorm μ η ∧ N_fixedPoint P Onorm μ η ≤ 1 := by
  obtain ⟨hP0, hP1⟩ := hP
  obtain ⟨hO0, hO1⟩ := hO
  unfold N_fixedPoint
  rw [if_neg (ne_of_gt hμ0)]
  constructor
  · apply div_nonneg
    · exact mul_nonneg (mul_nonneg hη0 hP0) hO0
    · linarith
  · rw [div_le_one hμ0]
    have hPO : P * Onorm ≤ 1 := by
      calc P * Onorm ≤ 1 * 1 := mul_le_mul hP1 hO1 hO0 (by norm_num)
      _ = 1 := by ring
    nlinarith [mul_le_mul_of_nonneg_left hPO hη0]

theorem N_next_converges_to_fixedPoint
    (N P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next N P Onorm μ η true - N_fixedPoint P Onorm μ η =
      (1 - μ) * (N - N_fixedPoint P Onorm μ η) := by
  unfold N_next N_fixedPoint indicator
  rw [if_neg hμ]
  field_simp
  ring

end NouseuxRecursion
