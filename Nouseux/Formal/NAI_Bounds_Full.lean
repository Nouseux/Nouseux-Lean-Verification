import Mathlib.Tactic

namespace Nouseux

variable (ISI IPM ICM IAI IDC ICI : ℝ)

/-- Version 1.04, subtractive definition. -/
noncomputable def NAI_104 : ℝ := (ISI + IPM + ICM + IAI - IDC + ICI) / 6

/-- Version 1.05, normalized definition. -/
noncomputable def NAI_105 : ℝ := (ISI + IPM + ICM + IAI + (1 - IDC) + ICI) / 6

/-- Theoretical range of NAI_1.04 is [-1/6, 5/6]. -/
theorem NAI_104_bounds
    (hISI : 0 ≤ ISI ∧ ISI ≤ 1) (hIPM : 0 ≤ IPM ∧ IPM ≤ 1)
    (hICM : 0 ≤ ICM ∧ ICM ≤ 1) (hIAI : 0 ≤ IAI ∧ IAI ≤ 1)
    (hIDC : 0 ≤ IDC ∧ IDC ≤ 1) (hICI : 0 ≤ ICI ∧ ICI ≤ 1) :
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
  · nlinarith
  · nlinarith

/-- Theoretical range of NAI_1.05 is [0, 1]. -/
theorem NAI_105_bounds
    (hISI : 0 ≤ ISI ∧ ISI ≤ 1) (hIPM : 0 ≤ IPM ∧ IPM ≤ 1)
    (hICM : 0 ≤ ICM ∧ ICM ≤ 1) (hIAI : 0 ≤ IAI ∧ IAI ≤ 1)
    (hIDC : 0 ≤ IDC ∧ IDC ≤ 1) (hICI : 0 ≤ ICI ∧ ICI ≤ 1) :
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
  · nlinarith
  · nlinarith

/-- Exact linear relation between the two scales, before clamping. -/
theorem NAI_scale_relation :
    NAI_105 ISI IPM ICM IAI IDC ICI
      = NAI_104 ISI IPM ICM IAI IDC ICI + 1/6 := by
  unfold NAI_104 NAI_105
  ring

/-- Tightness of NAI_104 lower bound: the value -1/6 is exactly reachable. -/
theorem NAI_104_lower_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_104 ISI IPM ICM IAI IDC ICI = -1/6 := by
  use 0, 0, 0, 0, 1, 0
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_104
  norm_num

/-- Tightness of NAI_104 upper bound: the value 5/6 is exactly reachable. -/
theorem NAI_104_upper_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_104 ISI IPM ICM IAI IDC ICI = 5/6 := by
  use 1, 1, 1, 1, 0, 1
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_104
  norm_num

/-- Tightness of NAI_105 lower bound: the value 0 is exactly reachable. -/
theorem NAI_105_lower_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_105 ISI IPM ICM IAI IDC ICI = 0 := by
  use 0, 0, 0, 0, 1, 0
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_105
  norm_num

/-- Tightness of NAI_105 upper bound: the value 1 is exactly reachable. -/
theorem NAI_105_upper_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_105 ISI IPM ICM IAI IDC ICI = 1 := by
  use 1, 1, 1, 1, 0, 1
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_105
  norm_num


/-- Exact linear relation between the two scales, before clamping. -/
theorem NAI_scale_relation :
    NAI_105 ISI IPM ICM IAI IDC ICI
      = NAI_104 ISI IPM ICM IAI IDC ICI + 1/6 := by
  unfold NAI_104 NAI_105
  ring


/-- Tightness of NAI_104 lower bound: the value -1/6 is exactly reachable. -/
theorem NAI_104_lower_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_104 ISI IPM ICM IAI IDC ICI = -1/6 := by
  use 0, 0, 0, 0, 1, 0
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_104
  norm_num

/-- Tightness of NAI_104 upper bound: the value 5/6 is exactly reachable. -/
theorem NAI_104_upper_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_104 ISI IPM ICM IAI IDC ICI = 5/6 := by
  use 1, 1, 1, 1, 0, 1
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_104
  norm_num


/-- Tightness of NAI_105 lower bound: the value 0 is exactly reachable. -/
theorem NAI_105_lower_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_105 ISI IPM ICM IAI IDC ICI = 0 := by
  use 0, 0, 0, 0, 1, 0
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_105
  norm_num

/-- Tightness of NAI_105 upper bound: the value 1 is exactly reachable. -/
theorem NAI_105_upper_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ),
    (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧
    (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧
    (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧
    NAI_105 ISI IPM ICM IAI IDC ICI = 1 := by
  use 1, 1, 1, 1, 0, 1
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold NAI_105
  norm_num

end Nouseux