----------------------------- MODULE alice_bob0 -----------------------------

VARIABLES aInGarden, bInGarden

(* Neither Alice nor Bob in the critical section at beginning *)
init ==     aInGarden = FALSE
        /\  bInGarden = FALSE



next ==     (aInGarden' = ~ aInGarden /\ UNCHANGED bInGarden)
        \/  (bInGarden' = ~ bInGarden /\ UNCHANGED aInGarden)

mutex == ~(aInGarden /\ bInGarden)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 16:19:50 CEST 2018 by ciprian
\* Created Thu Oct 11 15:43:48 CEST 2018 by ciprian
