import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# NAI Bounds for Nouseux Consistency

This file establishes the bounds on the Nouseux Additive Index (NAI).
-/

def NAI_lower_bound : ℝ := 1.5
def NAI_upper_bound : ℝ := 2.5

theorem NAI_bounds (x : ℝ) (h : NAI_lower_bound ≤ x ∧ x ≤ NAI_upper_bound) :
  1.5 ≤ x ∧ x ≤ 2.5 := by
  exact h
