import Mathlib.Tactic

namespace Nouseux

variable (ISI IPM ICM IAI IDC ICI : ℝ)

/-- Version 1.04, subtractive definition. -/
noncomputable def NAI_104 : ℝ := (ISI + IPM + ICM + IAI - IDC + ICI) / 6

/-- Version 1.05, normalized definition. -/
noncomputable def NAI_105 : ℝ := (ISI + IPM + ICM + IAI + (1 - IDC) + ICI) / 6

/-! ### Bounds Theorems -/

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
  · linarith
  · linarith

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
  · linarith
  · linarith

/-! ### Scale Relation -/

/-- Exact linear relation between the two scales, before clamping. -/
theorem NAI_scale_relation :
    NAI_105 ISI IPM ICM IAI IDC ICI
      = NAI_104 ISI IPM ICM IAI IDC ICI + 1/6 := by
  unfold NAI_104 NAI_105
  ring

/-! ### Tightness Proofs -/

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

/-! ### Monotonicity Properties for NAI_104 and NAI_105 (12 Theorems) -/

-- 1. NAI_104 is monotonic with respect to ISI
theorem NAI_104_mono_ISI (isi1 isi2 ipm icm iai idc ici : ℝ) (h : isi1 ≤ isi2) :
    NAI_104 isi1 ipm icm iai idc ici ≤ NAI_104 isi2 ipm icm iai idc ici := by
  unfold NAI_104; linarith

-- 2. NAI_104 is monotonic with respect to IPM
theorem NAI_104_mono_IPM (isi ipm1 ipm2 icm iai idc ici : ℝ) (h : ipm1 ≤ ipm2) :
    NAI_104 isi ipm1 icm iai idc ici ≤ NAI_104 isi ipm2 icm iai idc ici := by
  unfold NAI_104; linarith

-- 3. NAI_104 is monotonic with respect to ICM
theorem NAI_104_mono_ICM (isi ipm icm1 icm2 iai idc ici : ℝ) (h : icm1 ≤ icm2) :
    NAI_104 isi ipm icm1 iai idc ici ≤ NAI_104 isi ipm icm2 iai idc ici := by
  unfold NAI_104; linarith

-- 4. NAI_104 is monotonic with respect to IAI
theorem NAI_104_mono_IAI (isi ipm icm iai1 iai2 idc ici : ℝ) (h : iai1 ≤ iai2) :
    NAI_104 isi ipm icm iai1 idc ici ≤ NAI_104 isi ipm icm iai2 idc ici := by
  unfold NAI_104; linarith

-- 5. NAI_104 is monotonically decreasing with respect to IDC
theorem NAI_104_mono_IDC (isi ipm icm iai idc1 idc2 ici : ℝ) (h : idc2 ≤ idc1) :
    NAI_104 isi ipm icm iai idc1 ici ≤ NAI_104 isi ipm icm iai idc2 ici := by
  unfold NAI_104; linarith

-- 6. NAI_104 is monotonic with respect to ICI
theorem NAI_104_mono_ICI (isi ipm icm iai idc ici1 ici2 : ℝ) (h : ici1 ≤ ici2) :
    NAI_104 isi ipm icm iai idc ici1 ≤ NAI_104 isi ipm icm iai idc ici2 := by
  unfold NAI_104; linarith

-- 7. NAI_105 is monotonic with respect to ISI
theorem NAI_105_mono_ISI (isi1 isi2 ipm icm iai idc ici : ℝ) (h : isi1 ≤ isi2) :
    NAI_105 isi1 ipm icm iai idc ici ≤ NAI_105 isi2 ipm icm iai idc ici := by
  unfold NAI_105; linarith

-- 8. NAI_105 is monotonic with respect to IPM
theorem NAI_105_mono_IPM (isi ipm1 ipm2 icm iai idc ici : ℝ) (h : ipm1 ≤ ipm2) :
    NAI_105 isi ipm1 icm iai idc ici ≤ NAI_105 isi ipm2 icm iai idc ici := by
  unfold NAI_105; linarith

-- 9. NAI_105 is monotonic with respect to ICM
theorem NAI_105_mono_ICM (isi ipm icm1 icm2 iai idc ici : ℝ) (h : icm1 ≤ icm2) :
    NAI_105 isi ipm icm1 iai idc ici ≤ NAI_105 isi ipm icm2 iai idc ici := by
  unfold NAI_105; linarith

-- 10. NAI_105 is monotonic with respect to IAI
theorem NAI_105_mono_IAI (isi ipm icm iai1 iai2 idc ici : ℝ) (h : iai1 ≤ iai2) :
    NAI_105 isi ipm icm iai1 idc ici ≤ NAI_105 isi ipm icm iai2 idc ici := by
  unfold NAI_105; linarith

-- 11. NAI_105 is monotonically decreasing with respect to IDC
theorem NAI_105_mono_IDC (isi ipm icm iai idc1 idc2 ici : ℝ) (h : idc2 ≤ idc1) :
    NAI_105 isi ipm icm iai idc1 ici ≤ NAI_105 isi ipm icm iai idc2 ici := by
  unfold NAI_105; linarith

-- 12. NAI_105 is monotonic with respect to ICI
theorem NAI_105_mono_ICI (isi ipm icm iai idc ici1 ici2 : ℝ) (h : ici1 ≤ ici2) :
    NAI_105 isi ipm icm iai idc ici1 ≤ NAI_105 isi ipm icm iai idc ici2 := by
  unfold NAI_105; linarith

end Nouseux
