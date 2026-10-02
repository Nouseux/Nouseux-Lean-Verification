-- Test du module FoldDED
import Nouseux.FoldDED

open FoldDED

-- Exemple : créer un état DED
def example_state : DEDState ℝ where
  position := 0
  momentum := 1
  fold_intensity := 10

-- Vérifier l'évolution
#check evolve example_state 5

-- Vérifier les théorèmes
#check fold_stability
#check trajectory_uniqueness
#check ded_converges

-- Message de confirmation
#eval IO.println "✅ Module FoldDED chargé avec succès !"
