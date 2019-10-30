----------------------------- MODULE alice_bob3 -----------------------------

EXTENDS alice_bob0

init ==     aInGarden = FALSE 
        /\  bInGarden = FALSE

next ==     (~aInGarden /\ aInGarden'=TRUE  /\ UNCHANGED bInGarden)
        \/  ( aInGarden /\ aInGarden'=FALSE /\ UNCHANGED bInGarden)
        \/  (~bInGarden /\ bInGarden'=TRUE  /\ UNCHANGED aInGarden)
        \/  ( bInGarden /\ bInGarden'=FALSE /\ UNCHANGED aInGarden)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 17:09:52 CEST 2018 by ciprian
\* Created Thu Oct 11 16:31:10 CEST 2018 by ciprian
