# ASPMT2SMT
Computing ASPMT Using SMT Solvers

## Introduction
System aspmt2smt is a prototype implementation of multi-valued propositional formulas under the stable model semantics computed by the SMT solver Z3. This reduction is based on the theorem on completion which describes how to capture the non-monotonic semantics of ASPMT in classical logic. The system is a toolchain that includes aspmt-compiler, f2lp, gringo, and z3.

The implementation first compiles the ASPMT theory into a first-order formula without functions. F2lp is used to turn these first-order formulas into normal logic programs. Gringo is then used to partially ground the logic program. The system then converts the logic program back into an ASPMT theory with functions that is now partially ground. Then, the system computes the completion of the partially ground ASPMT theory, eliminates any remaining variables resulting in a variable-free first order formula with function. Finally, Z3 computes the classical models of this first-order formula, which correspond to the stable models of the original ASPMT theory.

## File Description
The bin folder contain pre-compiled binaries of all required systems which should be placed in a directory in your path e.g. /usr/local/bin/
