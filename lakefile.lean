import Lake
open Lake DSL

package nouseux where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

require importGraph from git
  "https://github.com/leanprover-community/import-graph.git" @ "main"

@[default_target]
lean_lib Nouseux where
  globs := #[.submodules `Nouseux]
