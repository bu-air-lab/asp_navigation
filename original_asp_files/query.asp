
at(r1_m11, 0). 
located(O, r1_corr_m, 0) :- object(O). 
-loaded(O, 0) :- object(O). 

%located(s0, r1_corr_m, 0). 
%-loaded(s0,0). 

%loaded(O, 0) :- ball(O). 
%loaded(O, 0) :- square(O). 
%:- not at(r1_corr_watson, n-1). 

:- not located(b0, r1_m11, n-1). 
:- not located(s0, r1_m11, n-1). 
%:- not loaded(s0, n-1). 

#show approach/2.
#show gothrough/2.
#show opendoor/2.
#show load/2.
#show unload/2.
