# Nouseux V1.04ter — Lean 4 Formal Verification

[![Lean build](https://img.shields.io/badge/Lean-build%20verified-brightgreen)](../../actions)

This repository contains a Lean 4 formalisation of selected mathematical properties of the Nouseux model, Version 1.04ter, using Mathlib.

The formalisation provides **29 theorems across six reviewed Lean files**, with no `sorry` or `admit` in those files. These results are conditional on the hypotheses stated in each theorem and do not constitute a complete formal verification or empirical validation of the model.

## Verified scope

| File | Theorems | Proved scope |
|---|---:|---|
| `NAI_Bounds_Full.lean` | 19 | NAI bounds and related properties |
| `Threshold_Full.lean` | 3 | Conditions and partition of three regimes |
| `Recursion_Full.lean` | 1 | One-step boundedness |
| `Recursion_Invariance.lean` | 1 | Invariance of the recursive sequence |
| `Recursion_Monotonicity.lean` | 3 | Non-strict, one-step monotonicity |
| `Recursion_FixedPoint.lean` | 2 | Fixed-point results |
| **Total** | **29** | |

## Scope limitations

The reviewed Lean files do not establish:

- convergence of a general time-varying trajectory;
- a general strict-contraction theorem;
- certification of a Boolean implementation of band membership;
- empirical validity of the Nouseux model;
- complete formal verification of every component of the model.

Detailed theorem descriptions and build instructions are available in:

- [`Nouseux/Formal/README.md`](Nouseux/Formal/README.md)

## Repository structure

The reviewed formal proofs are located in:

```text
Nouseux/Formal/
```

The directory contains:

- `NAI_Bounds_Full.lean`
- `Threshold_Full.lean`
- `Recursion_Full.lean`
- `Recursion_Invariance.lean`
- `Recursion_Monotonicity.lean`
- `Recursion_FixedPoint.lean`

## Building

Use the Lean version specified in `lean-toolchain`.

```bash
lake update
lake build Nouseux
```

A successful build of the exact repository revision confirms that its Lean files compile. Dependencies on axioms or classical principles should be inspected separately with commands such as `#print axioms`.

## Source and archival record

- Source repository: https://github.com/Nouseux/Nouseux-Lean-Verification
- Archived release and DOI: to be added after publication on Zenodo

## Citation

Please cite the archived Zenodo release corresponding to the exact repository tag rather than the evolving `main` branch.
