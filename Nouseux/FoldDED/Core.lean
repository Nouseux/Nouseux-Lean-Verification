import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Topology.MetricSpace.Basic

namespace Nouseux.FoldDED

/-- Un espace de pli DED avec une métrique dynamique -/
structure FoldSpace (α : Type*) where
  carrier : Set α
  metric : α → α → ℝ
  fold_param : ℝ

/-- État d'un système DED -/
structure DEDState where
  fold_depth : ℕ
  coherence : ℝ
  energy : ℝ

end Nouseux.FoldDED
