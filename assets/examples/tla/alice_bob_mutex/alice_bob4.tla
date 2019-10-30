----------------------------- MODULE alice_bob4 -----------------------------

EXTENDS alice_bob0

(* Add two flags to announce the intension of going in the garden*)
VARIABLES flagA, flagB

init ==    aInGarden = FALSE
        /\ bInGarden = FALSE
        /\ flagA = FALSE
        /\ flagB = FALSE
        
next ==    (flagA /\ (     (aInGarden /\ aInGarden'=FALSE /\ flagA'=FALSE /\ UNCHANGED <<flagB, bInGarden>>)   \*if in garden get inside 
                        \/ (~aInGarden /\ ~flagB /\ aInGarden'=TRUE /\ UNCHANGED <<flagA, flagB, bInGarden>>)))\*if not in garden go in
         \/(flagB /\ (     (bInGarden /\ bInGarden'=FALSE /\ flagB'=FALSE /\ UNCHANGED <<flagA, aInGarden>>)    \*if in garden get inside
                        \/ (~bInGarden /\ ~flagA /\ bInGarden'=TRUE /\ UNCHANGED <<flagA, flagB, aInGarden>>))) \*in not in garden go in
         \/(~flagA /\ flagA'=TRUE /\ UNCHANGED <<flagB, aInGarden, bInGarden>>)                                 \*anounce intention to go in the garden
         \/(~flagB /\ flagB'=TRUE /\ UNCHANGED <<flagA, aInGarden, bInGarden>>)                                 \*anounce intention to go in the garden
       

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 20:37:26 CEST 2018 by ciprian
\* Created Thu Oct 11 17:11:06 CEST 2018 by ciprian
