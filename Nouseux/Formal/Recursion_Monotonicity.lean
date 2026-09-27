import Nouseux.Formal.Recursion_Full

namespace NouseuxRecursion

theorem N_next_mono_P (N Onorm μ η : ℝ) (hη : 0 ≤ η) (hO : 0 ≤ Onorm) :
    Monotone (fun P => N_next N P Onorm μ η true) := by
  intro P₁ P₂ hP
  unfold N_next indicator
  simp only [if_true]
  have h_coeff : 0 ≤ η * Onorm := mul_nonneg hη hO
  have h_mul : η * P₁ * Onorm ≤ η * P₂ * Onorm := by
    ring_nf
    exact mul_le_mul_of_nonneg_right hP h_coeff
  linarith

theorem N_next_mono_O (N P μ η : ℝ) (hη : 0 ≤ η) (hP : 0 ≤ P) :
    Monotone (fun Onorm => N_next N P Onorm μ η true) := by
  intro O₁ O₂ hO
  unfold N_next indicator
  simp only [if_true]
  have h_coeff : 0 ≤ η * P := mul_nonneg hη hP
  have h_mul : η * P * O₁ ≤ η * P * O₂ := mul_le_mul_of_nonneg_left hO h_coeff
  linarith

theorem N_next_mono_η (N P Onorm μ : ℝ) (hP : 0 ≤ P) (hO : 0 ≤ Onorm) :
    Monotone (fun η => N_next N P Onorm μ η true) := by
  intro η₁ η₂ hη
  unfold N_next indicator
  simp only [if_true]
  have h_coeff : 0 ≤ P * Onorm := mul_nonneg hP hO
  have h_mul : η₁ * (P * Onorm) ≤ η₂ * (P * Onorm) := mul_le_mul_of_nonneg_right hη h_coeff
  linarith

end NouseuxRecursion
