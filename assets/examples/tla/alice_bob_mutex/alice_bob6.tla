----------------------------- MODULE alice_bob6 -----------------------------

EXTENDS alice_bob4

VARIABLE triedBefore

init1 == init /\ triedBefore = FALSE

next1 == next
        \/ (flagB /\ flagA /\ ~bInGarden /\ triedBefore' = TRUE /\ flagB' = FALSE /\ UNCHANGED <<flagA, aInGarden, bInGarden>>)    \* bob notes that he already tried to get in
        \/ (triedBefore /\ ~flagA /\ triedBefore' = FALSE /\flagB' = TRUE /\ bInGarden' = TRUE /\ UNCHANGED <<flagA, aInGarden>>)  \* as soon as bob sees the alice flag down he gets in the garden

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 20:57:43 CEST 2018 by ciprian
\* Created Thu Oct 11 20:49:53 CEST 2018 by ciprian
