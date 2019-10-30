----------------------------- MODULE alice_bob0 -----------------------------

VARIABLES aInGarden, bInGarden

mutex == ~(aInGarden /\ bInGarden)

=============================================================================
\* Modification History
\* Last modified Thu Oct 11 16:33:13 CEST 2018 by ciprian
\* Created Thu Oct 11 15:43:48 CEST 2018 by ciprian
