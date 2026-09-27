import Nouseux.Formal.Recursion_Full

namespace NouseuxRecursion

theorem N_fixed_point_value
    (P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next (η * P * Onorm / μ) P Onorm μ η true = η * P * Onorm / μ := by
  unfold N_next indicator
  simp only [ite_true]
  -- Ici, le but contient "η * 1 * P * Onorm". On simplifie la multiplication par 1 d'abord.
  have h_eq : (1 - μ) * (η * P * Onorm / μ) + η * 1 * P * Onorm = η * P * Onorm / μ := by
    calc
      (1 - μ) * (η * P * Onorm / μ) + η * 1 * P * Onorm
      _ = (1 - μ) * (η * P * Onorm / μ) + η * P * Onorm := by ring
      _ = (η * P * Onorm / μ) - μ * (η * P * Onorm / μ) + η * P * Onorm := by ring
      _ = (η * P * Onorm / μ) - η * P * Onorm + η * P * Onorm := by 
          rw [mul_div_cancel₀ (η * P * Onorm) hμ]
      _ = η * P * Onorm / μ := by ring
  exact h_eq

theorem N_fixed_point_attractor
    (N P Onorm μ η : ℝ) (hμ : μ ≠ 0) :
    N_next N P Onorm μ η true - (η * P * Onorm / μ) =
    (1 - μ) * (N - (η * P * Onorm / μ)) := by
  unfold N_next indicator
  simp only [ite_true]
  calc
    (1 - μ) * N + η * 1 * P * Onorm - η * P * Onorm / μ
    _ = (1 - μ) * N + η * P * Onorm - η * P * Onorm / μ := by ring
    _ = (1 - μ) * N - (η * P * Onorm / μ - η * P * Onorm) := by ring
    _ = (1 - μ) * N - (η * P * Onorm / μ - μ * (η * P * Onorm / μ)) := by 
        rw [mul_div_cancel₀ (η * P * Onorm) hμ]
    _ = (1 - μ) * N - (1 - μ) * (η * P * Onorm / μ) := by ring
    _ = (1 - μ) * (N - η * P * Onorm / μ) := by ring

end NouseuxRecursion
