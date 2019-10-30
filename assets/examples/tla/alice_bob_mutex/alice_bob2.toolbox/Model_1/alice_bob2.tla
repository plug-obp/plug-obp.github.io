----------------------------- MODULE alice_bob2 -----------------------------

EXTENDS alice_bob1

(* Alice can decide to move or not to move. Bob can decide to move or not to move*)
next1 ==     ([aInGarden' = ~ aInGarden]_<<aInGarden>> /\ UNCHANGED bInGarden)
         \/  ([bInGarden' = ~ bInGarden]_<<bInGarden>> /\ UNCHANGED aInGarden)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 16:32:10 CEST 2018 by ciprian
\* Created Thu Oct 11 16:17:32 CEST 2018 by ciprian
