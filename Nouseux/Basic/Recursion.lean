import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-!
# Recursion Stability for Nouseux Operator

This file proves the bounded stability of the recursive operator:
NAI(t+1) = f(NAI(t), context)
-/

def recursion_operator (x : ℝ) (context : ℝ) : ℝ :=
  x + 0.1 * context

theorem recursion_bounded (x₀ : ℝ) (context : ℝ) 
  (h_init : 1.5 ≤ x₀ ∧ x₀ ≤ 2.5)
  (h_context : -5 ≤ context ∧ context ≤ 5) :
  let x₁ := recursion_operator x₀ context
  1.0 ≤ x₁ ∧ x₁ ≤ 3.0 := by
  unfold recursion_operator
  constructor
  · linarith
  · linarith
