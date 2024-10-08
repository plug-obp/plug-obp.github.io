---
layout: post
title: "GPSL syntax: LTL & Buchi"
permalink: /gpsl/
categories: properties
author: Ciprian
notInMenu: true
---

__Generic Property Specification Language__ (GPSL) is the language used by OBP2 for specifying the properties that should be verified during the analysis. Currently it supports Linear Temporal Logic and Buchi Automata specifications.

GPSL is **only** a *property-specification* language. Methodologically it is orthogonal from the formalisms used for *capturing the operational environment* (xGDL scenarios) and for *taming the state-space explosion* problem during model-checking (state-space decomposition, pruning through state-constraints - TLA, etc.).

The main characteristic of GPSL is its independence from the formalism used for model-specification. To achieve this independece relation, the GPSL language delegates the evaluation of the atomic properties to the *verification model* semantics. Thus, from the perspective of the specification language, the atomic proposition are simply a mapping of names to booleans. In other words, the GPSL semantics binds the *property* to the *verification model* through a semantics-driven evaluation function.

In GPSL each property is associated with a named variable. All these variables form the *property set*
Any *property* can be verified during an analysis run.

### Propositional Logic: Syntax & Semantics

There are two Boolean constants predefined in the language: **true** and **false**

Atomic proposition in GPSL are strings of characters enclosed between pairs of `|` (ie. `| string of characters |`). Each atomic proposition can be prefixed with two identifiers specifying the atomic proposition language and the 'verification' module on which it should be interpreted.

### Boolean Operators

Two expressions f and g can be combined using the following Boolean operators

|Operation  | syntax0       | syntax1   | syntax2   | syntax3   | syntax4 |
|---------  |:-------------:|:---------:|:---------:|:---------:|:-------:|
|negation   | not f         | !f        | ~f        |           |         |
|disjunction| f or g        | f \| g    | f \/ g    | f + g     |         | 
|conjunction| f and g       | f & g     | f && g    | f /\ g    | f * g   |
|exclusion  | f xor g       | f ^ g     |           |           |         |
|implication| f implies g   | f -> g    | f => g    |           |         |
|equivalence| f iff g       | f <-> g   | f <=> g   |           |         |

### Let Expressions

To simplify the expression of large formula GPSL uses Let expression forms to 
introduce variables.

```
let
    v1 = expr
    v2 = expr
    ...
    vn = expr
in
    v1 op v2
```

## Temporal Logic: Syntax & Semantics

The support for LTL is enabled using LTL3Buchi conversion [1].

### Temporal Logic Operators

Two expressions f and g can be combined using the following Boolean operators

|operation      | syntax0   | syntax1       | syntax2   | 
|---------------|:---- ----:|:-------------:|:---------:|
| Next          | X f       | next f        | () f      |
| Eventually    | F f       | eventually f  | <> f      |
| Always        | G f       | globally f    | [] f      |
| Strong Until  | f U g     | f until g     |           |
| Weak Until    | f W g     |               |           |
| Weak Release  | f R g     | f release g   | f V g     |
| Strong Release| f M g     |               |           |

#### Some LTL examples

```plain
aliceCS			= |{Alice}1@CS|
bobCS 			= |{Bob}1@CS|
exclusionI 		= []!(|{Alice}1@I| && |{Bob}1@I|)
exclusion  		= []!(aliceCS && bobCS)
eventuallyOneInCS 	= []<>(aliceCS || bobCS)
fairness 		= 
	let
		aliceFlagUP=|{sys}1:flags[0] = true|,
		bobFlagUP=|{sys}1:flags[1] = true|
	in 
		 ([]  (  (aliceFlagUP -> (<> aliceCS) )
		      && (bobFlagUP -> (<> bobCS))))  
idling = let
		aliceFlagUP=|{sys}1:flags[0]=true|,
		bobFlagUP=|{sys}1:flags[1]=true|
	in
		([]  (!aliceFlagUP -> (![] aliceCS))
		   && (!bobFlagUP -> (![] bobCS)) )
infoften 		=  [] <> bobCS

all = (exclusion & eventuallyOneInCS & fairness & idling)
```

### Buchi Automata

Buchi Automata can be used for expressing properties. In this case the syntax for atomic propositions stays the same.
The named variables, used in the automaton, are restricted to propositional logic constructs.
The in clause of the let construct is extended with the syntactical term for describing the automaton.
In this context an automaton is composed of 4 parts :

- the set of states
- the initial state(s)
- the accepting state(s)
- the guarded transitions

The set of state is defined by the keyword *states* followed by a comma delimited list of identifiers (state names)
```
states_rule := 'states' identifier (',' identifier)*
```

The initial state(s) are introduced with the keyword *initial* followed by a comma delimited list of state names
```
initial_rule := 'initial' identifier (',' identifier)*
```

The accepting state(s) are introduced with the keyword *accept* followed by a comma delimited list of state names 
```
accept_rule := 'accept' identifier (',' identifier)*
```

Each transition is specified by the source state, the guard expression, and the target state, where the source and target state are state identifiers, and the guard expression is a propositional logic expression composed using literals (true, false), atomic propositions (|...|), propositional operators (!, and, or, ->, etc), and named variable references.
```
transition_rule := identifier '[' expression ']' identifier
```

The automaton is defined by the following syntax:
```
automaton_rule := 
        states_rule ';'
        initial_rule ';'
        accept_rule ';'
        transition_rule (';' transition_rule)*
```

#### Buchi Automaton Example

Automaton as named property :
```
aut1 = 
    states s0, s1;
    initial s0;
    accept s1;
    s0 [ |a=5| ] s1;
    s0 [ true ] s0;
    s1 [ |b=7| and |c=2| ] s1
```

Automaton in let expression :
```
b1 = let
		a1 = |P_1!=wait|,
		a2 = |P_0=choose|,
		a3 = |P_2!=choose|,
		a4 = |number[1]<0|,
		p1 = !a3 and !a4,
		p2 = a3 and a4,
	in
		states s0, s1, s2, s3;
		initial s0;
		accept s2, s3;
		s0 [!a2 and !a1] s1;
		s0 [(!a1 and p1) or (!a1 and p2)] s2;
		s0 [a1] s3;
		s1 [!a2] s1;
		s1 [|P_1==wait|] s2;
		s2 [p1] s2;
		s3 [true] s3
```

## References

[1] Babiak, Tomáš, et al. "LTL to Büchi automata translation: Fast and more deterministic." International Conference on Tools and Algorithms for the Construction and Analysis of Systems. Springer, Berlin, Heidelberg, 2012.