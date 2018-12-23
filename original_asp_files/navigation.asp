
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Actions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


facing(D,I+1) :- approach(D,I), door(D), I=0..n-2.
beside(D,I+1) :- approach(D,I), door(D), I=0..n-2.
at(R2,I+1) :- approach(D,I), at(R1,I), hasdoor(R2,D), acc(R1,R2), I=0..n-2.
:- approach(D,I), facing(D,I), door(D), I=0..n-1.
:- approach(D,I), door(D), at(L1,I), dooracc(L3,D,L2), not acc(L1,L3), not acc(L1,L2), I=0..n-1.


at(R2,I+1) :- gothrough(D,I),  at(R1,I), dooracc(R1,D,R2), I=0..n-2.
-facing(D,I+1) :- gothrough(D,I), I=0..n-2.
-open(D,I+1) :- gothrough(D,I), I=0..n-2.
:- gothrough(D,I), not facing(D,I), door(D), I=0..n-1.
:- gothrough(D,I), not open(D,I), door(D), I=0..n-1.
:- gothrough(D,I), at(R,I), not hasdoor(R,D), door(D), room(R), I=0..n-1.


open(D,I+1) :- opendoor(D,I), door(D), I=0..n-2.
:- opendoor(D,I), not facing(D,I), door(D), I=0..n-1.
:- opendoor(D,I), open(D,I), door(D), I=0..n-1.


located(O,R,I+1) :- unload(O,I), object(O), at(R,I), I=0..n-2.
-loaded(O,I+1) :- unload(O,I), object(O), at(R,I), I=0..n-2.
:- unload(O,I), not loaded(O,I), object(O), I=0..n-1.


loaded(O,I+1) :- load(O,I), object(O), at(R,I), I=0..n-2.
-located(O,R,I+1) :- load(O,I), object(O), at(R,I), I=0..n-2.
-facing(D,I+1) :- load(O,I), object(O), door(D), I=0..n-2.
:- load(O,I), loaded(O1,I), object(O), object(O1), I=0..n-1.
:- load(O,I), located(O,R1,I), at(R2,I), R1!=R2, I=0..n-1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Static laws
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%you can't be at two places at the some time
-at(L2,I):- at(L1,I), location(L2), L1 != L2, I=0..n-1.

%you can be facing only one door at a time
-facing(D2,I):- facing(D1,I), door(D2), D1 != D2, I=0..n-1.

%you can only be beside a door at any given time (if you delete this, 
%the observations must also return -beside which doesn't happen at the moment.
-beside(D2,I):- beside(D1,I), door(D2), D1 != D2, I=0..n-1.

-located(O,R1,I) :- located(O,R2,I), room(R1), room(R2), R1 != R2, I=0..n-1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Inertia
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%at is inertial
at(L,I+1) :- at(L,I), not -at(L,I+1), I=0..n-2.

%facing is inertial
facing(D,I+1) :- facing(D,I), not -facing(D,I+1), I=0..n-2.
-facing(D,I+1) :- -facing(D,I), not facing(D,I+1), I=0..n-2.

% open is inertial
open(D,I+1) :- open(D,I), not -open(D,I+1), I=0..n-2.
-open(D,I+1) :- -open(D,I), not open(D,I+1), I=0..n-2.

% beside is inertial
beside(D,I+1) :- beside(D,I), not -beside(D,I+1), I=0..n-2.
-beside(D,I+1) :- -beside(D,I), not beside(D,I+1), I=0..n-2.

% located is inertial
located(O,R,I+1) :- located(O,R,I), not -located(O,R,I+1), I=0..n-2.
-located(O,R,I+1) :- -located(O,R,I), not located(O,R,I+1), I=0..n-2.

loaded(O,I+1) :- loaded(O,I), not -loaded(O,I+1), I=0..n-2.
-loaded(O,I+1) :- -loaded(O,I), not loaded(O,I+1), I=0..n-2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Initial
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%-loaded(O,0) :- object(O).


%hide fluents implied by others
%#hide -at/2.
%#hide -facing/2.
%#hide -beside/2.



