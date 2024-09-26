---
layout: page
title: home
order: 1
---

- [Download](http://mocs-artefacts.ensta-bretagne.fr/OBP2/v1.0.0-21_12_13/obp2-1.0.0.zip)
**Version 1.0.0**
- [Download](http://mocs-artefacts.ensta-bretagne.fr/OBP2/v1.0.0-21_12_13/obp2-1.0.0.zip)
**OBP2 Daily**
- [Download](http://mocs-artefacts.ensta-bretagne.fr/OBP2/v1.0.0-21_12_13/obp2-simulator-1.0.0.zip)
**Simulator Daily**
{: .download}

## **Modular Verification Meets xDSL Dynamics**

The OBP2 infra-structure provides advanced tools to debug, simulate and model-check your DSL without relying on transformations.

![Overview](/images/220624_overview.svg){:class="center-image"}

OBP (initially **O**bserver **B**ased **P**rover) is a formal verification environment for systems, designed at [ENSTA Bretagne](https://www.ensta-bretagne.fr/en), originally designed around the [Fiacre specification language](https://projects.laas.fr/fiacre/index.php) and a context-driven verification methodology. Since 2015, it has been re-architected to become a flexible software framework used not only for model-checking verification but also for animation, model debugging, and execution monitoring on real targets.

### Main Characteristics:

- **Extensibility of the Verification Engine**: OBP enables seamless integration of domain-specific formalisms such as [SDL]({% post_url 2022-06-23-studio %}), [BPMN]({% post_url 2019-11-15-process %}), [AnimUML]({% post_url 2020-10-22-animuml %}), [EMI-UML](bare-metal-uml), [TLA+](https://lamport.azurewebsites.net/tla/tla.html), and [Fiacre]((https://projects.laas.fr/fiacre/index.php)). This flexibility allows users to adapt OBP to various modeling needs.

- **Integration of Domain-Specific Omniscient Debugging with Model-Checking**: This feature bridges the gap between early model diagnosis and formal verification, providing a more comprehensive verification process.

- **Capacity to Decompose the Verification Problem**: Based on the Context-aware Verification approach, OBP effectively addresses scalability issues inherent in industrial-scale verification by breaking down complex verification tasks into manageable components.

- **Language Independent Property Specifications**: OBP utilizes the [GPSL formalism](gpsl) to allow for property specifications that are independent of the underlying modeling language, enhancing the versatility of the verification process.

The analysis engine of OBP operates independently of the formalism, allowing the integration of new modeling languages while being used in various industrial and scientific projects. The tool has been integrated into commercial products for verification purposes, including PragmaDEV PROCESS, a BPMN business process modeling tool, and PragmaDEV Studio, a modeling tool based on SDL.

OBP is open-source software (MIT License) that has generated significant results in academic research and has been involved in collaborative projects, resulting in numerous theses and publications.

<video src="/images/obp2/demo.mp4" width="730px" autoplay loop muted playsinline class="center-image"></video>
