---

---

# Plug repositories

## Top Level

https://github.com/plug-obp/plug-packaging.git

## Core

https://CipT@bitbucket.org/plug-team/plug-core.git

### Plugin System

https://CipT@bitbucket.org/plug-team/plug-module-loading

### Remotes and Alien connection infrastructure

The connection with runtimes that do not share the "core framework" memory representation.
Multiple possibilities to study: socket (TCP, UDP, UART), serial, REST, memory-mapped files, data-bases, disk files.

#### The core framework side of the connection to Aliens (Remotes)

https://github.com/plug-obp/plug-runtime-remote.git

#### Remote examples

##### C

https://github.com/plug-obp/plug-remote-c.git

##### Python

https://github.com/plug-obp/plug-remote-python.git

## UI

https://CipT@bitbucket.org/plug-team/plug-core-ui

https://CipT@bitbucket.org/plug-team/plug-simulation-fx-ui

https://CipT@bitbucket.org/plug-team/plug-editor-fx.git

### Specialized UI for remote TUML (Valentin Thesis)

https://CipT@bitbucket.org/plug-team/plug-runtime-viatcp-ui

## Property Languages

https://CipT@bitbucket.org/plug-team/jicpl.git

https://CipT@bitbucket.org/plug-team/plug-runtime-buchi

## Languages & Runtimes

### Composite Runtimes

#### Generic System Composition Runtime [Asynchronous]

https://CipT@bitbucket.org/plug-team/plug-runtime-composite

#### Synchronous Composition of Buchi & Kripke Runtimes

https://CipT@bitbucket.org/plug-team/plug-runtime-buchikripke

### Leaf Runtimes

#### Fiacre

https://CipT@bitbucket.org/CipT/fiacre-language.git *(very experimental, new Fiacre parser, compiler infrastructure)*

https://CipT@bitbucket.org/plug-team/plug-runtime-LFiacre *(the interface with the Fiacre implementation in OBP)*

#### BPMN

https://github.com/plug-obp/plug-bpmn2-examples.git

https://github.com/plug-obp/plug-bpmn2-semantics.git

#### ClockRDL

https://github.com/teodorov/ClockRDL.git

https://CipT@bitbucket.org/plug-team/plug-runtime-LClockRDL

#### SpinJa

https://CipT@bitbucket.org/plug-team/plug-runtime-LSpinJa

#### TLA

https://CipT@bitbucket.org/plug-team/plug-runtime-LTLA

#### tUML

https://CipT@bitbucket.org/plug-team/plug-runtime-LTUML

http://CiprianTeodorov@trame.eseo.fr/git/moc-os/ *(the repository with the xtend tuml interpreter)*

http://CiprianTeodorov@trame.eseo.fr/git/uml-interpreter-c/ *(the repository of the BareMetal UML interpreter)*

#### Random

https://CipT@bitbucket.org/plug-team/plug-runtime-random

#### Guard Action

https://CipT@bitbucket.org/plug-team/plug-runtime-LGuardAction

#### Explicit

https://CipT@bitbucket.org/plug-team/plug-runtime-lexplicit

#### TimeSquare

https://CipT@bitbucket.org/plug-team/plug-runtime-ltimesquare

https://github.com/plug-obp/plug-runtime-lstate_event.git

#### Environment specification language

https://CipT@bitbucket.org/CipT/envlang.git *(cyclic CDL, the eXtended Guide Description Language xGDL )*

## Reutilisable Libraries that might help in the implementation of language runtimes

https://CipT@bitbucket.org/plug-team/plug-synchronization

## Exploration algorithms

https://CipT@bitbucket.org/plug-team/plug-pastfreeze

## Examples, Studies & Demo Runtimes

### First simple verification API tests

https://CipT@bitbucket.org/plug-team/plug-runtime-buchi-fcr-tests.git

https://github.com/plug-obp/plug-runtime-buchi-viatcp-tests.git

### First simple simulation interface (swing)

https://CipT@bitbucket.org/plug-team/plug-simulation-ui

### Study of the integration with OBEO UML Designer

https://github.com/teodorov/UML-DSimulator.git

### Monitoring Design Pattern Study

https://github.com/teodorov/sle2016.git

## Build Related

The plug-plugin should have a clearer name. [*plug-plugin4gradle*]

https://github.com/plug-obp/plug-plugin.git

A gradle plugin for java generation from ecore:

https://github.com/teodorov/Ecore2JavaGradle.git

https://CipT@bitbucket.org/plug-team/plug-devel

## Should not exist

The things in the following repositories should be moved in specialized repositories, because they are (should be) generic.

https://CipT@bitbucket.org/plug-team/plug-utils

https://CipT@bitbucket.org/plug-team/plug-utils-fx

## Other related repositories

https://github.com/teodorov/announce4j.git
