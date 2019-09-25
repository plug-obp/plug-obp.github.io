(*-----------------------------------------------------*)
(* semantics_CDLPattern_V1_0.v   *)
(* Author : Housseim Hachmaoui, Philippe Dhaussy *)
(* ENSTA Bretagne, Lab-STICC / MOCS *)
(* philippe.dhaussy@ensta-bretagne.fr *)
(* May 2015 *)
(*-----------------------------------------------------*)



Require Import List EqNat.
Export ListNotations.

(*###########*)
(*# Horloge #*)
(*###########*)

(* Nous definissons l'horloge comme parametre car celle-ci est geree 
par le systeme *)

Parameter clock:nat.

(* Types des operations a effectuer sur l'horloge *)
Inductive opHorloge : Type :=
|NoOp (* Rien *)
|ReInit (* Reinitialisation de l'horloge *)
.
(* Nous attribuons cette notation a la reinitialisation de l'horloge *)
Notation "clock:=-1" := ReInit.

(* Posons ce type pour les conditions relatives a l'horloge *)
Inductive condHorloge : Type :=
|NoCond (* Absence de condition *)
|cond : Prop -> condHorloge.

(* Nous attribuons cette notation a une condition *)
Notation "[| x |]"  := (cond x).

(* Format des contrainte temporelle *)
Definition inCond (x y:nat):= ((clock > y) /\ (clock < x)).
Definition outCond (x y:nat) := ((clock <= y) /\ (clock >= x)).


(*#######*)
(*# LTS #*)
(*#######*)

(*########### Les etats ##############################################*)

(* Nous avons certains etats fixes, d'autres intermediaires *)
Inductive state := Init|Inter|Reject|Success|state_: nat -> state.

(* Cette fonction retourne true si deux etats sont egaux, false sinon *)
Fixpoint beq_state (s1 s2 : state): bool:= match s1 , s2 with
|Init , Init => true
|Inter , Inter => true
|Reject , Reject => true
|Success, Success => true
|state_ id1 , state_ id2 => beq_nat id1 id2
|_,_ => false
end.

(* Notation infixee de la fonction beq_state *)
Infix "s=s" := beq_state (at level 50).

(* Exemples pour tester si la fonction est fonctionne correctement *)
Example test_beq_state_1: Inter s=s Inter = true.
trivial.
Qed.

Example test_beq_state_2: Inter s=s Reject = false.
trivial.
Qed.
Example test_beq_state_3: state_ 1 s=s state_ 2 = false.
trivial.
Qed.
Example test_beq_state_4: state_ 1 s=s state_ 1 = true.
trivial.
Qed.
(*####################################################################*)


(*########### Les evenements #########################################*)

(* Nous avons l'evenement nul, l'evenement de type signal gamma ou un evenement 
qu'on identifiera avec un id naturel *)
Inductive event := NoEvent|Gamma|e: nat -> event.

(* Cette fonction retourne true si deux evenements sont egaux, false sinon *)
Fixpoint beq_event (e1 e2 : event): bool:= match e1 , e2 with
|NoEvent,NoEvent => true
|Gamma , Gamma => true
|e id1 , e id2 => beq_nat id1 id2
|_, _ => false
end.

(* Notation infixee de la fonction beq_event *)
Infix "e=e" := beq_event (at level 50).


(* Exemples pour tester si la fonction est fonctionne correctement *)
Example test_beq_event_1: e 1 e=e Gamma = false.
trivial.
Qed.

Example test_beq_event_2: e 2 e=e e 2 = true.
trivial.
Qed.

Example test_beq_event_3: NoEvent e=e NoEvent = true.
trivial.
Qed.

(*####################################################################*)


(*########### Les etiquettes #########################################*)

(* Format general d'un label *)
Inductive label :Type := lab (condition:condHorloge) (ev:event) (op:opHorloge).

(* Attribution de plusieurs notations selon la presence ou l'absence d'un element
du label *)


Notation "( x // y / clock:=-1 )" := (lab x y ReInit) (at level 0). (* Condition, evenement et operation *)
Notation "( x  // y /)"  := (lab x y NoOp) (at level 0). (* Condition et evenement *)
Notation "( x /// clock:=-1)"  := (lab x NoEvent ReInit) (at level 0). (* Condition et operation *)
Notation "(// x / clock:=-1)"  := (lab NoCond x ReInit) (at level 0). (* Evenement et operation *)
Notation "(// x /)"  := (lab NoCond x NoOp) (at level 0). (* Evenement uniquement *)
Notation "( x ///)"  := (lab x NoEvent NoOp) (at level 0). (* Condition uniquement *)
Notation "(/// clock:=-1)"  := (lab NoCond NoEvent ReInit) (at level 0). (* Operation uniquement *)
Notation "(///)" := (lab NoCond NoEvent NoOp) (at level 0). (* Label vide *)
(*Notation "(// Gamma / clock:=-1)"  := (lab NoCond Gamma ReInit) (at level 0). (* Evt Gamma et operation *)*)



(* Quelques tests *)
Compute lab NoCond NoEvent NoOp.
Compute lab [|inCond 2 3|] NoEvent NoOp.
Compute lab NoCond (e 1) NoOp.
Compute lab NoCond NoEvent ReInit.
Compute lab [|2=2|] (e 1) NoOp.
Compute lab NoCond (e 1) ReInit.
Compute lab [|2=2|] NoEvent ReInit.
Compute lab [|2=2|] (e 1) ReInit.
Compute (// e 0 /).

(* Fonctions permettant de recuperer les elements de la structure label *)
Definition getLabCond (l:label):condHorloge := match l with
|lab x y z => x
end.

Definition getLabEvent (l:label):event := match l with
|lab x y z => y
end.

Definition getLabOp (l:label) := match l with
|lab x y z => z
end.

(* Cette fonction retourne true si deux operations sont egales, false sinon *)
Fixpoint beq_op (o1 o2 : opHorloge): bool:= match o1 , o2 with
|NoOp , NoOp => true
|ReInit,ReInit => true
|_, _ => false
end.

(* Notation infixee de la fonction beq_op *)
Infix "op=op" := beq_op (at level 50).

(* Cette fonction retourne true si deux conditions sont egales, false sinon *)
Fixpoint beq_cond (c1 c2 : condHorloge): bool:= match c1 , c2 with
|NoCond , NoCond => true
(*Ajouter d'autres egalites*)
|_, _ => false
end.
(* Traiter cette fonction *)

(* Notation infixee de la fonction beq_cond *)
Infix "c=c" := beq_cond (at level 50).


(* Cette fonction retourne true si deux labels sont egaux, false sinon *)
Definition beq_lab (a b:label):bool := match getLabCond(a) c=c getLabCond(b),
getLabEvent(a) e=e getLabEvent(b), getLabOp(a) op=op getLabOp(b) with
|true,true,true =>true
|_,_,_ => false
end.

(* Notation infixee de la fonction beq_lab *)
Infix "l=l" := beq_lab (at level 50).


(*####################################################################*)


(*########### Les transitions #########################################*)

(* Format general d'une transition *)
Inductive transition:Type := trans (src:state) (e:label) (trg:state).

(* Attribution d'une notation aux transtions *)
Notation "( x , y , z )"  := (trans x y z) .

(* Test des transitions *)
Compute trans Init ([|inCond 0 5|]///) Inter.

Compute trans Init ([| 0 = 5 |] ///) Inter.

Compute ( Init ,(//e 1/), Inter).
Eval compute in  (Init, (//e 1/) , Inter) .
Check trans Init (//e 3/)Inter.

(* Fonctions permettant de recuperer les elements de la structure transition *)
Definition getTransSrc (t:transition):state := match t with
|trans x y z => x
end.

Definition getTransTrg (t:transition):state := match t with
|trans x y z => z
end.

Definition getTransLab (t:transition):label := match t with
|trans x y z => y
end.

(* Cette fonction retourne true si deux transitions sont egales, false sinon *)
Definition beq_trans (t1 t2:transition):bool := match getTransSrc(t1) s=s getTransSrc(t2),
getTransTrg(t1) s=s getTransTrg(t2), getTransLab(t1) l=l getTransLab(t2) with
|true,true,true =>true
|_,_,_ => false
end.


(* Petite preuve sur la bonne définition des gets de transitions *)
Lemma sem_trans: forall (s1 s2: state) (l:label) (t:transition) , t = trans (s1) (l) (s2) -> getTransSrc(t)= s1 /\ 
getTransLab (t) = l /\ getTransTrg(t)= s2 .
intros.
rewrite H.
split; now repeat constructor.
Qed.

(*=========================================================*)
(*=  Definitions des elements syntaxiques des patrons CDL =*)
(*=========================================================*)


Inductive occurrence : Type :=
|Exactly_one: event -> occurrence
|One_or_more: event -> occurrence
.

Definition getEvtOfOccu (oc:occurrence) : event:=
match oc with
| Exactly_one x => x
| One_or_more x => x
end.

Fixpoint beq_occurrence (e1 e2 : occurrence): bool:= match e1 , e2 with
|Exactly_one x1 , Exactly_one x2 => beq_event x1 x2
|One_or_more x1 , One_or_more x2 => beq_event x1 x2
|_,_ => false
end.


Check Exactly_one (e 1).
Check One_or_more (e 2).
Check [(Exactly_one (e 1));(One_or_more (e 2))].


Inductive occurrence_expression :Type:=
an: list occurrence -> occurrence_expression
|all_ordered:list occurrence -> occurrence_expression
|all_combined:list occurrence -> occurrence_expression
.

Inductive repeatability :Type :=
|trueRep
|falseRep
.

Inductive immediacy :Type :=
|immediately
|eventually
.
Definition immediately_sem (x:list transition) := (Inter,(lab NoCond Gamma ReInit),Reject)::x.
Definition eventually_sem (x:list transition) := x.


(* Définition de la contrainte de temps leads_to et de son sens *)
Definition leads_to (x y :nat):list transition := (trans Inter (lab [|inCond x y|] NoEvent ReInit) Reject)::nil.


(* Défintion des éléments de Precedency et de leur sens *)

Inductive precedency :Type :=
|Cannot_occur
|May_occur.



(*Cannot occur before*)
Fixpoint Cannot_sem (l: list event) (e: event) : list transition := match l with
|nil => nil
|x::l' =>  (Init,(lab NoCond x ReInit),Reject)::(Cannot_sem(l') (e))
end.
(*Notation pour Cannot occur before*)
Infix "Cannot_occur_before" := Cannot_sem (at level 50).
(*Test de Cannot occur before*)
Compute ((e 2)::(e 3)::nil)  Cannot_occur_before (e 1).

(*May occur before*)
Definition May_sem (l:list event) (e:event) : list transition := nil.
(*Notation pour May occur before*)
Infix "May_occur_before" := May_sem (at level 50).
(*-----*)



(* Fonctions permettant de résoudre le problème des transitions en doublon
générées par différentes options *)

Fixpoint atLeastOne {X : Type} (f : X -> bool) (l : list X) : bool :=
  match l with
  | nil => false
  | h::t => if f h then true else atLeastOne f t
  end.

Definition atLeastOneElement {X : Type}
  (eqb : X -> X -> bool) (e : X) (l : list X) : bool :=
     atLeastOne (eqb e) l.

Definition clearDoublons {X : Type}
  (eqb : X -> X -> bool) (l : list X) : list X :=
    let fix intern (input : list X) (output : list X) : list X :=
                    match input with
                    | nil => output
                    | h::t => if (atLeastOneElement eqb h output)
                              then intern t output
                              else intern t (output++(h::nil))
                    end
    in intern l nil.


(*-----*)


(* Absence pattern *)

(* Définition de la contrainte de temps occurs et de son sens *)
Definition occurs_never:list transition := nil.


Fixpoint An_absence (lo:list occurrence) : list transition :=
match lo with
|nil => nil
|(Exactly_one ev)::l' => (Init,(//ev/),Reject)::An_absence(l')
|(One_or_more ev)::l' => (Init,(//ev/),Reject)::(Reject,(//ev/),Reject)::An_absence(l')
end.



Definition All_ordered_absence (num: nat) (l : list occurrence) : list transition :=
  let nextState := fun (s : state) => match s with
                               | Init => state_ num
                               | state_ n => state_ (S n)
                               | _ => s
                               end
  in let endState := Reject
  in let fix intern (s : state) (l : list occurrence) : list transition :=
               match l with
               | [] => []
               | o::[] => match o with 
                         |(Exactly_one ev) => [(s, (//getEvtOfOccu o/), endState)]
                         |(One_or_more ev) => [(s, (//getEvtOfOccu o/), endState);(endState, (//getEvtOfOccu o/), endState)]
                         end
               | (Exactly_one ev)::t =>
                   let next := nextState s
                   in (s, (//ev/), next)::(intern next t)
               | (One_or_more ev)::t =>
                   let next := nextState s
                   in (s, (//ev/), next)::(next,(//ev/),next)::(intern next t)
               end
  in intern Init l.



(*===============================All_combined==================================*)


Fixpoint getSubLists {X : Type} (l : list X) : list (list X) :=
  match l with
  |  [] => [nil]
  |  h::t =>
       let rest : list (list X) := getSubLists t
       in (map (app [h]) rest) ++ rest 
  end.

Definition stateAndListAbsence (l': list occurrence)  :list (state*(list occurrence)):=
(Init,l')::(let fix intern0 (l: list (list occurrence)):list (state*(list occurrence)):=
match l with
|[] => []
|h::t =>  let endState:=Reject in let nextState := fun (s : state) => match s with
                               | Init => state_ 1
                               | state_ n => state_ (S n)
                               | _ => s
                               end
                        in 
                           let fix intern1 (l2: list (list occurrence)) (ss:state) :
                             list (state*(list occurrence)):=
                            match l2 with
                              | nil => nil
                              |[nil] => [(endState,[])]
                              | h2::t2 => 
                                      match t2 with 
                                     |nil => [(ss,h2)]
                                     |_ => [(ss,h2)]++(intern1 t2 (nextState ss))
                                     end
                              end
                            in intern1 t (state_ 1)
  end  
in intern0 (getSubLists l')).


Fixpoint isIn {X : Type} (eq_X : X -> X -> bool)
  (x : X) (e : list X) : bool :=
    match e with
    | [] => false
    | h::t => if eq_X h x then true else isIn eq_X x t
    end.

Fixpoint minusList {X : Type} (eq_X : X -> X -> bool)
  (e e' : list X) : list X :=
    match e with
    | [] => []
    | h::t => let rest := minusList eq_X t e' 
              in if isIn eq_X h e' then rest else h::rest
    end.


Definition absCombTrans (a b : state*(list occurrence)): list transition :=
match a , b with
|(x1,y1) , (x2,y2) => let occu := minusList (beq_occurrence) (y1) (y2) 
                      in match occu with
                      |[Exactly_one e1] =>  if beq_nat (length y1) (S(length y2))
                              then [(x1,(//e1/),x2)] else nil
                      |[One_or_more e1] => if beq_nat (length y1) (S(length y2))
                              then [(x1,(//e1/),x2);(x2,(//e1/),x2)] else nil
                      | _ => nil
                         end
end.


Definition All_combined_absence (l:list occurrence):list transition:=
let fix intern (l':list (state*(list occurrence))):list transition :=
match l' with
  |  [] => []
  |  h::t =>  
       (let rest := intern t
       in (flat_map (absCombTrans h) t) ++ rest)
  end
in intern (stateAndListAbsence l).

(*==============================================================================*)
Fixpoint property_absence (arity_type:occurrence_expression) (occur:list transition): list transition :=
match arity_type with
|an lo => clearDoublons beq_trans (An_absence(lo)++occur)
|all_ordered lo => clearDoublons beq_trans (All_ordered_absence 1(lo)++occur)
|all_combined lo =>  clearDoublons beq_trans (All_combined_absence (lo)++occur)
end.



(*Existence pattern*)



(* Définition de la contrainte de temps occurs et de son sens *)
Definition occurs (x y :nat):list transition := (trans Inter ([|clock>y|]///clock:=-1) Reject)(*::(Tt Inter (notConst x y) Success)*)::nil.



Fixpoint An_existence (lo:list occurrence) (occurF:nat-> nat-> list transition) (x:nat) (y:nat) : list transition :=
match lo,occurF with
|nil, occurs => nil
|(Exactly_one ev)::l', occurs => ( Inter ,(lab [|clock>= x|] ev ReInit) , Success )::An_existence(l')(occurF)(x)(y)
|(One_or_more ev)::l', occurs => (Inter,(lab [|clock>= x|] ev ReInit),Success)::(Success,(lab [|clock>= x|] ev ReInit),Success)::An_existence(l')(occurF)(x)(y)
end.

Definition All_ordered_existence(num: nat) (l : list occurrence) (occurF:nat-> nat-> list transition) (x:nat) (y:nat) : list transition :=
  let nextState := fun (s : state) => match s with
                               | Inter => state_ num
                               | state_ n => state_ (S n)
                               | _ => s
                               end
  in let endState := Success
  in let fix intern (s : state) (l : list occurrence) : list transition :=
               match l,occurF with
               | [],occurs => []
               | o::[],occurs => match o with 
                         |(Exactly_one ev) => [(s, (lab [|clock>=x|] (getEvtOfOccu o) ReInit), endState)]
                         |(One_or_more ev) => [(s, (lab [|clock>=x|] (getEvtOfOccu o) ReInit), endState);(endState,  (lab [|clock>=x|] (getEvtOfOccu o) ReInit), endState)]
                         end
               | (Exactly_one ev)::t,occurs =>
                   let next := nextState s
                   in (s, (//ev/), next)::(next,([|clock>y|]///clock:=-1),Reject)::(intern next t)
               | (One_or_more ev)::t,occurs =>
                   let next := nextState s
                   in (s, (//ev/), next)::(next,([|clock>y|]///clock:=-1),Reject)::(next,(//ev/),next)::(intern next t)
               end
  in intern Inter l.






(*===============================All_combined==================================*)




Definition stateAndListExistence (l': list occurrence)  :list (state*(list occurrence)):=
(Inter,l')::(let fix intern0 (l: list (list occurrence)):list (state*(list occurrence)):=
match l with
|[] => []
|h::t =>  let endState:=Success in let nextState := fun (s : state) => match s with
                               | Inter => state_ 1
                               | state_ n => state_ (S n)
                               | _ => s
                               end
                        in 
                           let fix intern1 (l2: list (list occurrence)) (ss:state) :
                             list (state*(list occurrence)):=
                            match l2 with
                              | nil => nil
                              |[nil] => [(endState,[])]
                              | h2::t2 => 
                                      match t2 with 
                                     |nil => [(ss,h2)]
                                     |_ => [(ss,h2)]++(intern1 t2 (nextState ss))
                                     end
                              end
                            in intern1 t (state_ 1)
  end  
in intern0 (getSubLists l')).




Definition existCombTrans (occurF:nat-> nat-> list transition) (x:nat) (y:nat) (a b : state*(list occurrence)): list transition :=
match a , b with
|(x1,y1) , (Success,y2) => let occu := minusList (beq_occurrence) (y1) (y2) 
                      in match occu with
                      |[Exactly_one e1] =>  if beq_nat (length y1) (S(length y2))
                              then [(x1,(lab [|clock>= x|] e1 ReInit),Success)] else nil
                      |[One_or_more e1] => if beq_nat (length y1) (S(length y2))
                              then [(x1,(lab [|clock>= x|] e1 ReInit),Success);(Success,(lab [|clock>= x|] e1 ReInit),Success)] else nil
                      | _ => nil
                         end
|(x1,y1) , (x2,y2) => let occu := minusList (beq_occurrence) (y1) (y2) 
                      in match occu with
                      |[Exactly_one e1] =>  if beq_nat (length y1) (S(length y2))
                              then [(x1,(//e1/),x2);(x2,(lab [|clock< y|] NoEvent ReInit),Reject)] else nil
                      |[One_or_more e1] => if beq_nat (length y1) (S(length y2))
                              then [(x1,(//e1/),x2);(x2,(//e1/),x2);(x2,(lab [|clock< y|] NoEvent ReInit),Reject)] else nil
                      | _ => nil
                         end

end.


Definition All_combined_existence (l:list occurrence) (occurF:nat-> nat-> list transition) (x:nat) (y:nat):list transition:=
[(Init, (///clock:=-1),Inter)]++(let fix intern (l':list (state*(list occurrence))):list transition :=
match l' with
  |  [] => []
  |  h::t =>  
       (let rest := intern t
       in (flat_map (existCombTrans occurF x y h) t ) ++ rest)
  end
in intern (stateAndListExistence l)).


(*==============================================================================*)














Fixpoint property_existence (arity_type:occurrence_expression) (occur:nat->nat->list transition) (x: nat) (y: nat): list transition :=
match arity_type with
|an lo => clearDoublons beq_trans ([(trans Init (///clock:=-1) Inter)]++(An_existence lo occur x y) ++(occur x y))
|all_ordered lo => clearDoublons beq_trans ([(trans Init (///clock:=-1) Inter)]++(All_ordered_existence 1 lo occur x y)++(occur x y))
|all_combined lo => clearDoublons beq_trans ((All_combined_existence lo occur x y)++(occur x y))
end.





Fixpoint An_pre (lo:list occurrence) : list transition :=
match lo with
|nil => nil
|(Exactly_one ev)::l' => (Init,(//ev/),Inter)::(Inter, (lab NoCond ev  ReInit),Reject)::An_pre(l')
|(One_or_more ev)::l' => (Init,(//ev/),Inter)::(Inter,(//ev/),Inter)::An_pre(l')
end.

Fixpoint An_post (lo:list occurrence) : list transition :=
match lo with
|nil => nil
|x::l' => (Inter,(//getEvtOfOccu(x)/),Init)::An_post(l')
end.

Definition All_ordered_pre (num: nat) (l : list occurrence) : list transition :=
  let nextState := fun (s : state) => match s with
                               | Init => state_ num
                               | state_ n => state_ (S n)
                               | _ => s
                               end
  in let endState := Inter
  in let fix intern (s : state) (l : list occurrence) : list transition :=
               match l with
               | [] => []
               | o::[] => match o with 
                         |(Exactly_one ev) => [(s, (//getEvtOfOccu o/), endState)]
                         |(One_or_more ev) => [(s, (//getEvtOfOccu o/), endState);(endState, (//getEvtOfOccu o/), endState)]
                         end
               | (Exactly_one ev)::t =>
                   let next := nextState s
                   in (s, (//ev/), next)::(intern next t)
               | (One_or_more ev)::t =>
                   let next := nextState s
                   in (s, (//ev/), next)::(next,(//ev/),next)::(intern next t)
               end
  in intern Init l.


Definition All_ordered_post  (num: nat) (l : list occurrence) : list transition :=
  let nextState := fun (s : state) => match s with
                               | Inter => state_ num
                               | state_ n => state_ (S n)
                               | _ => s
                               end
  in let endState := Init
  in let fix intern (s : state) (l : list occurrence) : list transition :=
               match l with
               | [] => []
               | o::[] => match o with 
                         |(Exactly_one ev) => [(s, (//getEvtOfOccu o/), endState)]
                         |(One_or_more ev) => [(s, (//getEvtOfOccu o/), endState);(endState, (//getEvtOfOccu o/), endState)]
                         end
               | (Exactly_one ev)::t =>
                   let next := nextState s
                   in (s, (//ev/), next)::(intern next t)
               | (One_or_more ev)::t =>
                   let next := nextState s
                   in (s, (//ev/), next)::(next,(//ev/),next)::(intern next t)
               end
  in intern Inter l.


(*===============================All_combined==================================*)

Definition stateAndListPre (l': list occurrence)  :list (state*(list occurrence)):=
(Init,l')::(let fix intern0 (l: list (list occurrence)):list (state*(list occurrence)):=
match l with
|[] => []
|h::t =>  let endState:=Inter in let nextState := fun (s : state) => match s with
                               | Init => state_ 1
                               | state_ n => state_ (S n)
                               | _ => s
                               end
                        in 
                           let fix intern1 (l2: list (list occurrence)) (ss:state) :
                             list (state*(list occurrence)):=
                            match l2 with
                              | nil => nil
                              |[nil] => [(endState,[])]
                              | h2::t2 => 
                                      match t2 with 
                                     |nil => [(ss,h2)]
                                     |_ => [(ss,h2)]++(intern1 t2 (nextState ss))
                                     end
                              end
                            in intern1 t (state_ 1)
  end  
in intern0 (getSubLists l')).

Definition stateAndListPost (num: nat) (l': list occurrence)  :list (state*(list occurrence)):=
(Inter,l')::(let fix intern0 (l: list (list occurrence)):list (state*(list occurrence)):=
match l with
|[] => []
|h::t =>  let endState:=Init in let nextState := fun (s : state) => match s with
                               | Inter => state_ num
                               | state_ n => state_ (S n)
                               | _ => s
                               end
                        in 
                           let fix intern1 (l2: list (list occurrence)) (ss:state) :
                             list (state*(list occurrence)):=
                            match l2 with
                              | nil => nil
                              |[nil] => [(endState,[])]
                              | h2::t2 => [(ss,h2)]++(intern1 t2) (nextState ss)
                              end
                            in intern1 t (state_ num)
  end  
in intern0 (getSubLists l')).

Definition preCombTrans (a b : state*(list occurrence)): list transition :=
match a , b with
|(x1,y1) , (x2,y2) => let occu := minusList (beq_occurrence) (y1) (y2) 
                      in match occu with
                      |[Exactly_one e1] =>  if beq_nat (length y1) (S(length y2))
                              then [(x1,(//e1/),x2)] else nil
                      |[One_or_more e1] => if beq_nat (length y1) (S(length y2))
                              then [(x1,(//e1/),x2);(x2,(//e1/),x2)] else nil
                      | _ => nil
                         end
end.

Definition postCombTrans (a b : state*(list occurrence)): list transition :=
match a , b with
|(x1,y1) , (Init,y2) => let occu := minusList (beq_occurrence) (y1) (y2) 
                      in match occu with
                      |[Exactly_one e1] =>  if beq_nat (length y1) (S(length y2))
                              then [(x1,lab ([|clock>=0|]) (e1) (ReInit),Init)] else nil
                      |[One_or_more e1] => if beq_nat (length y1) (S(length y2))
                              then [(x1,lab ([|clock>=0|]) (e1) (ReInit),Init);(Init,lab ([|clock>=0|]) (e1) (ReInit),Init)] else nil
                      | _ => nil
                         end
|(x1,y1) , (x2,y2) => let occu := minusList(beq_occurrence)(y1) (y2)
                      in match occu with
                      |[Exactly_one e1] => if beq_nat (length y1) (S(length y2)) 
                       then [(x1,(//e1/),x2)] else nil
                      |[One_or_more e1] => if beq_nat (length y1) (S(length y2))
                       then [(x1,(//e1/),x2);(x2,(//e1/),x2)] else nil
                      | _ => nil
                         end
end.

Definition All_combined_pre (l:list occurrence):list transition:=
let fix intern (l':list (state*(list occurrence))):list transition :=
match l' with
  |  [] => []
  |  h::t =>  
       (let rest := intern t
       in (flat_map (preCombTrans h) t) ++ rest)
  end
in intern (stateAndListPre l).

Definition All_combined_post  (num: nat) (l:list occurrence):list transition:=
let fix intern (l:list (state*(list occurrence))):list transition :=
 match l with
  |  [] => []
  |  h::t =>  
       (let rest := intern t
       in (flat_map (postCombTrans h) t) ++ rest)
  end
in intern (stateAndListPost num l).


(*==============================================================================*)



Fixpoint property_response (pre:occurrence_expression) (Imm:immediacy) (tps:list transition) (post:occurrence_expression) (l_ev: list event) (preced:precedency) (ev: event): list transition :=
match pre, post with
|an lo1 ,an lo2 => (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans (An_pre(lo1)++immediately_sem(tps)++An_post(lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans (An_pre(lo1)++eventually_sem(tps)++An_post(lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans (An_pre(lo1)++immediately_sem(tps)++An_post(lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans (An_pre(lo1)++eventually_sem(tps)++An_post(lo2)++Cannot_sem (l_ev) (ev))
                   end)
|all_ordered lo1 ,an lo2 => (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans ((All_ordered_pre 1 lo1)++immediately_sem(tps)++An_post(lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans ((All_ordered_pre 1 lo1)++eventually_sem(tps)++An_post(lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans ((All_ordered_pre 1 lo1)++immediately_sem(tps)++An_post(lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans ((All_ordered_pre 1 lo1)++eventually_sem(tps)++An_post(lo2)++Cannot_sem (l_ev) (ev))
                   end)
|an lo1 ,all_ordered lo2 => (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans (An_pre(lo1)++immediately_sem(tps)++(All_ordered_post 1 lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans (An_pre(lo1)++eventually_sem(tps)++(All_ordered_post 1 lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans (An_pre(lo1)++immediately_sem(tps)++(All_ordered_post 1 lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans (An_pre(lo1)++eventually_sem(tps)++(All_ordered_post 1 lo2)++Cannot_sem (l_ev) (ev))
                   end)
|all_ordered lo1 ,all_ordered lo2 => (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans ((All_ordered_pre 1 lo1)++immediately_sem(tps)++(All_ordered_post (length lo1) lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans ((All_ordered_pre 1 lo1)++eventually_sem(tps)++(All_ordered_post (length lo1) lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans ((All_ordered_pre 1 lo1)++immediately_sem(tps)++(All_ordered_post (length lo1) lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans ((All_ordered_pre 1 lo1)++eventually_sem(tps)++(All_ordered_post (length lo1) lo2)++Cannot_sem (l_ev) (ev))
                   end)
|all_combined lo1 ,an lo2=> (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans ((All_combined_pre lo1)++immediately_sem(tps)++An_post(lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans ((All_combined_pre lo1)++eventually_sem(tps)++An_post(lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans ((All_combined_pre lo1)++immediately_sem(tps)++An_post(lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans ((All_combined_pre lo1)++eventually_sem(tps)++An_post(lo2)++Cannot_sem (l_ev) (ev))
                   end)





|all_combined lo1 ,all_ordered lo2=> (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans ((All_combined_pre lo1)++immediately_sem(tps)++(All_ordered_post (S (length lo1)) lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans ((All_combined_pre lo1)++eventually_sem(tps)++(All_ordered_post (S (length lo1)) lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans ((All_combined_pre lo1)++immediately_sem(tps)++(All_ordered_post (S (length lo1)) lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans ((All_combined_pre lo1)++eventually_sem(tps)++(All_ordered_post (S (length lo1)) lo2)++Cannot_sem (l_ev) (ev))
                   end)

|an lo1 ,all_combined lo2=> (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans (An_pre(lo1)++immediately_sem(tps)++(All_combined_post 1 lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans (An_pre(lo1)++eventually_sem(tps)++(All_combined_post 1 lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans (An_pre(lo1)++immediately_sem(tps)++(All_combined_post 1 lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans (An_pre(lo1)++eventually_sem(tps)++(All_combined_post 1 lo2)++Cannot_sem (l_ev) (ev))
                   end)


|all_ordered lo1 ,all_combined lo2=>  (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans ((All_ordered_pre 1 lo1)++immediately_sem(tps)++(All_combined_post (length lo1) lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans ((All_ordered_pre 1 lo1)++eventually_sem(tps)++(All_combined_post (length lo1) lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans ((All_ordered_pre 1 lo1)++immediately_sem(tps)++(All_combined_post (length lo1) lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans ((All_ordered_pre 1 lo1)++eventually_sem(tps)++(All_combined_post (length lo1) lo2)++Cannot_sem (l_ev) (ev))
                   end)


|all_combined lo1 ,all_combined lo2=>  (match Imm,preced with 
                   |immediately,May_occur =>  clearDoublons beq_trans ((All_combined_pre lo1)++immediately_sem(tps)++(All_combined_post (S(length lo1)) lo2))
                   |eventually,May_occur =>  clearDoublons beq_trans ((All_combined_pre lo1)++eventually_sem(tps)++(All_combined_post (S(length lo1)) lo2))
                   |immediately,Cannot_occur => clearDoublons beq_trans ((All_combined_pre lo1)++immediately_sem(tps)++(All_combined_post (S(length lo1)) lo2)++Cannot_sem (l_ev) (ev))
                   |eventually,Cannot_occur => clearDoublons beq_trans ((All_combined_pre lo1)++eventually_sem(tps)++(All_combined_post (S(length lo1)) lo2)++Cannot_sem (l_ev) (ev))
                   end)
end.



(*============*)
(*= Exemples =*)
(*============*)



(*=====Absence=====*)


Compute property_absence
(an 
    [Exactly_one (e 1)]
) 
occurs_never.

Compute property_absence
(an 
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
occurs_never.

Compute property_absence
(an 
    [One_or_more (e 1)]
) 
occurs_never.

Compute property_absence
(an 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
occurs_never.

Compute property_absence
(all_ordered 
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
occurs_never.

Compute property_absence
(all_ordered 
    [One_or_more (e 1);
     One_or_more (e 2)]
) 
occurs_never.

Compute property_absence (
all_combined 
   [Exactly_one (e 1);
    Exactly_one (e 2)])
occurs_never.

Compute property_absence (
all_combined 
   [One_or_more (e 1);
    One_or_more (e 2)])
occurs_never.


(*=====Existence=====*)




Compute property_existence
(an 
    [Exactly_one (e 1)]
) 
occurs 1 5.

Compute property_existence
(an 
    [Exactly_one (e 1);
     Exactly_one (e 2)]
) 
occurs 1 5.


Compute property_existence
(an 
    [One_or_more (e 1)]
) 
occurs 1 5.

Compute property_existence
(an 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
occurs 1 5.

Compute property_existence
(all_ordered 
    [Exactly_one (e 1);
    Exactly_one (e 2)]
)
occurs 1 5.

Compute property_existence
(all_ordered 
    [One_or_more (e 1);
     One_or_more (e 2)]
) 
occurs 1 5.


Compute property_existence
(all_combined
    [Exactly_one (e 1);
    Exactly_one (e 2)]
)
occurs 1 5.

Compute property_existence
(all_combined 
    [One_or_more (e 1);
     One_or_more (e 2)]
) 
occurs 1 5.







(*=====Response=====*)




Compute property_response 
(an 
    [Exactly_one (e 1)]
) 
immediately (leads_to 0 5) 
(an
    [Exactly_one (e 2)]
) 
[e 2] Cannot_occur (e 1) .



Compute property_response 
(an 
    [One_or_more (e 1)]
) 
immediately (leads_to 0 5) 
(an
    [One_or_more (e 2)]
) 
[e 2] Cannot_occur (e 1) .


Compute property_response 
(an 
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(an
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .



Compute property_response 
(an 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(an
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_combined 
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(an
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_combined 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(an
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_ordered
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(an
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_ordered 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(an
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .



Compute property_response 
(an
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(all_combined
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(an 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(all_combined
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(an
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(an 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_combined
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(all_combined
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .

Compute property_response 
(all_combined 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(all_combined
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_ordered
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .

Compute property_response 
(all_ordered 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .


Compute property_response 
(all_combined
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .

Compute property_response 
(all_combined 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .



Compute property_response 
(all_ordered
    [Exactly_one (e 1);
    Exactly_one (e 2)]
) 
immediately (leads_to 0 5) 
(all_combined
    [Exactly_one (e 3);
    Exactly_one (e 4)]
) 
[e 3] Cannot_occur (e 1) .

Compute property_response 
(all_ordered 
    [One_or_more (e 1);
    One_or_more (e 2)]
) 
immediately (leads_to 0 5) 
(all_combined
    [One_or_more (e 3);
    One_or_more (e 4)]
) 
[e 3] Cannot_occur (e 1) .

(*========================================================================*)







Compute property_response 
(an 
    [Exactly_one (e 1);
    One_or_more (e 2);
    Exactly_one (e 3);
    One_or_more (e 4)]
) 
immediately (leads_to 0 5) 
(an
    [Exactly_one (e 5);
    One_or_more (e 6);
    Exactly_one (e 7);
    One_or_more (e 8)]
) 
[e 2] Cannot_occur (e 1) .


Compute property_response 
(all_ordered 
    [Exactly_one (e 1);
    One_or_more (e 2);
    Exactly_one (e 3);
    One_or_more (e 4)]
) 
immediately (leads_to 0 5) 
(an
    [Exactly_one (e 5);
    One_or_more (e 6);
    Exactly_one (e 7);
    One_or_more (e 8)]
) 
[e 2] Cannot_occur (e 1) .

Compute property_response
(an 
    [Exactly_one (e 1);
    One_or_more (e 2);
    Exactly_one (e 3);
    One_or_more (e 4)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [Exactly_one (e 5);
    One_or_more (e 6);
    Exactly_one (e 7);
    One_or_more (e 8)]
) 
[e 2] Cannot_occur (e 1) .

Compute property_response 
(all_ordered
    [Exactly_one (e 1);
    One_or_more (e 2);
    Exactly_one (e 3);
    One_or_more (e 4)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [Exactly_one (e 5);
    One_or_more (e 6);
    Exactly_one (e 7);
    One_or_more (e 8)]
) 
[e 2] Cannot_occur (e 1) .

Compute property_response 
(all_ordered
    [One_or_more (e 1);
     One_or_more (e 2);
     One_or_more (e 3);
     One_or_more (e 4)]
) 
immediately (leads_to 0 5) 
(all_ordered
    [One_or_more (e 5);
    One_or_more (e 6);
    One_or_more (e 7);
    One_or_more (e 8)]
) 
[e 2] Cannot_occur (e 1) .