import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# Threshold Analysis for Nouseux Regimes

This file proves the exhaustiveness of the three regimes:
- Independence (NAI < 1.5)
- Habitability (1.5 ≤ NAI ≤ 2.5)
- Fusion (NAI > 2.5)
-/

def independence_threshold : ℝ := 1.5
def fusion_threshold : ℝ := 2.5

theorem regime_exhaustive (x : ℝ) :
  x < independence_threshold ∨ 
  (independence_threshold ≤ x ∧ x ≤ fusion_threshold) ∨ 
  fusion_threshold < x := by
  by_cases h1 : x < independence_threshold
  · left; exact h1
  · by_cases h2 : x ≤ fusion_threshold
    · right; left; constructor
      · linarith
      · exact h2
    · right; right; linarith
