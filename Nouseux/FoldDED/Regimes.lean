-- Les trois régimes du framework DED
-- Inspiré par SAPIEN2, HERO, EQUILIBRIUM (François Renno, 2024)

import Nouseux.FoldDED.Core

namespace Nouseux.FoldDED

/-!
# The Three Regimes of Collaborative Dynamics

Based on the sculpture series by François Renno (2024):

## SAPIEN2 (Fusion Regime)
"I grasp meaning—I understand symbols"
- **Coherence Range**: (0.7, 1.0]
- **Characteristics**: High coherence, shared mental models
- **Risk**: Loss of individual identity

## HERO (Nouseux Regime)
"I fulfill myself in my singularity"
- **Coherence Range**: (0.3, 0.7]
- **Characteristics**: Balanced autonomy + collaboration
- **Optimal**: Best regime for creativity and innovation

## EQUILIBRIUM (Fragmentation Regime)
"I am the weight and the measure"
- **Coherence Range**: [0.0, 0.3]
- **Characteristics**: Low coherence, high autonomy
- **Stability**: Stable equilibrium (attractor)
-/

/-! ### Regime Definitions -/

/-- Régime SAPIEN2 (Fusion): High coherence, shared understanding -/
def fusion_regime (s : DEDState) : Prop :=
  0.7 < s.coherence ∧ s.coherence ≤ 1.0

/-- Régime HERO (Nouseux): Balanced autonomy and collaboration -/
def nouseux_regime (s : DEDState) : Prop :=
  0.3 < s.coherence ∧ s.coherence ≤ 0.7

/-- Régime EQUILIBRIUM (Fragmentation): Low coherence, high autonomy -/
def fragmentation_regime (s : DEDState) : Prop :=
  0.0 ≤ s.coherence ∧ s.coherence ≤ 0.3

/-! ### Basic Properties -/

/-- Fusion and Nouseux regimes are disjoint -/
theorem fusion_nouseux_disjoint (s : DEDState) :
    fusion_regime s → ¬nouseux_regime s := by
  unfold fusion_regime nouseux_regime
  intro ⟨h1, h2⟩ ⟨h3, h4⟩
  linarith

/-- Nouseux and Fragmentation regimes are disjoint -/
theorem nouseux_fragmentation_disjoint (s : DEDState) :
    nouseux_regime s → ¬fragmentation_regime s := by
  unfold nouseux_regime fragmentation_regime
  intro ⟨h1, h2⟩ ⟨h3, h4⟩
  linarith

/-- Fusion and Fragmentation regimes are disjoint -/
theorem fusion_fragmentation_disjoint (s : DEDState) :
    fusion_regime s → ¬fragmentation_regime s := by
  unfold fusion_regime fragmentation_regime
  intro ⟨h1, h2⟩ ⟨h3, h4⟩
  linarith

/-- The three regimes cover the entire state space (assuming coherence ∈ [0,1]) -/
theorem regimes_cover (s : DEDState) (h0 : 0 ≤ s.coherence) (h1 : s.coherence ≤ 1) :
    fusion_regime s ∨ nouseux_regime s ∨ fragmentation_regime s := by
  unfold fusion_regime nouseux_regime fragmentation_regime
  by_cases h : s.coherence ≤ 0.3
  · right; right
    constructor
    · norm_num; exact h0
    · exact h
  · by_cases h' : s.coherence ≤ 0.7
    · right; left; constructor
      · linarith
      · exact h'
    · left; constructor
      · linarith
      · norm_num; exact h1
/-! ### Summary -/

#check fusion_regime
#check nouseux_regime
#check fragmentation_regime
#check fusion_nouseux_disjoint
#check nouseux_fragmentation_disjoint
#check fusion_fragmentation_disjoint
#check regimes_cover

end Nouseux.FoldDED
