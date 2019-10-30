----------------------------- MODULE alice_bob8 -----------------------------

EXTENDS alice_bob0

VARIABLES flagA, flagB, turn

init ==    aInGarden    = FALSE
        /\ bInGarden    = FALSE
        /\ flagA        = FALSE
        /\ flagB        = FALSE
        /\ turn         = "Alice"
        
TypeOK1 ==      TypeOK
            /\  flagA \in BOOLEAN
            /\  flagB \in BOOLEAN
            /\  turn \in {"Alice", "Bob"}
            
aliceGetsOut    == flagA /\ aInGarden /\ flagA'=FALSE /\ aInGarden'=FALSE /\ UNCHANGED <<bInGarden, flagB, turn>>
bobGetsOut      == flagB /\ bInGarden /\ flagB'=FALSE /\ bInGarden'=FALSE /\ UNCHANGED <<aInGarden, flagA, turn>>
aliceGetsIn     == flagA /\ ~aInGarden /\ (turn="Alice" \/ flagB = FALSE) /\ aInGarden'=TRUE /\ UNCHANGED <<bInGarden, flagA, flagB, turn>>
bobGetsIn       == flagB /\ ~bInGarden /\ (turn="Bob" \/ flagA = FALSE) /\ bInGarden'=TRUE /\ UNCHANGED <<aInGarden, flagA, flagB, turn>> 
aliceWantsIn    == ~flagA /\ flagA'=TRUE /\ turn'="Bob" /\ UNCHANGED <<aInGarden, bInGarden, flagB>>
bobWantsIn      == ~flagB /\ flagB'=TRUE /\ turn'="Alice" /\ UNCHANGED <<aInGarden, bInGarden, flagA>>
        
next ==     aliceGetsOut
        \/  bobGetsOut
        \/  aliceGetsIn
        \/  bobGetsIn
        \/  aliceWantsIn
        \/  bobWantsIn

=============================================================================
\* Modification History
\* Last modified Fri Oct 12 16:00:20 CEST 2018 by ciprian
\* Created Fri Oct 12 15:59:50 CEST 2018 by ciprian
