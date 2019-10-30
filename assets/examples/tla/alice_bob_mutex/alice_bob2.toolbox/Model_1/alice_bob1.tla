----------------------------- MODULE alice_bob1 -----------------------------

EXTENDS alice_bob0

(* Neither Alice nor Bob in the critical section at beginning *)
init ==     aInGarden = FALSE
        /\  bInGarden = FALSE

(* At each step either Alice or Bob has to move*)
next ==     (aInGarden' = ~ aInGarden /\ UNCHANGED bInGarden)
        \/  (bInGarden' = ~ bInGarden /\ UNCHANGED aInGarden)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 16:33:47 CEST 2018 by ciprian
\* Created Thu Oct 11 15:59:50 CEST 2018 by ciprian
