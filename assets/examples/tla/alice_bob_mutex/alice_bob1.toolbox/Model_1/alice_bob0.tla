----------------------------- MODULE alice_bob0 -----------------------------

VARIABLES aCS, bCS

init ==     aCS = FALSE
        /\  bCS = FALSE

next ==     (aCS' = ~ aCS /\ UNCHANGED bCS)
        \/  (bCS' = ~ bCS /\ UNCHANGED aCS)

mutex == ~(aCS /\ bCS)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 16:03:59 CEST 2018 by ciprian
\* Created Thu Oct 11 15:43:48 CEST 2018 by ciprian
