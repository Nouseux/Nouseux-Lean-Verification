import Mathlib.Data.Nat.Basic
import Mathlib.Logic.Function.Basic
import Mathlib.Basic.ENNReal.Basic
import Mathlib.Tactic

/-!
# L'Hôtel Infini de Hilbert : Résolution par Réétiquetage

Ce fichier distingue les chambres physiques de leurs étiquettes.
Le réétiquetage modifie uniquement les étiquettes et ne déplace
aucune chambre physique.
-/

namespace Nouseux.Foundation.HilbertHotel

/-- Une chambre physique. -/
structure PhysicalRoom where
  /-- Position physique immuable dans l'espace. -/
  position : ℕ
  /-- État d'occupation de la chambre. -/
  occupied : Bool
  deriving DecidableEq

/-- Une étiquette de porte. -/
structure DoorLabel where
  /-- Numéro affiché sur la porte. -/
  number : ℕ
  deriving DecidableEq

/-- Un hôtel est une collection de chambres munie d'un étiquetage injectif. -/
structure Hotel where
  /-- Chambres physiques fixes. -/
  rooms : ℕ → PhysicalRoom
  /-- Fonction d'étiquetage. -/
  labeling : ℕ → DoorLabel
  /-- L'étiquetage est injectif. -/
  labeling_injective : Function.Injective labeling
  /-- Toutes les chambres sont occupées. -/
  all_occupied : ∀ n, (rooms n).occupied = true

/-- Énergie classique, représentée par une valeur dans les réels étendus positifs. -/
noncomputable def classical_energy (_h : Hotel) : ENNReal :=
  ⊤

/-- Énergie du réétiquetage, nulle car aucune chambre ne se déplace. -/
def nouseux_energy (_h : Hotel) : ENNReal :=
  0

/-- Réétiquetage d'un hôtel : seules les étiquettes changent. -/
def relabel
    (h : Hotel)
    (newLabeling : ℕ → DoorLabel)
    (hinj : Function.Injective newLabeling) : Hotel :=
  { h with
    labeling := newLabeling
    labeling_injective := hinj }

/-- Les chambres physiques restent inchangées après réétiquetage. -/
theorem rooms_stay_fixed
    (h : Hotel)
    (newLabeling : ℕ → DoorLabel)
    (hinj : Function.Injective newLabeling)
    (n : ℕ) :
    (relabel h newLabeling hinj).rooms n = h.rooms n := by
  rfl

/-- Le réétiquetage ne déplace aucune chambre. -/
theorem relabeling_does_not_move_rooms
    (h : Hotel)
    (newLabeling : ℕ → DoorLabel)
    (hinj : Function.Injective newLabeling)
    (n : ℕ) :
    ((relabel h newLabeling hinj).rooms n).position =
      (h.rooms n).position := by
  rfl

/-- L'énergie Nouseux est nulle. -/
theorem nouseux_energy_is_zero
    (h : Hotel) :
    nouseux_energy h = 0 := by
  rfl

/-- L'énergie classique vaut la valeur infinie ⊤. -/
theorem classical_energy_is_top
    (h : Hotel) :
    classical_energy h = ⊤ := by
  rfl

/-- Le réétiquetage conserve l'occupation de chaque chambre. -/
theorem relabeling_preserves_occupation
    (h : Hotel)
    (newLabeling : ℕ → DoorLabel)
    (hinj : Function.Injective newLabeling)
    (n : ℕ) :
    ((relabel h newLabeling hinj).rooms n).occupied =
      (h.rooms n).occupied := by
  rfl

end Nouseux.Foundation.HilbertHotel
