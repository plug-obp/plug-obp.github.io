---
layout: page
title: repos
order: 7
---

# Plug repositories

## Top Level

- [plug-packaging](https://github.com/plug-obp/plug-packaging.git), it includes:
    - Core:
        - [plug-core](https://bitbucket.org/plug-team/plug-core.git)
        - [plug-module-loading](https://bitbucket.org/plug-team/plug-module-loading)
        - [plug-utils](https://bitbucket.org/plug-team/plug-utils)
        - [plug-synchronization](https://bitbucket.org/plug-team/plug-synchronization)
        - [plug-pastfreeze](https://bitbucket.org/plug-team/plug-pastfreeze)
    - UI:
        - [plug-utils-fx](https://bitbucket.org/plug-team/plug-utils-fx)
        - [plug-core-ui](https://bitbucket.org/plug-team/plug-core-ui)
        - @Deprecated [plug-editor-fx](https://bitbucket.org/plug-team/plug-editor-fx.git)
    - Properties:
        - [jicpl](https://bitbucket.org/plug-team/jicpl.git)
        - [plug-runtime-buchi](https://bitbucket.org/plug-team/plug-runtime-buchi)
        - [plug-runtime-buchikripke](https://bitbucket.org/plug-team/plug-runtime-buchikripke)
    - Runtimes:
        - [plug-runtime-LFiacre](https://bitbucket.org/plug-team/plug-runtime-LFiacre)
        - [plug-runtime-LSpinJa](https://bitbucket.org/plug-team/plug-runtime-LSpinJa)
        - [plug-runtime-LTUML](https://bitbucket.org/plug-team/plug-runtime-LTUML)
        - [plug-runtime-lexplicit](https://bitbucket.org/plug-team/plug-runtime-lexplicit)
        - [plug-runtime-composite](https://bitbucket.org/plug-team/plug-runtime-composite)
        - [plug-runtime-remote](https://github.com/plug-obp/plug-runtime-remote.git)
    - Alien runtimes:
        - [plug-remote-python](https://github.com/plug-obp/plug-remote-python.git)

## Core

- [plug-core](https://bitbucket.org/plug-team/plug-core.git)

### Plugin System

- [plug-module-loading](https://bitbucket.org/plug-team/plug-module-loading)

### Remotes and Alien connection infrastructure

The connection with runtimes that do not share the "core framework" memory representation.
Multiple possibilities to study: socket (TCP, UDP, UART), serial, REST, memory-mapped files, data-bases, disk files.

- The core framework side of the connection to Aliens (Remotes):
    - [plug-runtime-remote](https://github.com/plug-obp/plug-runtime-remote.git)
- Remote examples:
    - C: [plug-remote-c](https://github.com/plug-obp/plug-remote-c.git)
    - Python: [plug-remote-python](https://github.com/plug-obp/plug-remote-python.git)

## UI

- [plug-core-ui](https://bitbucket.org/plug-team/plug-core-ui)
- @Deprecated [plug-simulation-fx-ui](https://bitbucket.org/plug-team/plug-simulation-fx-ui)
- @Deprecated [plug-editor-fx](https://bitbucket.org/plug-team/plug-editor-fx.git)

### Specialized UI for remote TUML (Valentin Thesis)

- [plug-runtime-viatcp-ui](https://bitbucket.org/plug-team/plug-runtime-viatcp-ui)

## Property Languages

- [jicpl](https://bitbucket.org/plug-team/jicpl.git)
- [plug-runtime-buchi](https://bitbucket.org/plug-team/plug-runtime-buchi)

## Languages & Runtimes

### Composite Runtimes

- Generic System Composition Runtime [Asynchronous]: [plug-runtime-composite](https://bitbucket.org/plug-team/plug-runtime-composite)
- Synchronous Composition of Buchi & Kripke Runtimes: [plug-runtime-buchikripke](https://bitbucket.org/plug-team/plug-runtime-buchikripke)

### Leaf Runtimes

- Fiacre:
    - [fiacre-language](https://bitbucket.org/CipT/fiacre-language.git) *(very experimental, new Fiacre parser, compiler infrastructure)*
    - [plug-runtime-LFiacre](https://bitbucket.org/plug-team/plug-runtime-LFiacre) *(the interface with the Fiacre implementation in OBP)*
- BPMN:
    - [plug-bpmn2-examples](https://github.com/plug-obp/plug-bpmn2-examples.git)
    - [plug-bpmn2-semantics](https://github.com/plug-obp/plug-bpmn2-semantics.git)
- ClockRDL
    - [ClockRDL](https://github.com/teodorov/ClockRDL.git)
    - [plug-runtime-LClockRDL](https://bitbucket.org/plug-team/plug-runtime-LClockRDL)
- SpinJa
    - [plug-runtime-LSpinJa](https://bitbucket.org/plug-team/plug-runtime-LSpinJa)
- TLA
    - [plug-runtime-LTLA](https://bitbucket.org/plug-team/plug-runtime-LTLA)
- tUML
    - [plug-runtime-LTUML](https://bitbucket.org/plug-team/plug-runtime-LTUML)
    - [moc-os](http://trame.eseo.fr/git/moc-os/) *(the repository with the xtend tuml interpreter)*
    - [uml-interpreter-c](http://trame.eseo.fr/git/uml-interpreter-c/) *(the repository of the BareMetal UML interpreter)*
- Random
    - [plug-runtime-random](https://bitbucket.org/plug-team/plug-runtime-random)
- Guard Action
    - [plug-runtime-LGuardAction](https://bitbucket.org/plug-team/plug-runtime-LGuardAction)
- Explicit
    - [plug-runtime-lexplicit](https://bitbucket.org/plug-team/plug-runtime-lexplicit)
- TimeSquare
    - [plug-runtime-ltimesquare](https://bitbucket.org/plug-team/plug-runtime-ltimesquare)
    - [plug-runtime-lstate_event](https://github.com/plug-obp/plug-runtime-lstate_event.git)
- Environment specification language
    - [envlang](https://bitbucket.org/CipT/envlang.git) *(cyclic CDL, the eXtended Guide Description Language xGDL )*

## Reutilisable Libraries that might help in the implementation of language runtimes

- [plug-synchronization](https://bitbucket.org/plug-team/plug-synchronization)

## Exploration algorithms

- [plug-pastfreeze](https://bitbucket.org/plug-team/plug-pastfreeze)

## Examples, Studies & Demo Runtimes

- First simple verification API tests:
    - [plug-runtime-buchi-fcr-tests](https://bitbucket.org/plug-team/plug-runtime-buchi-fcr-tests.git)
    - [plug-runtime-buchi-viatcp-tests](https://github.com/plug-obp/plug-runtime-buchi-viatcp-tests.git)
- First simple simulation interface (swing)
    - [plug-simulation-ui](https://bitbucket.org/plug-team/plug-simulation-ui)
- Study of the integration with OBEO UML Designer
    - [UML-DSimulator](https://github.com/teodorov/UML-DSimulator.git)
- Monitoring Design Pattern Study
    - [sle2016](https://github.com/teodorov/sle2016.git)

## Build Related

The plug-plugin should have a clearer name. [*plug-plugin4gradle*]

[plug-plugin](https://github.com/plug-obp/plug-plugin.git)

A gradle plugin for java generation from ecore:

[Ecore2JavaGradle](https://github.com/teodorov/Ecore2JavaGradle.git)

[plug-devel](https://bitbucket.org/plug-team/plug-devel)

## Should not exist

The things in the following repositories should be moved in specialized repositories, because they are (should be) generic.

- [plug-utils](https://bitbucket.org/plug-team/plug-utils)
- [plug-utils-fx](https://bitbucket.org/plug-team/plug-utils-fx)

## Other related repositories

[announce4j](https://github.com/teodorov/announce4j.git)
