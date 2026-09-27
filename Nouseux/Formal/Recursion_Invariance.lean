import Nouseux.Formal.Recursion_Full

namespace NouseuxRecursion

def Nseq (N0 : ℝ) (P O : ℕ → ℝ) (inBand : ℕ → Bool) (μ η : ℝ) : ℕ → ℝ
  | 0     => N0
  | t + 1 => N_next (Nseq N0 P O inBand μ η t) (P t) (O t) μ η (inBand t)

theorem Nseq_bounded
    (N0 : ℝ) (hN0 : 0 ≤ N0 ∧ N0 ≤ 1)
    (P O : ℕ → ℝ)
    (hP : ∀ t, 0 ≤ P t ∧ P t ≤ 1)
    (hO : ∀ t, 0 ≤ O t ∧ O t ≤ 1)
    (inBand : ℕ → Bool)
    (μ η : ℝ) (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) :
    ∀ t : ℕ, 0 ≤ Nseq N0 P O inBand μ η t ∧
             Nseq N0 P O inBand μ η t ≤ 1 := by
  intro t
  induction t with
  | zero => simpa [Nseq] using hN0
  | succ n ih =>
      unfold Nseq
      exact N_next_bounded (Nseq N0 P O inBand μ η n) (P n) (O n) μ η (inBand n)
        ih (hP n) (hO n) hη0 hημ hμ1

end NouseuxRecursion
