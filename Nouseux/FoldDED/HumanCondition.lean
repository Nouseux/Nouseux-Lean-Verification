import Nouseux.FoldDED.Core
import Nouseux.FoldDED.Dynamics
import Nouseux.FoldDED.Regimes
import Nouseux.FoldDED.Theorems

/-!
# The Human Condition: REA Cycle

Models the fundamental cycle of collaborative human cognition:

**Reflection → Emotion → Action**

## Philosophical Foundation

The REA cycle captures the essence of human collaborative consciousness:

- **Reflection (R):** Cognitive processing, introspection, and high coherence.
- **Emotion (E):** Affective bridging, empathic resonance, and medium coherence.
- **Action (A):** Behavioral manifestation, collaborative output, and variable coherence.

## Correspondence with DED

| REA Phase  | DED Phase   | Coherence Range | Neural Signature         |
|------------|-------------|-----------------|--------------------------|
| Reflection | Distinction | 0.7–1.0        | High frontal activity    |
| Emotion    | Emergence   | 0.3–0.7        | Limbic–cortical coupling |
| Action     | Division    | 0.0–0.3        | Motor preparation        |

The correspondence is conceptual: the REA phase describes the cognitive
function, while the DED phase describes the associated structural regime.
-/

namespace Nouseux.FoldDED.HumanCondition

/-- The three phases of the REA cycle. -/
inductive Phase
  | Reflection
  | Emotion
  | Action
  deriving DecidableEq, Repr

/-- A REA state extends a DED state with a phase label. -/
structure REAState extends DEDState where
  phase : Phase

/-- The cyclic successor of a REA phase. -/
def next_phase : Phase → Phase
  | Phase.Reflection => Phase.Emotion
  | Phase.Emotion => Phase.Action
  | Phase.Action => Phase.Reflection

/-- Reflection-phase coherence condition. -/
def ReflectionCondition (s : REAState) : Prop :=
  s.phase = Phase.Reflection → s.coherence ≥ 0.7

/-- Emotion-phase coherence condition. -/
def EmotionCondition (s : REAState) : Prop :=
  s.phase = Phase.Emotion →
    0.3 ≤ s.coherence ∧ s.coherence ≤ 0.7

/-- Action-phase coherence condition. -/
def ActionCondition (s : REAState) : Prop :=
  s.phase = Phase.Action → s.coherence ≤ 0.3

/-- Evolution of a REA state. -/
noncomputable def evolve_rea (s : REAState) (dt : ℝ) : REAState :=
  let s' := evolve s.toDEDState dt
  { toDEDState := s'
    phase := next_phase s.phase }

/-!
## Theorem 1: REA Cycle Completeness

Every sufficiently long trajectory passes through all three phases.
-/

theorem rea_cycle_completeness (trajectory : ℕ → REAState)
    (h_evolve :
      ∀ n, ∃ dt, dt ≥ 0 ∧
        trajectory (n + 1) = evolve_rea (trajectory n) dt) :
    ∀ n, ∃ k₁ k₂ k₃,
      (trajectory (n + k₁)).phase = Phase.Reflection ∧
      (trajectory (n + k₂)).phase = Phase.Emotion ∧
      (trajectory (n + k₃)).phase = Phase.Action := by
  intro n

  have hstep : ∀ m,
      (trajectory (m + 1)).phase =
        next_phase (trajectory m).phase := by
    intro m
    obtain ⟨dt, _hdt, heq⟩ := h_evolve m
    have hphase := congrArg REAState.phase heq
    simpa [evolve_rea] using hphase

  have h₁ := hstep n
  have h₂raw := hstep (n + 1)

  have h₂ :
      (trajectory (n + 2)).phase =
        next_phase (trajectory (n + 1)).phase := by
    simpa [Nat.add_assoc] using h₂raw

  cases h₀ : (trajectory n).phase with
  | Reflection =>
      refine ⟨0, 1, 2, ?_, ?_, ?_⟩
      · simp [h₀]
      · simpa [h₀, next_phase] using h₁
      · simpa [h₀, h₁, next_phase] using h₂

  | Emotion =>
      refine ⟨2, 0, 1, ?_, ?_, ?_⟩
      · simpa [h₀, h₁, next_phase] using h₂
      · simp [h₀]
      · simpa [h₀, next_phase] using h₁

  | Action =>
      refine ⟨1, 2, 0, ?_, ?_, ?_⟩
      · simpa [h₀, next_phase] using h₁
      · simpa [h₀, h₁, next_phase] using h₂
      · simp [h₀]

/-!
## Theorem 2: Emotion Bridges Reflection and Action
-/

theorem emotion_bridges_reflection_action
    (s₁ s₂ s₃ : REAState)
    (h₁ : s₁.phase = Phase.Reflection)
    (h_seq :
      ∃ dt₁ dt₂,
        dt₁ ≥ 0 ∧
        dt₂ ≥ 0 ∧
        (s₂ = evolve_rea (evolve_rea s₁ dt₁) dt₂ ∨
         (s₃ = evolve_rea s₁ dt₁ ∧
          s₂ = evolve_rea s₃ dt₂))) :
    ∃ s_mid : REAState, s_mid.phase = Phase.Emotion := by
  obtain ⟨dt₁, dt₂, _h_dt₁, _h_dt₂, h_or⟩ := h_seq

  cases h_or with
  | inl _h_direct =>
      refine ⟨evolve_rea s₁ dt₁, ?_⟩
      simp [evolve_rea, next_phase, h₁]

  | inr h_via =>
      obtain ⟨h_s₃, _h_s₂⟩ := h_via
      refine ⟨s₃, ?_⟩
      rw [h_s₃]
      simp [evolve_rea, next_phase, h₁]

/-!
## Theorem 3: REA Preserves Coherence Bounds
-/

theorem rea_preserves_coherence
    (s : REAState)
    (h_init : 0 ≤ s.coherence ∧ s.coherence ≤ 1) :
    ∀ dt, dt ≥ 0 →
      let s' := evolve_rea s dt
      0 ≤ s'.coherence ∧ s'.coherence ≤ 1 := by
  intro dt h_dt
  unfold evolve_rea
  simp
  constructor

  · have h_exp : 0 ≤ Real.exp (-dt / 10) :=
      le_of_lt (Real.exp_pos (-dt / 10))
    exact mul_nonneg h_init.1 h_exp

  · have h_dec :=
      coherence_decreases s.toDEDState dt h_dt h_init.1
    calc
      (evolve s.toDEDState dt).coherence ≤ s.coherence := h_dec
      _ ≤ 1 := h_init.2

/-!
## Theorem 4: REA-DED Correspondence
-/

theorem rea_ded_correspondence (s_rea : REAState) :
    ∃ s_ded : DEDState,
      s_ded.coherence = s_rea.coherence ∧
      s_ded.energy = s_rea.energy ∧
      s_ded.fold_depth = s_rea.fold_depth := by
  exact ⟨s_rea.toDEDState, rfl, rfl, rfl⟩

/-!
## Auxiliary Lemmas
-/

/-- Three applications of `next_phase` return to the original phase. -/
lemma phase_cycle_period_3 :
    ∀ phase : Phase,
      next_phase (next_phase (next_phase phase)) = phase := by
  intro phase
  cases phase <;> rfl

/-- Each phase has a unique successor. -/
lemma phase_transition_unique (phase : Phase) :
    ∃! p', p' = next_phase phase := by
  refine ⟨next_phase phase, rfl, ?_⟩
  intro y hy
  exact hy

/--
High coherence excludes the Action phase, and low coherence excludes
the Reflection phase, provided the corresponding phase conditions hold.
-/
lemma coherence_determines_phase
    (s : REAState)
    (h_reflection : ReflectionCondition s)
    (h_action : ActionCondition s) :
    (s.coherence ≥ 0.7 →
      s.phase = Phase.Reflection ∨ s.phase = Phase.Emotion) ∧
    (s.coherence ≤ 0.3 →
      s.phase = Phase.Action ∨ s.phase = Phase.Emotion) := by
  constructor

  · intro h_high
    cases h_eq : s.phase with
    | Reflection =>
        left
        rfl

    | Emotion =>
        right
        rfl

    | Action =>
        have h_action_low : s.coherence ≤ 0.3 :=
          h_action h_eq
        exfalso
        linarith

  · intro h_low
    cases h_eq : s.phase with
    | Action =>
        left
        rfl

    | Emotion =>
        right
        rfl

    | Reflection =>
        have h_reflection_high : s.coherence ≥ 0.7 :=
          h_reflection h_eq
        exfalso
        linarith

end Nouseux.FoldDED.HumanCondition
