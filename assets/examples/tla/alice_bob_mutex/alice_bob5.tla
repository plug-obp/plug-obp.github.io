----------------------------- MODULE alice_bob5 -----------------------------

EXTENDS alice_bob4

next1 ==   next
        \/ (flagB /\ flagA /\ ~bInGarden /\ flagB' = FALSE /\ UNCHANGED <<flagA, aInGarden, bInGarden>>)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 20:55:43 CEST 2018 by ciprian
\* Created Thu Oct 11 20:42:02 CEST 2018 by ciprian
