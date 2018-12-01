---
layout: page
title: bare-metal-uml
order: 5
---

## An Embedded Model Interpreter for UML Models
{: style="text-align: center"}

Plug can also be used to analyze UML models through an Embedded Model Interpreter (EMI).
This interpreter aims at simulating, verifying, and executing UML models with a unique implementation of the UML semantics. Simualtion and model-checking activities can be performed directly on the executable UML model running on the model interpreter by connecting Plug to this interpreter.
This tool provides an execution platform running either with OS support on desktop computers or without OS (bare-metal) on resource constrained embedded targets (e.g., STM32). This model interpreter is developped in collaboration with our industrial partner Davidson ([https://www.davidson.fr/](https://www.davidson.fr/)).
{: style="text-align: justify"}

### Simulation and Model-checking of a Level Crossing UML Model

<video src="/assets/videos/plug_obp_emi.mp4" width="720px" autoplay loop muted playsinline class="center-image"></video>

### Overview of the Project

The increasing complexity of embedded systems leads to uncertain behaviors, security flaws, and design mistakes. With model-based engineering, early diagnosis of such issues is made possible by verification tools working on design models.  
From a UML design model of the system under study, classical approaches requires two transformations:
* A first transformation towards a diagnosis model written in a formal language to apply diagnosis tools (e.g., simulator, model-checker),
* A second transformation using code generation to produce the actual application code.
{: style="text-align: justify"}

![Schema of the classical approach used to analyze and execute UML models](/images/bare-metal-uml/uml_interpretation_schema_classical_approach.png)

Three severe drawbacks remain to be fixed:
* A first semantic gap between the design model and the executable
* A second semantic gap between the design model and the diagnosis model that complicates the diagnosis process
* An equivalence relation between verified formal models and deployed code should be built, proven, and maintained.

The main cause of all these issues is the use of multiple definitions of the modeling language semantics.
{: style="text-align: justify"}

To tackle these issue, our approach relies on the use of an embedded model interpreter that encodes a single definition of the UML semantics for all activities: simulation, verification, and execution.
The UML design model is directly loaded in the model interpreter at compile-time.
This model can then be analyzed using the model-checker Plug by connecting this verification tool to the model interpreter through a dedicated communication interface.
Plug can be used to simulate the UML model, explore the model state-space, detect deadlocks and verified LTL properties by model-checking.
Once verified, the same couple (model + interpreter) can be deployed on the embedded target of the actual system.
{: style="text-align: justify"}

![Schema of our approach used to analyze and execute UML models](/images/bare-metal-uml/uml_interpretation_schema_our_approach.png)

### Useful Links


* Download
  * | OBP2 EMI | [[download](https://bintray.com/plug-obp/distributions/download_file?file_path=plug-obp2_emi-daily.zip)]|[[osx](https://bintray.com/plug-obp/distributions/download_file?file_path=plug-obp2_emi-mac-daily.zip)]


* [Installation Manual](/assets/docs/EMI_InstallationManual.pdf)


* Examples of models written in tUML, a textual formalism for UML:
  * [Peterson algortihm](/assets/docs/AliceBobPeterson.tuml)
  * [Level crossing](/assets/docs/LevelCrossing.tuml)
