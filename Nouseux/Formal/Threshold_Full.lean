import Mathlib.Tactic.Linarith
import Mathlib.Basic.Real.Basic

namespace NouseuxThreshold

variable (Inorm εL εU : ℝ)

/-- Appartenance à la bande fermée [εL, εU]. -/
def inNouseuxBand (Inorm εL εU : ℝ) : Prop :=
  εL ≤ Inorm ∧ Inorm ≤ εU

/-- Conditions de bonne formation de la bande. -/
theorem band_well_formed
    (hεL0 : 0 < εL)
    (hεLU : εL < εU)
    (hεU1 : εU < 1) :
    εL < εU ∧ 0 < εL ∧ εU < 1 :=
  ⟨hεLU, hεL0, hεU1⟩

/-- Exhaustivité : au moins un des trois régimes est satisfait. -/
theorem regimes_exhaustive
    (_h0 : 0 ≤ Inorm)
    (_h1 : Inorm ≤ 1)
    (_hεL : 0 < εL)
    (_hεU : εU < 1)
    (_hεLU : εL < εU) :
    Inorm < εL ∨
    (εL ≤ Inorm ∧ Inorm ≤ εU) ∨
    εU < Inorm := by
  by_cases hlow : Inorm < εL
  · exact Or.inl hlow
  · by_cases hhigh : εU < Inorm
    · exact Or.inr (Or.inr hhigh)
    ·
      exact Or.inr (Or.inl ⟨not_lt.mp hlow, not_lt.mp hhigh⟩)

/-- Exclusivité mutuelle : aucun couple de régimes
    ne peut être satisfait simultanément. -/
theorem regimes_mutually_exclusive
    (hεLU : εL < εU) :
    (¬ (Inorm < εL ∧ (εL ≤ Inorm ∧ Inorm ≤ εU))) ∧
    (¬ ((εL ≤ Inorm ∧ Inorm ≤ εU) ∧ εU < Inorm)) ∧
    (¬ (Inorm < εL ∧ εU < Inorm)) := by
  constructor
  · rintro ⟨hlow, hband⟩
    rcases hband with ⟨hLower, hUpper⟩
    linarith
  · constructor
    · rintro ⟨hband, hhigh⟩
      rcases hband with ⟨hLower, hUpper⟩
      linarith
    · rintro ⟨hlow, hhigh⟩
      linarith

end NouseuxThreshold
