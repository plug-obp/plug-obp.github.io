----------------------------- MODULE alice_bob1 -----------------------------
EXTENDS alice_bob0

init1 == init

aEnterCS == aCS' = TRUE  /\ UNCHANGED bCS
aExitCS  == aCS' = FALSE /\ UNCHANGED bCS
bEnterCS == bCS' = TRUE  /\ UNCHANGED aCS
bExitCS  == bCS' = FALSE /\ UNCHANGED aCS

next1 ==    (~aCS /\ aEnterCS)
        \/  (aCS  /\ aExitCS)
        \/  (~bCS /\ bEnterCS)
        \/  (bCS  /\ bExitCS)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 16:08:20 CEST 2018 by ciprian
\* Created Thu Oct 11 15:59:50 CEST 2018 by ciprian
