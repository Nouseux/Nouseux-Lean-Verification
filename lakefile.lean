import Lake
open Lake DSL

package «nouseux-verification» where
  version := v!"1.0.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «Nouseux» where
  -- add library configuration options here
++
