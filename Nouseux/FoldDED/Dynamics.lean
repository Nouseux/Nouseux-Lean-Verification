import Nouseux.FoldDED.Core
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Analysis.Calculus.Deriv.Basic

namespace Nouseux.FoldDED

open DEDState

/-- Évolution temporelle d'un état DED -/
noncomputable def evolve (s : DEDState) (dt : ℝ) : DEDState where
  fold_depth := s.fold_depth + 1
  coherence := s.coherence * Real.exp (-dt / 10)
  energy := s.energy - dt * s.coherence

/-- Propriété de convergence -/
def converges (trajectory : ℕ → DEDState) : Prop :=
  ∃ (limit : DEDState), ∀ ε > 0, ∃ N, ∀ n ≥ N,
    ‖(trajectory n).coherence - limit.coherence‖ < ε

end Nouseux.FoldDED
