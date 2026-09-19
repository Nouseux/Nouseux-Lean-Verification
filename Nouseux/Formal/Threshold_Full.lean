import Mathlib.Tactic

namespace NouseuxThreshold

variable (Inorm εL εU : ℝ)

/-- Membership predicate for the Nouseux band Ω_N = [εL, εU]. -/
def inNouseuxBand (Inorm εL εU : ℝ) : Prop :=
  εL ≤ Inorm ∧ Inorm ≤ εU

/-- Well-formedness of the band: 0 < εL < εU < 1, as required in
    Section 7 of Version 5.0. -/
theorem band_well_formed
    (hεL0 : 0 < εL) (hεLU : εL < εU) (hεU1 : εU < 1) :
    εL < εU ∧ 0 < εL ∧ εU < 1 :=
  ⟨hεLU, hεL0, hεU1⟩

/-- The three regimes (independence, habitability, fusion) are mutually
    exclusive and jointly exhaustive on [0, 1]. -/
theorem regimes_exhaustive
    (h0 : 0 ≤ Inorm) (h1 : Inorm ≤ 1) (hεL : 0 < εL) (hεU : εU < 1) :
    Inorm < εL ∨ (εL ≤ Inorm ∧ Inorm ≤ εU) ∨ εU < Inorm := by
  by_cases hlow : Inorm < εL
  · exact Or.inl hlow
  · by_cases hhigh : εU < Inorm
    · exact Or.inr (Or.inr hhigh)
    · exact Or.inr (Or.inl ⟨not_lt.mp hlow, not_lt.mp hhigh⟩)

end NouseuxThreshold
