---
layout: page
title: obpcdl
order: 6
---

## A language : Context Description Language (CDL)

CDL aims at formalizing the context with scenarios and temporal properties using property patterns. This DSML is based on UML 2. A CDL model describes, on the one hand, the context using activity and sequence diagrams and, on the other hand, the properties to be checked using property patterns. The originality of CDL is its ability to link each expressed property to a context diagram, i.e. a limited scope of the system behavior. allows contexts with scenarios and temporal properties using property patterns to be specified.

## A toolset : Observer Based Prover (OBP)

OBP is an implementation of a CDL language translation in terms of formal languages. It takes as input a CDL model and generates a set of FIACRE programs after contexts splitting. OBP leverages existing academic simulators and model checkers, as TINA [LAAS] or OBP-Explorer [ENSTA-Bretagne].

![fdf](../lib/cdl_transfo_with_obp.jpg)

## Download OBP Explorer version 1.5.0

*for Java 1.8, January 2017*

- [OBP Explorer v.1.5.0 for Windows 64](https://bintray.com/plug-obp/distributions/download_file?file_path=obp-1.5.0-win64.zip)
- [OBP Explorer v.1.5.0 for Windows 32](https://bintray.com/plug-obp/distributions/download_file?file_path=obp-1.5.0-win32.zip)
- [OBP Explorer v.1.5.0 Batch](https://bintray.com/plug-obp/distributions/download_file?file_path=obp-1.5.0-batch.zip)
- [OBP Explorer v.1.5.0 for Linux 64 bits](https://bintray.com/plug-obp/distributions/download_file?file_path=obp-1.5.0-unix64.tar.bz2)
- [OBP Explorer v.1.5.0 for Linux 32 bits](https://bintray.com/plug-obp/distributions/download_file?file_path=obp-1.5.0-unix32.tar.bz2)
- [OBP Explorer v.1.5.0 for Mac OS 64 bit](https://bintray.com/plug-obp/distributions/download_file?file_path=obp-1.5.0-osx64.zip)

## Documentation

<ul class=" fix-media-list-overlap">
<li class="level1"><div class="li"> <a href="../lib/doc_manual_obpe_29sept12.pdf" target="_blank" class="media mediafile mf_pdf" title="doc_manual_obpe_29sept12.pdf (6.8 MB)"> OBP Explorer v.1.3 tutorial (in french)</a></div>
</li>
<li class="level1"><div class="li"> <a href="../lib/specifications_cdl_21nov14.pdf"  target="_blank" class="media mediafile mf_pdf" title="specifications_cdl_21nov14.pdf (517.4 KB)"> Specifications CDL V 2.1 (21 nov14 in french)</a></div>
</li>
<li class="level1"><div class="li"> <a href="../lib/semantics_cdlpattern_v1_0.v" class="media mediafile mf_zip" title="semantics_cdlpattern_v1_0.v (5.7 KB)"> CDL pattern semantics V 1.0 (Gallina code for COQ)</a></div>
</li>
</ul>

## Examples (for OBP Explorer 1.4.5 and after)

*for more examples, please contact us*

<ul class=" fix-media-list-overlap">
<li class="level1"><div class="li"> <a href="../lib/exe/learning_examples-media=learning_examples.zip.zip" class="media mediafile mf_zip" title="learning_examples.zip (452.4 KB)"> Examples for learning </a></div>
</li>
<li class="level1"><div class="li"> <a href="../lib/exe/cai_submission-media=cai_submission.zip.zip" class="media mediafile mf_zip" title="cai_submission.zip (8.7 KB)">CCSL implementation example for CAI submission CDL and Fiacre files (feb.6, 2014)</a></div>
</li>
<li class="level1"><div class="li"> <a href="../lib/exe/expe_afadl_2018-media=expe_afadl_2018.zip.zip" class="media mediafile mf_zip" title="expe_afadl_2018.zip (79.7 KB)"> Experimentations for AFADL 2018 (fiacre and cdl codes)</a></div>
</li>
</ul>

## Some publications

- Valentin Besnard, Matthias Brun, Frédéric Jouault, Ciprian Teodorov, Philippe Dhaussy, Unified LTL Verification and Embedded Execution of UML Models, Models 2018 <a href="lib/exe/unified_ltl_verification_and_embedded_execution_of_uml_models-media=unified_ltl_verification_and_embedded_execution_of_uml_models.pdf.pdf" class="media mediafile mf_pdf" title="unified_ltl_verification_and_embedded_execution_of_uml_models.pdf (974.5 KB)">pdf</a>
 
- Vincent Leilde, Vincent Ribaud, Ciprian Teodorov, Philippe Dhaussy, A Problem-Oriented Framework to Diagnose Secured Applications, DETECT 2018 <a href="lib/exe/detect_2018-media=detect_2018.pdf.pdf" class="media mediafile mf_pdf" title="detect_2018.pdf (461 KB)">pdf</a>

- Vincent Leilde, Vincent Ribaud, Ciprian Teodorov, Philippe Dhaussy, Domain-oriented Verification Management, MEDI 2018 <a href="lib/exe/medi_2018-media=medi_2018.pdf.pdf" class="media mediafile mf_pdf" title="medi_2018.pdf (437 KB)">pdf</a>

- Fadi Obeid, Validation Formelle d’Implantation de Patrons de Sécurité, thèse de doctorat, Ensta Bretagne, UBL, juin 2018 <a href="lib/exe/thesis_fadiobeid_12juin18-media=thesis_fadiobeid_12juin18.pdf.pdf" class="media mediafile mf_pdf" title="thesis_fadiobeid_12juin18.pdf (5 MB)">pdf</a>

- Fadi Obeid et Philippe Dhaussy, Model-checking for Secured Component Implementation. SAM 2018 <a href="lib/exe/sam18_patterns_9714-media=sam18_patterns_9714.pdf.pdf" class="media mediafile mf_pdf" title="sam18_patterns_9714.pdf (1.2 MB)">pdf</a>

- Fadi Obeid, Philippe Dhaussy, Validation Formelle d’Architectures Logicielles Basée sur des Patrons de Sécurité, AFADL&#039;18 <a href="lib/exe/afadl_obeid_dhaussy_3mai18-media=afadl_obeid_dhaussy_3mai18.pdf.pdf" class="media mediafile mf_pdf" title="afadl_obeid_dhaussy_3mai18.pdf (194.4 KB)">pdf</a>

- Vincent Leilde, Vincent Ribaud, Ciprian Teodorov, and Philippe Dhaussy,  A diagnosis framework for critical systems verification, SEFM’17 <a href="lib/exe/sefm_2017_paper_leilde_73-media=sefm_2017_paper_leilde_73.pdf.pdf" class="media mediafile mf_pdf" title="sefm_2017_paper_leilde_73.pdf (200.3 KB)">pdf</a>

- Valentin Besnard, Matthias Brun, Philippe Dhaussy, Frédéric Jouault, David Olivier and Ciprian Teodorov. Towards one Model Interpreter for Both Design and Deployment. Conf EXE 2017 <a href="lib/exe/exe_2017_paper_6-media=exe_2017_paper_6.pdf.pdf" class="media mediafile mf_pdf" title="exe_2017_paper_6.pdf (1.2 MB)">pdf</a>

- Lamia Allal, Ghalem Belalem, Philippe Dhaussy, Ciprian Teodorov. Using parallel and distributed reachability in model checking. RACCCS-2017 <a href="lib/exe/racccs-2017_lamia_paper_80-media=racccs-2017_lamia_paper_80.pdf.pdf" class="media mediafile mf_pdf" title="racccs-2017_lamia_paper_80.pdf (178.4 KB)">pdf</a>

- C. Teodorov, L. Le Roux, Z. Drey, and P. Dhaussy, “Past-Free[ze] reachability analysis: reaching further with DAG-directed exhaustive state-space analysis”, Software Testing, Verification and Reliability, Aug. 2016 <a href="lib/exe/revuestvr_2016-media=revuestvr_2016.pdf.pdf" class="media mediafile mf_pdf" title="revuestvr_2016.pdf (1.9 MB)">pdf</a>.

- Vincent Leilde, Vincent Ribaud, Philippe Dhaussy, An Organizing System to Perform and Enable Verification and Diagnosis Activities, IDEAL’16. <a href="lib/exe/ideal_2016-media=ideal_2016.pdf.pdf" class="media mediafile mf_pdf" title="ideal_2016.pdf (418.4 KB)">pdf</a>

- Vincent Leilde, Vincent Ribaud, Philippe Dhaussy, Model-based Diagnosis Patterns for Model Checking, PAME 2016 (co-located with MODELS’16). <a href="lib/exe/pame_2016-media=pame_2016.pdf.pdf" class="media mediafile mf_pdf" title="pame_2016.pdf (346.6 KB)">pdf</a>

- Ciprian Teodorov, Philippe Dhaussy, Luka Le Roux, Environment-driven Reachability for Timed Systems : Safety Verification of an Aircraft Landing Gear System, Int. Software Tools for Technology Transfer (STTT), DOI 10.1007/s10009-015-0401-2, Springer-Verlag, 2016 <a href="lib/exe/sttt_2015-media=sttt_2015.pdf.pdf" class="media mediafile mf_pdf" title="sttt_2015.pdf (1.5 MB)"> pdf</a>.

- Nadia Menad, Philippe Dhaussy, Zoé Drey, Rachida Mekki. Towards a Transformation Approach of Timed UML MARTE Specification for Observer-Based Verification. Computing and Informatics, to be published, 2016 <a href="lib/exe/paper_cai_18juin15-media=paper_cai_18juin15.pdf.pdf" class="media mediafile mf_pdf" title="paper_cai_18juin15.pdf (1.5 MB)"> pdf</a>.

- Vincent Ribaud, Ciprian Teodorov, Zoé Drey, Luka Le Roux and Philippe Dhaussy, Techniques and Challenges for Trace Processing from a Model-Checking Perspective. E-conference on Computer, Information, Systems Sciences, &amp; Engineering (CISSE), 2014 <a href="lib/exe/cisse14_7dec14-media=cisse14_7dec14.pdf.pdf" class="media mediafile mf_pdf" title="cisse14_7dec14.pdf (394 KB)"> pdf</a>.

- Teodorov C., Leroux L. and Dhaussy P. Context-aware Verification of a Cruise-Control System. 4th International Conference on Model &amp; Data Engineering (MEDI), Larnaca, Cyprus, September 24-26, 2014.<a href="lib/exe/medi2014_teodorovdhaussyleroux-media=medi2014_teodorovdhaussyleroux.pdf.pdf" class="media mediafile mf_pdf" title="medi2014_teodorovdhaussyleroux.pdf (1009 KB)"> pdf</a>

- Philippe Dhaussy, Ciprian Teodorov, Context-aware Verification Technique to a Landing Gear System, 4th International ABZ 2014 Conference, Case Study Track, June 2 - 6 2014, Toulouse - France.<a href="lib/exe/abz14_cameraready-media=abz14_cameraready.pdf.pdf" class="media mediafile mf_pdf" title="abz14_cameraready.pdf (6.1 MB)"> pdf</a>

- L. Le Roux, J. Delatour et P. Dhaussy. Modélisation UML d&#039;un régulateur de vitesse automobile. Revue Génie Logiciel, n° 109, Juin 2014 <a href="lib/exe/gl_109_leroux_delatour_dhaussy_27mai-media=gl_109_leroux_delatour_dhaussy_27mai.pdf.pdf" class="media mediafile mf_pdf" title="gl_109_leroux_delatour_dhaussy_27mai.pdf (396.1 KB)"> pdf (in french)</a>.

- Jouault F., Téodorov C., Delatour J., Le Roux L. et Dhaussy P. Transformation de modèles UML vers Fiacre, via les langages intermédiaires tUML et ABCD. Revue Génie Logiciel, n° 109, Juin 2014 <a href="lib/exe/gl_109_jouault_teodorov_delatour_leroux_dhaussy_27mai14-media=gl_109_jouault_teodorov_delatour_leroux_dhaussy_27mai14.pdf.pdf" class="media mediafile mf_pdf" title="gl_109_jouault_teodorov_delatour_leroux_dhaussy_27mai14.pdf (220.6 KB)"> pdf (in french)</a>.

- Dhaussy P., Le Roux L. et Téodorov C. Vérification formelle de propriétés : Application  de l’outil OBP au cas d’étude CCS. Revue Génie Logiciel, n° 109, Juin 2014 <a href="lib/exe/gl_109_dhaussy_leroux_teodorov_27mai14-media=gl_109_dhaussy_leroux_teodorov_27mai14.pdf.pdf" class="media mediafile mf_pdf" title="gl_109_dhaussy_leroux_teodorov_27mai14.pdf (333.5 KB)"> pdf (in french)</a>.

- L. Le Roux, P. Dhaussy et F. Boniol. Vérification formelle de propriétés basée sur une réduction de l&#039;espace d&#039;exploration de modèles. Revue Génie Logiciel, n° 107, décembre 2013 <a href="lib/exe/gl-107-le_roux-dhaussy-boniol_25nov13-media=gl-107-le_roux-dhaussy-boniol_25nov13.pdf.pdf" class="media mediafile mf_pdf" title="gl-107-le_roux-dhaussy-boniol_25nov13.pdf (252.7 KB)"> pdf (in french)</a>.

- Nadia Menad, Philippe Dhaussy, A Transformation Approach for Multiform Time Requirements, 11th International Conference on Software Engineering and Formal Methods (SEFM’13), LNCS vol. 8137, September 25-27, pp. 16–30, 2013, Madrid, Spain <a href="lib/exe/papsefm_cameraready_17juillet13-media=papsefm_cameraready_17juillet13.pdf.pdf" class="media mediafile mf_pdf" title="papsefm_cameraready_17juillet13.pdf (862.4 KB)"> pdf</a>

- Dhaussy P., Boniol F., Leroux L., Roger JC.,  Formal analysis of UML model, chapter in Modeling and Analysis of Embedded Systems, Whiley Editor. 2013 <a href="lib/exe/chapter_9_obp_pacemaker_2013-media=chapter_9_obp_pacemaker_2013.pdf.pdf" class="media mediafile mf_pdf" title="chapter_9_obp_pacemaker_2013.pdf (792 KB)"> pdf</a>.

- Philippe Dhaussy, Frédéric Boniol, Jean-Charles Roger, and Luka Leroux, “Improving Model Checking with Context Modelling” Advances in Software Engineering, vol. 2012, Article ID 547157, 13 pages, 2012. doi:10.1155/2012/547157. See : <a href="http://www.hindawi.com/journals/ase/2012/547157/" class="urlextern" title="http://www.hindawi.com/journals/ase/2012/547157/" rel="nofollow">http://www.hindawi.com/journals/ase/2012/547157/</a> or <a href="lib/exe/paper_47157_advancesinse_2012_-media=paper_47157_advancesinse_2012_.pdf.pdf" class="media mediafile mf_pdf" title="paper_47157_advancesinse_2012_.pdf (1.9 MB)"> pdf</a>

- Philippe Dhaussy, Jean-Charles Roger, Luka Leroux, Frédéric Boniol, Context Aware Model Exploration with OBP tool  to Improve Model-Checking. ERTS’12, febuary 1-3, 2012. <a href="lib/exe/talk_erts12_01fev12-media=talk_erts12_01fev12.pdf.pdf" class="media mediafile mf_pdf" title="talk_erts12_01fev12.pdf (1.6 MB)">paper (pdf)</a> <a href="lib/exe/talk_erts12_01fev12-media=talk_erts12_01fev12.pdf.pdf" class="media mediafile mf_pdf" title="talk_erts12_01fev12.pdf (1.6 MB)"> talk (pdf)</a>

- Amine Raji, Intération des actvités de preuve dans le processus de développement de logiciels pour les systèmes embarqués. Thèse de doctorat, Ensta Bretagne - Telecom Bretagne, LabSticc, mars 2012 <a href="lib/exe/memoire_de_these_amine_raji_27012012-media=memoire_de_these_amine_raji_27012012.pdf.pdf" class="media mediafile mf_pdf" title="memoire_de_these_amine_raji_27012012.pdf (6.3 MB)"> pdf</a>

- Philippe Dhaussy, Frédéric Boniol, Jean-Charles Roger, Reducing State Explosion with Context Modeling for Model-Checking. 13th IEEE International High Assurance Systems Engineering Symposium (Hase’11), Boca Raton, USA. November 10-12, 2011.<a href="lib/exe/paper_hase11_6oct11-media=paper_hase11_6oct11.pdf.pdf" class="media mediafile mf_pdf" title="paper_hase11_6oct11.pdf (652.5 KB)"> pdf</a>

- Xavier Dumas, Frédéric Boniol, Philippe Dhaussy, Eric Bonnafous, Application of partial-order methods for the verification of closed-loop SDL systems, ACM Symposium On Applied Computing (SAC’11), TaiChung, Taiwan, March 2011.<a href="lib/exe/article_sac2011-media=article_sac2011.pdf.pdf" class="media mediafile mf_pdf" title="article_sac2011.pdf (344.9 KB)"> pdf</a>

- Amine Raji, Philippe Dhaussy, Bruno Aizier, Automating Context Description for Software Formal Verification, Workshop MoDeVVa 2010, Oslo, Norway, October 4th 2010.<a href="lib/exe/papiermodevva10-media=papiermodevva10.pdf.pdf" class="media mediafile mf_pdf" title="papiermodevva10.pdf (375.3 KB)"> pdf</a>

- Amine Raji, Philippe Dhaussy, User Context Models : A framework to ease software formal verifications,12th International Conference on Enterprise Information Systems (ICEIS’10), 8-12 june, 2010, Funchal, Madeira.<a href="lib/exe/paper_iceis_2010-media=paper_iceis_2010.pdf.pdf" class="media mediafile mf_pdf" title="paper_iceis_2010.pdf (246.2 KB)"> pdf</a>

- Xavier Dumas, Frédéric Boniol, Philippe Dhaussy, Eric Bonnafous,  Context Modelling and Partial-Order Reduction: Application to SDL Industrial Embedded Systems, IEEE Symposium on Industrial Embedded Systems (SIES’10), Trento, Italy, July 7-9, 2010.<a href="lib/exe/articlesies2010-media=articlesies2010.pdf.pdf" class="media mediafile mf_pdf" title="articlesies2010.pdf (455.2 KB)"> pdf</a>

- Dhaussy P., Pierre-Yves Pillain PY., Creff S., Raji A., Le Traon Y., Baudry B. Contribution à la formalisation de contextes et d’exigences pour la validation formelle de logiciels embarqués. Conférence Approches Formelles dans l&#039;Assistance au Développement de Logiciels (AFADL’10), Poitiers-Futuroscope, 09-11 Juin 2010.<a href="lib/exe/papier_dhaussy_afadl10_verslongue_16mai10_rnti-media=papier_dhaussy_afadl10_verslongue_16mai10_rnti.pdf.pdf" class="media mediafile mf_pdf" title="papier_dhaussy_afadl10_verslongue_16mai10_rnti.pdf (339.8 KB)"> pdf (in french) </a>

- Dhaussy P., Pierre-Yves Pillain PY., Creff S., Raji A., Le Traon Y., Baudry B. Evaluating Context Descriptions and Property Definition Patterns for Software Formal Validation.  In Lecture Notes in Computer Science 5795, Springer Verlag, Andy Schuerr, Bran Selic (Eds): 12th IEEE/ACM conf. Model Driven Engineering Languages and Systems (Models’09), No 5795 (2009), pages 438-452. <a href="lib/exe/papier_models09_24juillet09-media=papier_models09_24juillet09.pdf.pdf" class="media mediafile mf_pdf" title="papier_models09_24juillet09.pdf (1.1 MB)"> paper pdf </a>   <a href="lib/exe/pres_dhaussy_models09_aveccommentaires_8oct09-media=pres_dhaussy_models09_aveccommentaires_8oct09.pdf.pdf" class="media mediafile mf_pdf" title="pres_dhaussy_models09_aveccommentaires_8oct09.pdf (1.7 MB)"> talk pdf </a>

- Xavier Dumas, Frédéric Boniol, Philippe Dhaussy, Eric Bonnafous. Context Constraints Method for Software Formal Verification. ESA Workshop on Avionics Data, Control and Software Systems (ADCSS), Noordwijk, The Netherlands, 3-5 November 2009. 

- Ph.Dhaussy,  J.Auvray,  S.De Belloy,  F.Boniol,  E. Landel, Un langage de contexte  de preuve pour la validation formelle de modèles logiciels, Conférences LMO’08 et CAL’08, Montréal, 3 au 7 mars 2008.  Revue RNTI L-2. <a href="lib/exe/papier_dhaussy_cdl_cal_lmo08_15jan08-media=papier_dhaussy_cdl_cal_lmo08_15jan08.pdf.pdf" class="media mediafile mf_pdf" title="papier_dhaussy_cdl_cal_lmo08_15jan08.pdf (253.1 KB)"> pdf (in french) </a>

- A. Monégier du Sorbier, S. de Belloy, F. Turpin, Ph. Dhaussy, Expérimentation de composants de preuve pour le développement de composants logiciels embarqués, Journées NEPTUNE&#039;2008, Paris, 8-9 avril 2008, Revue Génie logiciel, juin 08, N° 85.<a href="lib/exe/papier_cdl_neptune_1avril08-media=papier_cdl_neptune_1avril08.pdf.pdf" class="media mediafile mf_pdf" title="papier_cdl_neptune_1avril08.pdf (84.3 KB)"> pdf (in french) </a>

- Ph.Dhaussy, F.Boniol, Mise en oeuvre de composants MDA  pour la validation formelle de modèles de systèmes d’information embarqués,  revue RSTI- ISI, Vol. 12, N° 5/2007, pages 133-157.<a href="lib/exe/papierrsti_isi_07_21dec07-media=papierrsti_isi_07_21dec07.pdf.pdf" class="media mediafile mf_pdf" title="papierrsti_isi_07_21dec07.pdf (384.2 KB)"> pdf (in french) </a>
