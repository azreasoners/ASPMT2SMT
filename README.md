# ASPMT2SMT
Computing ASPMT Using SMT Solvers

## Introduction
System aspmt2smt is a prototype implementation of multi-valued propositional formulas under the stable model semantics computed by the SMT solver Z3. This reduction is based on the theorem on completion which describes how to capture the non-monotonic semantics of ASPMT in classical logic. The system is a toolchain that includes aspmt-compiler, f2lp, gringo, and z3.

The implementation first compiles the ASPMT theory into a first-order formula without functions. F2lp is used to turn these first-order formulas into normal logic programs. Gringo is then used to partially ground the logic program. The system then converts the logic program back into an ASPMT theory with functions that is now partially ground. Then, the system computes the completion of the partially ground ASPMT theory, eliminates any remaining variables resulting in a variable-free first order formula with function. Finally, Z3 computes the classical models of this first-order formula, which correspond to the stable models of the original ASPMT theory.

## File Description
* The bin folder contains pre-compiled binaries of all required systems which should be placed in a directory in your path e.g. /usr/local/bin/
* The example folder contains example domains written as ASPMT Theories. Encodings in the language of Clingo and Clingcon are provided in addition to the ASPMT encodings except for the Bouncing Ball domain since neither is able to perform the continuous reasoning needed for this domain.

## Tutorial
The tutorial describes the leaking bucket example. 
### ASPMT Declarations
Consider a leaking bucket with maximum capacity c that loses one unit of water every time step by default. The bucket can be refilled to its maximum capacity by the action fill. The initial capacity is 5 and the desired capacity is 10. Here, the argument variable corresponding to the length of the plan increases so both systems suffer scalability issues.

Declarations in ASPMT are used to specify the valid ranges of values for arguments of functions and for functions themselves. In addition, they allow specification of user-defined sorts. They also specify the sorts of variables (if a variable is not declared it is understood to be a numeric variable). To declare two user defined sorts "atime" and "time", we write
```
:-sorts
  atime;time.
```
To specify that "time" ranges over the number range 0..10 and "atime" ranges of the number range 0..9, we write
```
:-objects
  0..10 :: time;
  0..9  :: atime.
```
To declare "amt" as a function from "time" to the real interval [0,10], "weight" as a function from "time" to the real interval [0,5], and "fill" as a function from "atime" to boolean values, we write
```
:-constants
  amt(time) :: real[0..10];
  weight(time) :: real[0..5];
  fill(atime) :: boolean.
```
To declare T as a variable of sort "time", ST as a variable of sort "atime", and X as a variable over the number range 0..10, we write
```
:-variables
  T :: time;
  ST :: atime;
  X :: int[0..10].
```

### ASPMT Formulas
The multi-valued propositional rules are formed using the constants, variables, objects, and propositional connectives, which include & (conjunction), | (disjunction), -> (implication), <- (reverse direction implication), not (negation). Below is an annotated example.
```
%By default, the amount at the next timestep is 1 less than the amount at this timestep
{amt(ST+1) = X-1} <- amt(ST) = X.

%The weight at time T is Y , where Y is the amount at time T divided by 3
weight(T) = Y <- Y = X/3 & amt(T) = X.

%The fill action is exogenous at all timesteps (other than the final timestep, when actions are not executed).
{fill(ST) = true}.
{fill(ST) = false}.

%If the fill action is executed at the current timestep, then the amount at the next timestep is 10.
amt(ST+1) = X <- fill(ST) = true & X = 10.

%Do not allow the amount to become less than 2 at any time.
<- amt(T) = X & X < 2.

%Initially, the amount is 5.
amt(0) = 5.

%A plan should result in the amount being 8 at time 10.
<- not amt(10) = 8.
```

### Running ASPMT2SMT
Typical invocation of the toolchain script will be aspmt2smt [FILENAME] [CONSTANTS] where [FILENAME] is the name of the input file, [CONSTANTS] are of the form "-c [CONST]=[VALUE]". For example, to run the leaking bucket example, we write
```
aspmt2smt tests/amt 
```
