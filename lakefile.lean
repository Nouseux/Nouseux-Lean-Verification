import Lake
open Lake DSL

package «nouseux» where
  -- add package configuration options here

lean_lib «Nouseux» where
  -- add library configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

