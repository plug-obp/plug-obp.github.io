---
layout: page
title: dev-repos
---

# Plug repositories

## Top Level

[plug-packaging](https://github.com/plug-obp/plug-packaging.git)

## Core

[plug-core](https://CipT@bitbucket.org/plug-team/plug-core.git)

### Plugin System

[plug-module-loading](https://CipT@bitbucket.org/plug-team/plug-module-loading)

### Remotes and Alien connection infrastructure

The connection with runtimes that do not share the "core framework" memory representation.
Multiple possibilities to study: socket (TCP, UDP, UART), serial, REST, memory-mapped files, data-bases, disk files.

#### The core framework side of the connection to Aliens (Remotes)

[plug-runtime-remote](https://github.com/plug-obp/plug-runtime-remote.git)

#### Remote examples

##### C

[plug-remote-c](https://github.com/plug-obp/plug-remote-c.git)

##### Python

[plug-remote-python](https://github.com/plug-obp/plug-remote-python.git)

## UI

[plug-core-ui](https://CipT@bitbucket.org/plug-team/plug-core-ui)

[plug-simulation-fx-ui](https://CipT@bitbucket.org/plug-team/plug-simulation-fx-ui)

[plug-editor-fx](https://CipT@bitbucket.org/plug-team/plug-editor-fx.git)

### Specialized UI for remote TUML (Valentin Thesis)

[plug-runtime-viatcp-ui](https://CipT@bitbucket.org/plug-team/plug-runtime-viatcp-ui)

## Property Languages

[jicpl](https://CipT@bitbucket.org/plug-team/jicpl.git)

[plug-runtime-buchi](https://CipT@bitbucket.org/plug-team/plug-runtime-buchi)

## Languages & Runtimes

### Composite Runtimes

#### Generic System Composition Runtime [Asynchronous]

[plug-runtime-composite](https://CipT@bitbucket.org/plug-team/plug-runtime-composite)

#### Synchronous Composition of Buchi & Kripke Runtimes

[plug-runtime-buchikripke](https://CipT@bitbucket.org/plug-team/plug-runtime-buchikripke)

### Leaf Runtimes

#### Fiacre

[fiacre-language](https://CipT@bitbucket.org/CipT/fiacre-language.git) *(very experimental, new Fiacre parser, compiler infrastructure)*

[plug-runtime-LFiacre](https://CipT@bitbucket.org/plug-team/plug-runtime-LFiacre) *(the interface with the Fiacre implementation in OBP)*

#### BPMN

[plug-bpmn2-examples](https://github.com/plug-obp/plug-bpmn2-examples.git)

[plug-bpmn2-semantics](https://github.com/plug-obp/plug-bpmn2-semantics.git)

#### ClockRDL

[ClockRDL](https://github.com/teodorov/ClockRDL.git)

[plug-runtime-LClockRDL](https://CipT@bitbucket.org/plug-team/plug-runtime-LClockRDL)

#### SpinJa

[plug-runtime-LSpinJa](https://CipT@bitbucket.org/plug-team/plug-runtime-LSpinJa)

#### TLA

[plug-runtime-LTLA](https://CipT@bitbucket.org/plug-team/plug-runtime-LTLA)

#### tUML

[plug-runtime-LTUML](https://CipT@bitbucket.org/plug-team/plug-runtime-LTUML)

[moc-os](http://CiprianTeodorov@trame.eseo.fr/git/moc-os/) *(the repository with the xtend tuml interpreter)*

[uml-interpreter-c](http://CiprianTeodorov@trame.eseo.fr/git/uml-interpreter-c/) *(the repository of the BareMetal UML interpreter)*

#### Random

[plug-runtime-random](https://CipT@bitbucket.org/plug-team/plug-runtime-random)

#### Guard Action

[plug-runtime-LGuardAction](https://CipT@bitbucket.org/plug-team/plug-runtime-LGuardAction)

#### Explicit

[plug-runtime-lexplicit](https://CipT@bitbucket.org/plug-team/plug-runtime-lexplicit)

#### TimeSquare

[plug-runtime-ltimesquare](https://CipT@bitbucket.org/plug-team/plug-runtime-ltimesquare)

[plug-runtime-lstate_event](https://github.com/plug-obp/plug-runtime-lstate_event.git)

#### Environment specification language

[envlang](https://CipT@bitbucket.org/CipT/envlang.git) *(cyclic CDL, the eXtended Guide Description Language xGDL )*

## Reutilisable Libraries that might help in the implementation of language runtimes

[plug-synchronization](https://CipT@bitbucket.org/plug-team/plug-synchronization)

## Exploration algorithms

[plug-pastfreeze](https://CipT@bitbucket.org/plug-team/plug-pastfreeze)

## Examples, Studies & Demo Runtimes

### First simple verification API tests

[plug-runtime-buchi-fcr-tests](https://CipT@bitbucket.org/plug-team/plug-runtime-buchi-fcr-tests.git)

[plug-runtime-buchi-viatcp-tests](https://github.com/plug-obp/plug-runtime-buchi-viatcp-tests.git)

### First simple simulation interface (swing)

[plug-simulation-ui](https://CipT@bitbucket.org/plug-team/plug-simulation-ui)

### Study of the integration with OBEO UML Designer

[UML-DSimulator](https://github.com/teodorov/UML-DSimulator.git)

### Monitoring Design Pattern Study

[sle2016](https://github.com/teodorov/sle2016.git)

## Build Related

The plug-plugin should have a clearer name. [*plug-plugin4gradle*]

[plug-plugin](https://github.com/plug-obp/plug-plugin.git)

A gradle plugin for java generation from ecore:

[Ecore2JavaGradle](https://github.com/teodorov/Ecore2JavaGradle.git)

[plug-devel](https://CipT@bitbucket.org/plug-team/plug-devel)

## Should not exist

The things in the following repositories should be moved in specialized repositories, because they are (should be) generic.

[plug-utils](https://CipT@bitbucket.org/plug-team/plug-utils)

[plug-utils-fx](https://CipT@bitbucket.org/plug-team/plug-utils-fx)

## Other related repositories

[announce4j](https://github.com/teodorov/announce4j.git)
