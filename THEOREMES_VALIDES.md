# Théorèmes formellement validés

Total détecté : **50**
Preuves valides sans `sorry` : **50**
Preuves contenant `sorry` : **0**

## 1. `NAI_bounds`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `(racine)`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Basic/NAI_Bounds.lean:12`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_bounds (x : ℝ) (h : NAI_lower_bound ≤ x ∧ x ≤ NAI_upper_bound) : 1.5 ≤ x ∧ x ≤ 2.5 := by`

## 2. `NouseuxRecursion.N_next_bounded`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Basic/Recursion.lean:14`
- **État :** ✅ Valide
- **Signature :** `theorem N_next_bounded (N P Onorm μ η : ℝ) (inBand : Bool) (hN : 0 ≤ N ∧ N ≤ 1) (hP : 0 ≤ P ∧ P ≤ 1) (hO : 0 ≤ Onorm ∧ Onorm ≤ 1) (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) : 0 ≤ N_next N P Onorm μ η inBand ∧ N_next N P Onorm μ η inBand ≤ 1 := by`

## 3. `regime_exhaustive`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `(racine)`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Basic/Threshold.lean:16`
- **État :** ✅ Valide
- **Signature :** `theorem regime_exhaustive (x : ℝ) : x < independence_threshold ∨ (independence_threshold ≤ x ∧ x ≤ fusion_threshold) ∨ fusion_threshold < x := by`

## 4. `Nouseux.FoldDED.HumanCondition.rea_cycle_completeness`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:77`
- **État :** ✅ Valide
- **Signature :** `theorem rea_cycle_completeness (trajectory : ℕ → REAState) (h_evolve : ∀ n, ∃ dt, dt ≥ 0 ∧ trajectory (n + 1) = evolve_rea (trajectory n) dt) : ∀ n, ∃ k₁ k₂ k₃, (trajectory (n + k₁)).phase = Phase.Reflection ∧ (trajectory (n + k₂)).phase = Phase.Emotion ∧ (trajectory (n + k₃)).phase = Phase.Action := by`

## 5. `Nouseux.FoldDED.HumanCondition.emotion_bridges_reflection_action`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:126`
- **État :** ✅ Valide
- **Signature :** `theorem emotion_bridges_reflection_action (s₁ s₂ s₃ : REAState) (h₁ : s₁.phase = Phase.Reflection) (h_seq : ∃ dt₁ dt₂, dt₁ ≥ 0 ∧ dt₂ ≥ 0 ∧ (s₂ = evolve_rea (evolve_rea s₁ dt₁) dt₂ ∨`

## 6. `Nouseux.FoldDED.HumanCondition.rea_preserves_coherence`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:154`
- **État :** ✅ Valide
- **Signature :** `theorem rea_preserves_coherence (s : REAState) (h_init : 0 ≤ s.coherence ∧ s.coherence ≤ 1) : ∀ dt, dt ≥ 0 → let s' := evolve_rea s dt 0 ≤ s'.coherence ∧ s'.coherence ≤ 1 := by`

## 7. `Nouseux.FoldDED.HumanCondition.rea_ded_correspondence`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:179`
- **État :** ✅ Valide
- **Signature :** `theorem rea_ded_correspondence (s_rea : REAState) : ∃ s_ded : DEDState, s_ded.coherence = s_rea.coherence ∧ s_ded.energy = s_rea.energy ∧ s_ded.fold_depth = s_rea.fold_depth := by`

## 8. `Nouseux.FoldDED.HumanCondition.phase_cycle_period_3`

- **Type :** `lemma`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:191`
- **État :** ✅ Valide
- **Signature :** `lemma phase_cycle_period_3 : ∀ phase : Phase, next_phase (next_phase (next_phase phase)) = phase := by`

## 9. `Nouseux.FoldDED.HumanCondition.phase_transition_unique`

- **Type :** `lemma`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:198`
- **État :** ✅ Valide
- **Signature :** `lemma phase_transition_unique (phase : Phase) : ∃! p', p' = next_phase phase := by`

## 10. `Nouseux.FoldDED.HumanCondition.coherence_determines_phase`

- **Type :** `lemma`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.HumanCondition`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/HumanCondition.lean:208`
- **État :** ✅ Valide
- **Signature :** `lemma coherence_determines_phase (s : REAState) (h_reflection : ReflectionCondition s) (h_action : ActionCondition s) : (s.coherence ≥ 0.7 → s.phase = Phase.Reflection ∨ s.phase = Phase.Emotion) ∧ (s.coherence ≤ 0.3 → s.phase = Phase.Action ∨ s.phase = Phase.Emotion) := by`

## 11. `Nouseux.FoldDED.Neural.fusion_high_gradient`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.Neural`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/NeuralValidation.lean:18`
- **État :** ✅ Valide
- **Signature :** `theorem fusion_high_gradient (s : DEDState) (eeg : EEGMeasurement) (h_fusion : fusion_regime s) (h_corr : corresponds s eeg) : eeg.gradient ≥ 0.5 := by`

## 12. `Nouseux.FoldDED.Neural.fragmentation_low_gradient`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.Neural`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/NeuralValidation.lean:27`
- **État :** ✅ Valide
- **Signature :** `theorem fragmentation_low_gradient (s : DEDState) (eeg : EEGMeasurement) (h_frag : fragmentation_regime s) (h_corr : corresponds s eeg) : eeg.gradient ≤ 0.3 := by`

## 13. `Nouseux.FoldDED.Neural.coherence_gradient_monotone`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED.Neural`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/NeuralValidation.lean:35`
- **État :** ✅ Valide
- **Signature :** `theorem coherence_gradient_monotone (s1 s2 : DEDState) (eeg1 eeg2 : EEGMeasurement) (h_coh : s1.coherence ≤ s2.coherence) (h_corr1 : corresponds s1 eeg1) (h_corr2 : corresponds s2 eeg2) (h_gradient : eeg1.gradient ≤ eeg2.gradient) : eeg1.gradient ≤ eeg2.gradient := by`

## 14. `Nouseux.FoldDED.fusion_nouseux_disjoint`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Regimes.lean:49`
- **État :** ✅ Valide
- **Signature :** `theorem fusion_nouseux_disjoint (s : DEDState) : fusion_regime s → ¬nouseux_regime s := by`

## 15. `Nouseux.FoldDED.nouseux_fragmentation_disjoint`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Regimes.lean:56`
- **État :** ✅ Valide
- **Signature :** `theorem nouseux_fragmentation_disjoint (s : DEDState) : nouseux_regime s → ¬fragmentation_regime s := by`

## 16. `Nouseux.FoldDED.fusion_fragmentation_disjoint`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Regimes.lean:63`
- **État :** ✅ Valide
- **Signature :** `theorem fusion_fragmentation_disjoint (s : DEDState) : fusion_regime s → ¬fragmentation_regime s := by`

## 17. `Nouseux.FoldDED.regimes_cover`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Regimes.lean:70`
- **État :** ✅ Valide
- **Signature :** `theorem regimes_cover (s : DEDState) (h0 : 0 ≤ s.coherence) (h1 : s.coherence ≤ 1) : fusion_regime s ∨ nouseux_regime s ∨ fragmentation_regime s := by`

## 18. `Nouseux.FoldDED.energy_conservation`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Theorems.lean:28`
- **État :** ✅ Valide
- **Signature :** `theorem energy_conservation (s : DEDState) (dt : ℝ) (h : 0 ≤ dt) (hc : 0 ≤ s.coherence) : (evolve s dt).energy ≤ s.energy := by`

## 19. `Nouseux.FoldDED.coherence_decreases`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Theorems.lean:38`
- **État :** ✅ Valide
- **Signature :** `theorem coherence_decreases (s : DEDState) (dt : ℝ) (h : 0 ≤ dt) (hs : 0 ≤ s.coherence) : (evolve s dt).coherence ≤ s.coherence := by`

## 20. `Nouseux.FoldDED.fold_depth_increases`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Theorems.lean:55`
- **État :** ✅ Valide
- **Signature :** `theorem fold_depth_increases (s : DEDState) (dt : ℝ) : (evolve s dt).fold_depth = s.fold_depth + 1 := by`

## 21. `Nouseux.FoldDED.asymptotic_stability`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux.FoldDED`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/FoldDED/Theorems.lean:63`
- **État :** ✅ Valide
- **Signature :** `theorem asymptotic_stability (trajectory : ℕ → DEDState) (h_init : (trajectory 0).coherence ≥ 0) (h_evolve : ∀ n, ∃ dt ≥ 0, trajectory (n + 1) = evolve (trajectory n) dt) : converges trajectory → ∀ n, (trajectory n).coherence ≥ 0 := by`

## 22. `Nouseux.NAI_104_bounds`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:16`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_bounds (hISI : 0 ≤ ISI ∧ ISI ≤ 1) (hIPM : 0 ≤ IPM ∧ IPM ≤ 1) (hICM : 0 ≤ ICM ∧ ICM ≤ 1) (hIAI : 0 ≤ IAI ∧ IAI ≤ 1) (hIDC : 0 ≤ IDC ∧ IDC ≤ 1) (hICI : 0 ≤ ICI ∧ ICI ≤ 1) : -1/6 ≤ NAI_104 ISI IPM ICM IAI IDC ICI ∧ NAI_104 ISI IPM ICM IAI IDC ICI ≤ 5/6 := by`

## 23. `Nouseux.NAI_105_bounds`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:34`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_bounds (hISI : 0 ≤ ISI ∧ ISI ≤ 1) (hIPM : 0 ≤ IPM ∧ IPM ≤ 1) (hICM : 0 ≤ ICM ∧ ICM ≤ 1) (hIAI : 0 ≤ IAI ∧ IAI ≤ 1) (hIDC : 0 ≤ IDC ∧ IDC ≤ 1) (hICI : 0 ≤ ICI ∧ ICI ≤ 1) : 0 ≤ NAI_105 ISI IPM ICM IAI IDC ICI ∧ NAI_105 ISI IPM ICM IAI IDC ICI ≤ 1 := by`

## 24. `Nouseux.NAI_scale_relation`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:54`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_scale_relation : NAI_105 ISI IPM ICM IAI IDC ICI = NAI_104 ISI IPM ICM IAI IDC ICI + 1/6 := by`

## 25. `Nouseux.NAI_104_lower_bound_tight`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:63`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_lower_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ), (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧ (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧ (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧ NAI_104 ISI IPM ICM IAI IDC ICI = -1/6 := by`

## 26. `Nouseux.NAI_104_upper_bound_tight`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:74`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_upper_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ), (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧ (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧ (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧ NAI_104 ISI IPM ICM IAI IDC ICI = 5/6 := by`

## 27. `Nouseux.NAI_105_lower_bound_tight`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:85`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_lower_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ), (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧ (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧ (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧ NAI_105 ISI IPM ICM IAI IDC ICI = 0 := by`

## 28. `Nouseux.NAI_105_upper_bound_tight`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:96`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_upper_bound_tight : ∃ (ISI IPM ICM IAI IDC ICI : ℝ), (0 ≤ ISI ∧ ISI ≤ 1) ∧ (0 ≤ IPM ∧ IPM ≤ 1) ∧ (0 ≤ ICM ∧ ICM ≤ 1) ∧ (0 ≤ IAI ∧ IAI ≤ 1) ∧ (0 ≤ IDC ∧ IDC ≤ 1) ∧ (0 ≤ ICI ∧ ICI ≤ 1) ∧ NAI_105 ISI IPM ICM IAI IDC ICI = 1 := by`

## 29. `Nouseux.NAI_104_mono_ISI`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:109`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_mono_ISI (isi1 isi2 ipm icm iai idc ici : ℝ) (h : isi1 ≤ isi2) : NAI_104 isi1 ipm icm iai idc ici ≤ NAI_104 isi2 ipm icm iai idc ici := by`

## 30. `Nouseux.NAI_104_mono_IPM`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:114`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_mono_IPM (isi ipm1 ipm2 icm iai idc ici : ℝ) (h : ipm1 ≤ ipm2) : NAI_104 isi ipm1 icm iai idc ici ≤ NAI_104 isi ipm2 icm iai idc ici := by`

## 31. `Nouseux.NAI_104_mono_ICM`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:119`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_mono_ICM (isi ipm icm1 icm2 iai idc ici : ℝ) (h : icm1 ≤ icm2) : NAI_104 isi ipm icm1 iai idc ici ≤ NAI_104 isi ipm icm2 iai idc ici := by`

## 32. `Nouseux.NAI_104_mono_IAI`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:124`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_mono_IAI (isi ipm icm iai1 iai2 idc ici : ℝ) (h : iai1 ≤ iai2) : NAI_104 isi ipm icm iai1 idc ici ≤ NAI_104 isi ipm icm iai2 idc ici := by`

## 33. `Nouseux.NAI_104_mono_IDC`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:129`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_mono_IDC (isi ipm icm iai idc1 idc2 ici : ℝ) (h : idc2 ≤ idc1) : NAI_104 isi ipm icm iai idc1 ici ≤ NAI_104 isi ipm icm iai idc2 ici := by`

## 34. `Nouseux.NAI_104_mono_ICI`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:134`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_104_mono_ICI (isi ipm icm iai idc ici1 ici2 : ℝ) (h : ici1 ≤ ici2) : NAI_104 isi ipm icm iai idc ici1 ≤ NAI_104 isi ipm icm iai idc ici2 := by`

## 35. `Nouseux.NAI_105_mono_ISI`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:139`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_mono_ISI (isi1 isi2 ipm icm iai idc ici : ℝ) (h : isi1 ≤ isi2) : NAI_105 isi1 ipm icm iai idc ici ≤ NAI_105 isi2 ipm icm iai idc ici := by`

## 36. `Nouseux.NAI_105_mono_IPM`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:144`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_mono_IPM (isi ipm1 ipm2 icm iai idc ici : ℝ) (h : ipm1 ≤ ipm2) : NAI_105 isi ipm1 icm iai idc ici ≤ NAI_105 isi ipm2 icm iai idc ici := by`

## 37. `Nouseux.NAI_105_mono_ICM`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:149`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_mono_ICM (isi ipm icm1 icm2 iai idc ici : ℝ) (h : icm1 ≤ icm2) : NAI_105 isi ipm icm1 iai idc ici ≤ NAI_105 isi ipm icm2 iai idc ici := by`

## 38. `Nouseux.NAI_105_mono_IAI`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:154`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_mono_IAI (isi ipm icm iai1 iai2 idc ici : ℝ) (h : iai1 ≤ iai2) : NAI_105 isi ipm icm iai1 idc ici ≤ NAI_105 isi ipm icm iai2 idc ici := by`

## 39. `Nouseux.NAI_105_mono_IDC`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:159`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_mono_IDC (isi ipm icm iai idc1 idc2 ici : ℝ) (h : idc2 ≤ idc1) : NAI_105 isi ipm icm iai idc1 ici ≤ NAI_105 isi ipm icm iai idc2 ici := by`

## 40. `Nouseux.NAI_105_mono_ICI`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `Nouseux`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/NAI_Bounds_Full.lean:164`
- **État :** ✅ Valide
- **Signature :** `theorem NAI_105_mono_ICI (isi ipm icm iai idc ici1 ici2 : ℝ) (h : ici1 ≤ ici2) : NAI_105 isi ipm icm iai idc ici1 ≤ NAI_105 isi ipm icm iai idc ici2 := by`

## 41. `NouseuxRecursion.N_fixed_point_value`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_FixedPoint.lean:5`
- **État :** ✅ Valide
- **Signature :** `theorem N_fixed_point_value (P Onorm μ η : ℝ) (hμ : μ ≠ 0) : N_next (η * P * Onorm / μ) P Onorm μ η true = η * P * Onorm / μ := by`

## 42. `NouseuxRecursion.N_fixed_point_attractor`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_FixedPoint.lean:21`
- **État :** ✅ Valide
- **Signature :** `theorem N_fixed_point_attractor (N P Onorm μ η : ℝ) (hμ : μ ≠ 0) : N_next N P Onorm μ η true - (η * P * Onorm / μ) = (1 - μ) * (N - (η * P * Onorm / μ)) := by`

## 43. `NouseuxRecursion.N_next_bounded`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_Full.lean:17`
- **État :** ✅ Valide
- **Signature :** `theorem N_next_bounded (N P Onorm μ η : ℝ) (inBand : Bool) (hN : 0 ≤ N ∧ N ≤ 1) (hP : 0 ≤ P ∧ P ≤ 1) (hO : 0 ≤ Onorm ∧ Onorm ≤ 1) (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) : 0 ≤ N_next N P Onorm μ η inBand ∧ N_next N P Onorm μ η inBand ≤ 1 := by`

## 44. `NouseuxRecursion.Nseq_bounded`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_Invariance.lean:9`
- **État :** ✅ Valide
- **Signature :** `theorem Nseq_bounded (N0 : ℝ) (hN0 : 0 ≤ N0 ∧ N0 ≤ 1) (P O : ℕ → ℝ) (hP : ∀ t, 0 ≤ P t ∧ P t ≤ 1) (hO : ∀ t, 0 ≤ O t ∧ O t ≤ 1) (inBand : ℕ → Bool) (μ η : ℝ) (hη0 : 0 ≤ η) (hημ : η ≤ μ) (hμ1 : μ ≤ 1) : ∀ t : ℕ, 0 ≤ Nseq N0 P O inBand μ η t ∧`

## 45. `NouseuxRecursion.N_next_mono_P`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_Monotonicity.lean:5`
- **État :** ✅ Valide
- **Signature :** `theorem N_next_mono_P (N Onorm μ η : ℝ) (hη : 0 ≤ η) (hO : 0 ≤ Onorm) : Monotone (fun P => N_next N P Onorm μ η true) := by`

## 46. `NouseuxRecursion.N_next_mono_O`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_Monotonicity.lean:18`
- **État :** ✅ Valide
- **Signature :** `theorem N_next_mono_O (N P μ η : ℝ) (hη : 0 ≤ η) (hP : 0 ≤ P) : Monotone (fun Onorm => N_next N P Onorm μ η true) := by`

## 47. `NouseuxRecursion.N_next_mono_`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxRecursion`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Recursion_Monotonicity.lean:27`
- **État :** ✅ Valide
- **Signature :** `theorem N_next_mono_η (N P Onorm μ : ℝ) (hP : 0 ≤ P) (hO : 0 ≤ Onorm) : Monotone (fun η => N_next N P Onorm μ η true) := by`

## 48. `NouseuxThreshold.band_well_formed`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxThreshold`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Threshold_Full.lean:13`
- **État :** ✅ Valide
- **Signature :** `theorem band_well_formed (hεL0 : 0 < εL) (hεLU : εL < εU) (hεU1 : εU < 1) : εL < εU ∧ 0 < εL ∧ εU < 1 :=`

## 49. `NouseuxThreshold.regimes_exhaustive`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxThreshold`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Threshold_Full.lean:21`
- **État :** ✅ Valide
- **Signature :** `theorem regimes_exhaustive (_h0 : 0 ≤ Inorm) (_h1 : Inorm ≤ 1) (_hεL : 0 < εL) (_hεU : εU < 1) (_hεLU : εL < εU) : Inorm < εL ∨ (εL ≤ Inorm ∧ Inorm ≤ εU) ∨`

## 50. `NouseuxThreshold.regimes_mutually_exclusive`

- **Type :** `theorem`
- **Portée :** `public`
- **Namespace :** `NouseuxThreshold`
- **Section :** `(aucune)`
- **Fichier :** `Nouseux/Formal/Threshold_Full.lean:39`
- **État :** ✅ Valide
- **Signature :** `theorem regimes_mutually_exclusive (hεLU : εL < εU) : (¬ (Inorm < εL ∧ (εL ≤ Inorm ∧ Inorm ≤ εU))) ∧ (¬ ((εL ≤ Inorm ∧ Inorm ≤ εU) ∧ εU < Inorm)) ∧ (¬ (Inorm < εL ∧ εU < Inorm)) := by`
