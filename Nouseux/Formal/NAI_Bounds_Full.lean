import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Basic.Real.Basic

namespace Nouseux

variable (ISI IPM ICM IAI IDC ICI : ℝ)

-- Hypotheses: all sub-indices are normalized to the unit interval.
variable (hISI : 0 ≤ ISI ∧ ISI ≤ 1)
         (hIPM : 0 ≤ IPM ∧ IPM ≤ 1)
         (hICM : 0 ≤ ICM ∧ ICM ≤ 1)
         (hIAI : 0 ≤ IAI ∧ IAI ≤ 1)
         (hIDC : 0 ≤ IDC ∧ IDC ≤ 1)
         (hICI : 0 ≤ ICI ∧ ICI ≤ 1)

/-- Version 1.04, subtractive definition. -/
noncomputable def NAI_104 : ℝ := (ISI + IPM + ICM + IAI - IDC + ICI) / 6

/-- Version 1.05, normalized definition. -/
noncomputable def NAI_105 : ℝ := (ISI + IPM + ICM + IAI + (1 - IDC) + ICI) / 6

include hISI hIPM hICM hIAI hIDC hICI in
/-- Theoretical range of NAI_1.04 is [-1/6, 5/6]. -/
theorem NAI_104_bounds :
    -1/6 ≤ NAI_104 ISI IPM ICM IAI IDC ICI ∧
    NAI_104 ISI IPM ICM IAI IDC ICI ≤ 5/6 := by
  obtain ⟨hISI1, hISI2⟩ := hISI
  obtain ⟨hIPM1, hIPM2⟩ := hIPM
  obtain ⟨hICM1, hICM2⟩ := hICM
  obtain ⟨hIAI1, hIAI2⟩ := hIAI
  obtain ⟨hIDC1, hIDC2⟩ := hIDC
  obtain ⟨hICI1, hICI2⟩ := hICI
  unfold NAI_104
  constructor
  · linarith
  · linarith

include hISI hIPM hICM hIAI hIDC hICI in
/-- Theoretical range of NAI_1.05 is [0, 1]. -/
theorem NAI_105_bounds :
    0 ≤ NAI_105 ISI IPM ICM IAI IDC ICI ∧
    NAI_105 ISI IPM ICM IAI IDC ICI ≤ 1 := by
  obtain ⟨hISI1, hISI2⟩ := hISI
  obtain ⟨hIPM1, hIPM2⟩ := hIPM
  obtain ⟨hICM1, hICM2⟩ := hICM
  obtain ⟨hIAI1, hIAI2⟩ := hIAI
  obtain ⟨hIDC1, hIDC2⟩ := hIDC
  obtain ⟨hICI1, hICI2⟩ := hICI
  unfold NAI_105
  constructor
  · linarith
  · linarith

/-- Exact linear relation between the two scales, before clamping. -/
theorem NAI_scale_relation :
    NAI_105 ISI IPM ICM IAI IDC ICI
      = NAI_104 ISI IPM ICM IAI IDC ICI + 1/6 := by
  unfold NAI_104 NAI_105
  ring

end Nouseux

