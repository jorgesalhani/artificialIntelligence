/* 
Nome: Jorge Augusto Salgado Salhani
NoUSP: 8927418 
*/

/* Verificar se elemento pertence a uma lista */
pertence(Elemento, [Elemento|_]).
pertence(Elemento, [_|Cauda]) :- pertence(Elemento, Cauda).

/* Verificar se elementos são consecutivos */
consecutivos(X1, X2, [X1,X2|_]).
consecutivos(X1, X2, [_|Cauda]) :- consecutivos(X1, X2, Cauda).

/* Soma de elementos de uma lista numérica */
soma_elementos([], 0).
soma_elementos([X|Cauda], S) :- soma_elementos(Cauda, S1), S is S1+X.

/* N-ésimo elemento de uma lista */
n_esimo([X|_], X, 1).
n_esimo([_|Cauda], X, N) :- n_esimo(Cauda, X, M), N is M+1. 

/* Número de elementos em uma lista */
tamanho([], 0).
tamanho([X|Cauda], Tam) :- tamanho(Cauda, Tam1), Tam is Tam1 + 1.