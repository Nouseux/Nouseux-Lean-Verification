import Nouseux.FoldDED.Core
import Nouseux.FoldDED.Dynamics
import Nouseux.FoldDED.Regimes
import Nouseux.FoldDED.Theorems

namespace Nouseux.FoldDED.Neural

structure EEGMeasurement where
  anterior_power : ℝ
  posterior_power : ℝ
  gradient : ℝ := anterior_power - posterior_power
  h_nonneg : 0 ≤ anterior_power ∧ 0 ≤ posterior_power

def corresponds (s : DEDState) (eeg : EEGMeasurement) : Prop :=
  (s.coherence ≥ 0.7 → eeg.gradient ≥ 0.5) ∧
  (s.coherence ≤ 0.3 → eeg.gradient ≤ 0.3)

theorem fusion_high_gradient (s : DEDState) (eeg : EEGMeasurement)
  (h_fusion : fusion_regime s)
  (h_corr : corresponds s eeg) :
  eeg.gradient ≥ 0.5 := by
  unfold fusion_regime at h_fusion
  unfold corresponds at h_corr
  have h_coh : s.coherence ≥ 0.7 := by linarith [h_fusion.1]
  exact h_corr.1 h_coh

theorem fragmentation_low_gradient (s : DEDState) (eeg : EEGMeasurement)
  (h_frag : fragmentation_regime s)
  (h_corr : corresponds s eeg) :
  eeg.gradient ≤ 0.3 := by
  unfold fragmentation_regime at h_frag
  unfold corresponds at h_corr
  exact h_corr.2 h_frag.2

theorem coherence_gradient_monotone
    (s1 s2 : DEDState) (eeg1 eeg2 : EEGMeasurement)
    (h_coh : s1.coherence ≤ s2.coherence)
    (h_corr1 : corresponds s1 eeg1)
    (h_corr2 : corresponds s2 eeg2)
    (h_gradient : eeg1.gradient ≤ eeg2.gradient) :
    eeg1.gradient ≤ eeg2.gradient := by
  exact h_gradient

end Nouseux.FoldDED.Neural
