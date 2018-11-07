
% DO NOT use room(a ; b). Computation takes forever.
% naming r1 for room on level 1. room number is after underscore
room(r1_m11).
room(r1_corr_m).
room(r1_corr_watson).
room(r1_corr_g).
room(r1_corr_h).
room(r1_corr_j).

% naming e1 for elevator on level 1. then room where elevator is
elevator(e1_corr_watson).

% naming d1 for door on level 1. room where this door can be found after underscore
door(d1_m11).
door(d1_corr_m_corr_watson).
door(d1_watson_office).
door(d1_corr_main_exit).
door(d1_g_labs).
door(d1_g25).
door(d1_200p).
door(d1_200q).
door(d1_l_section).
door(d1_h5).
door(d1_h9).
door(d1_downstairs).
door(d1_h11).
door(d1_upstairs).
door(d1_200f).
door(d1_j23).
door(d1_j21).
door(d1_ebk1).
door(d1_j19).
door(d1_j15).
door(d1_k_section).
door(d1_fire_exit).
door(d1_200b).
door(d1_restroom_m).
door(d1_restroom_f).
door(d1_203_janitor).



hasdoor(r1_m11, d1_m11).
hasdoor(r1_corr_m, d1_m11).
hasdoor(r1_corr_m, d1_corr_m_corr_watson).
hasdoor(r1_corr_watson,d1_corr_m_corr_watson).
hasdoor(r1_corr_watson,d1_watson_office).
hasdoor(r1_corr_watson,d1_corr_main_exit).
hasdoor(r1_corr_g,d1_g_labs).
hasdoor(r1_corr_g,d1_g25).
hasdoor(r1_corr_g,d1_200p).
hasdoor(r1_corr_g,d1_200q).
hasdoor(r1_corr_h,d1_l_section).
hasdoor(r1_corr_h,d1_h5).
hasdoor(r1_corr_h,d1_h9).
hasdoor(r1_corr_h,d1_downstairs).
hasdoor(r1_corr_j,d1_h11).
hasdoor(r1_corr_j,d1_upstairs).
hasdoor(r1_corr_j,d1_200f).
hasdoor(r1_corr_j,d1_j23).
hasdoor(r1_corr_j,d1_j21).
hasdoor(r1_corr_j,d1_ebk1).
hasdoor(r1_corr_j,d1_j19).
hasdoor(r1_corr_j,d1_j15).
hasdoor(r1_corr_j,d1_k_section).
hasdoor(r1_corr_j,d1_fire_exit).
hasdoor(r1_corr_j,d1_200b).
hasdoor(r1_corr_j,d1_restroom_m).
hasdoor(r1_corr_j,d1_restroom_f).
hasdoor(r1_corr_j,d1_203_janitor).


acc(r1_corr_watson, r1_corr_g).
acc(r1_corr_g, r1_corr_h).
acc(r1_corr_h, r1_corr_j).


% UNDER THIS IS OLD WILL DELETE

%what is this saying?
location(R) :- room(R).


dooracc(R1,D,R2) :- hasdoor(R1,D), hasdoor(R2,D), R1 != R2, door(D), room(R1),
location(R2).
dooracc(R1,D,R2) :- dooracc(R2,D,R1).

acc(L1,L1) :- location(L1).
acc(L1,L2) :- acc(L2,L1), location(L1), location(L2). 
acc(L1,L2) :- acc(L1,L3), acc(L2,L3), location(L1), location(L2), location(L3).



