import Mathlib.Data.Nat.Basic
import Mathlib.Logic.Function.Basic
import Mathlib.Basic.ENNReal.Basic
import Mathlib.Tactic

/-!
# L'Hôtel Infini de Hilbert : Résolution par Réétiquetage

Ce fichier distingue les chambres physiques de leurs étiquettes.
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

end Nouseux.Foundation.HilbertHotel
