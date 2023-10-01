% QUESTÃO 1
% =========

temVarinha(hermione).
temVarinha(harry).
temVassoura(harry).
jogadorQuadribol(X) :- temVassoura(X).
bruxo(X) :- temVassoura(X), temVarinha(X).

/* 
1 ?- bruxo(ron).
false.

2 ?- bruxo(hermione).
false.

3 ?- bruxo(harry).
true.

4 ?- bruxo(Y).
Y = harry.
*/

% QUESTÃO 2
% =========

% classe(Numero, positivo) :- Numero > 0.
% classe(0, zero).
% classe(Numero, negativo) :- Numero < 0.

/* classe é uma função que, dado um numero <<Numero>>, 
    nos retorna se <<Numero>> pertence ou não às classes
    'positivo', 'negativo', 'zero'
*/

/* SEM CORTE
[trace] 1 ?- classe(10, X).
   Call: (10) classe(10, _8606) ? creep
   Call: (11) 10>0 ? creep
   Exit: (11) 10>0 ? creep
   Exit: (10) classe(10, positivo) ? creep
X = positivo ;
   Redo: (10) classe(10, _8606) ? creep
   Call: (11) 10<0 ? creep
   Fail: (11) 10<0 ? creep
   Fail: (10) classe(10, _8606) ? creep
false.
 */

% Com corte verde
classe(Numero, positivo) :- Numero > 0, !.
classe(0, zero).
classe(Numero, negativo) :- Numero < 0.

/* 
[trace] 4 ?- classe(10, X).
   Call: (10) classe(10, _212) ? creep
   Call: (11) 10>0 ? creep
   Exit: (11) 10>0 ? creep
   Exit: (10) classe(10, positivo) ? creep
X = positivo.
 */

% QUESTÃO 3
% =========

mulher(ana).
mulher(eva).
mulher(clo).
mulher(bia).
mulher(lia).
mulher(gal).
homem(ivo).
homem(rai).
homem(noe).
homem(gil).
homem(ary).

mae(ana, eva).
mae(eva, noe).
mae(bia, rai).
mae(bia, clo).
mae(bia, ary).
mae(lia, gal).
pai(ivo, eva).
pai(rai, noe).
pai(gil, rai).
pai(gil, clo).
pai(gil, ary).
pai(ary, gal).

gerou(X, Y) :- pai(X, Y). 
gerou(X, Y) :- mae(X, Y).

filho(X, Y) :- homem(X), gerou(Y, X).
filha(X, Y) :- mulher(X), gerou(Y, X).

avoH(X, Y) :- homem(X), gerou(X, Q), gerou(Q, Y).
avoM(X, Y) :- mulher(X), gerou(X, Q), gerou(Q, Y).

% QUESTÃO 4
% =========

trajeto(araraquara, sao_carlos).
trajeto(barretos, franca).
trajeto(bauru, botucatu).
trajeto(botucatu, sorocaba).
trajeto(franca, ribeirao_preto).
trajeto(marilia, bauru).
trajeto(ribeirao_preto, araraquara).
trajeto(sao_carlos, bauru).

viagem_entre(X, Y) :- trajeto(X,Y).
viagem_entre(X, Y) :- trajeto(X, Z), viagem_entre(Z, Y).