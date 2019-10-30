----------------------------- MODULE alice_bob4 -----------------------------

EXTENDS alice_bob0

VARIABLES flagA, flagB

init ==    aInGarden = FALSE
        /\ bInGarden = FALSE
        /\ flagA = FALSE
        /\ flagB = FALSE
        
next ==    (flagA /\ (     (aInGarden /\ aInGarden'=FALSE /\ flagA'=FALSE /\ UNCHANGED <<flagB, bInGarden>>) 
                        \/ (~aInGarden /\ ~flagB /\ aInGarden'=TRUE /\ UNCHANGED <<flagA, flagB, bInGarden>>)))
         \/(flagB /\ (     (bInGarden /\ bInGarden'=FALSE /\ flagB'=FALSE /\ UNCHANGED <<flagA, aInGarden>>) 
                        \/ (~bInGarden /\ ~flagA /\ bInGarden'=TRUE /\ UNCHANGED <<flagA, flagB, aInGarden>>)))
         \/(~flagA /\ flagA'=TRUE /\ UNCHANGED <<flagB, aInGarden, bInGarden>>)
         \/(~flagB /\ flagB'=TRUE /\ UNCHANGED <<flagA, aInGarden, bInGarden>>)
       

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 19:47:58 CEST 2018 by ciprian
\* Created Thu Oct 11 17:11:06 CEST 2018 by ciprian
