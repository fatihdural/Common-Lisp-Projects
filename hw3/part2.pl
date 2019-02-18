%possible flights
flight(edirne,erzurum,5).
flight(erzurum,edirne,5).
flight(erzurum,antalya,2).
flight(antalya,erzurum,2).		
flight(antalya,diyarbakir,5).
flight(diyarbakir,antalya,5).
flight(antalya,izmir,1).
flight(izmir,antalya,1).
flight(izmir,ankara,6).
flight(ankara,izmir,6).
flight(diyarbakir,ankara,8).
flight(ankara,diyarbakir,8).
flight(izmir,istanbul,3).
flight(istanbul,izmir,3).
flight(istanbul,ankara,2).
flight(ankara,istanbul,2).
flight(ankara,izmir,6).
flight(izmir,ankara,6).
flight(istanbul,trabzon,3).
flight(trabzon,istanbul , 3).
flight(ankara,trabzon,6).
flight(trabzon,ankara,6).
flight(ankara,kars,3).
flight(kars,ankara,3).
flight(gaziantep,kars,3).
flight(kars,gaziantep,3).

route(X,Y,C) :- flight(X,Y,C).    		% control the flights.
route(X,Y,C) :- flightbranch(X,Y,C,[]). 	% kept in a list that holds the eges.

flightbranch(X,Y,C,_) :- 
    flight(X,Y,C).
flightbranch(X,Y,C,T) :- 
    \+ member(X,T), 
    flight(X,D,A),			% control the flights and calling function.
    flightbranch(D,Y,B,[X|T]), 
    X\=Y, 
    C is A+B.