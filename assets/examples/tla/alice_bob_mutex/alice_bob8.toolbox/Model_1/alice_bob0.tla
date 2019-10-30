----------------------------- MODULE alice_bob0 -----------------------------

VARIABLES aInGarden, bInGarden

TypeOK ==   aInGarden \in BOOLEAN
         /\ bInGarden \in BOOLEAN
         
mutex == ~(aInGarden /\ bInGarden)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 21:16:44 CEST 2018 by ciprian
\* Created Thu Oct 11 15:43:48 CEST 2018 by ciprian
