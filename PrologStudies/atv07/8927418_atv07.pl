% Nome: Jorge Augusto Salgado Salhani
% NUSP: 8927418

/* Atividade 07 - IA

Escolher 7 exercícios da seção 4 da apostila de processamento de listas e 
postar o arquivo com os códigos prolog e em comentário como interrogar

*/

/* ================================================================== */
/* Ex. 4.9 - Retirar todas as ocorrências de um elemento de uma lista */
/* 
remover_elementos(<arg-1>, <arg-2>, <arg-3>)
<arg-1> : elemento a remover
<arg-2> : lista
<arg-3> : lista resultante 
*/
remover_elementos(X, [X|Cauda], L) :- remover_elementos(X, Cauda, L).
remover_elementos(X, [Y|Cauda], [Y|Cauda1]) :- X \== Y, remover_elementos(X, Cauda, Cauda1).

/* PERGUNTAS
3 ?- remover_elementos(2, [1,2,abobora,lentilha,melancia,3,4,20,3,2,casa,lentilha,abobora], L).   
L = [1, abobora, lentilha, melancia, 3, 4, 20, 3, casa|...] .

4 ?- remover_elementos(abobora, [1,2,abobora,lentilha,melancia,3,4,20,3,2,casa,lentilha,abobora], L). 
L = [1, 2, lentilha, melancia, 3, 4, 20, 3, 2|...] .

5 ?- remover_elementos(melancia, [1,2,abobora,lentilha,melancia,3,4,20,3,2,casa,lentilha,abobora], L). 
L = [1, 2, abobora, lentilha, 3, 4, 20, 3, 2|...] .

6 ?- remover_elementos(lentilha, [1,2,abobora,lentilha,melancia,3,4,20,3,2,casa,lentilha,abobora], L). 
L = [1, 2, abobora, melancia, 3, 4, 20, 3, 2|...] .

7 ?- remover_elementos(lentilha, [1,2,abobora,lentilha,melancia,casa,lentilha,abobora], L).            
L = [1, 2, abobora, melancia, casa, abobora] .

8 ?- remover_elementos(feijao, [1,2,abobora,lentilha,melancia,casa,lentilha,abobora], L).   
L = [1, 2, abobora, lentilha, melancia, casa, lentilha, abobora] .
 */

/* =============================================== */
/* Ex. 4.12  Substituir um elemento de uma lista por um outro elemento */
/* 
substituir(<arg-1>, <arg-2>, <arg-3>, <arg-4>)
<arg-1> : novo elemento
<arg-2> : elemento a substituir
<arg-3> : lista original
<arg-4> : lista resultante
*/
substituir(_, _, [], []).
substituir(X, Y, [X|Cauda1], [Y|Cauda2]) :- substituir(X, Y, Cauda1, Cauda2).
substituir(X, Y, [Z|Cauda1], [Z|Cauda2]) :- X \== Z, substituir(X, Y, Cauda1, Cauda2).
/* 
1 ?- substituir(10, 0, [10,2,0,10,2,1,1,10], L). 
L = [0, 2, 0, 0, 2, 1, 1, 0] .

2 ?- substituir(X, 0, [10,2,0,10,2,1,1,10], L).  
X = 10,
L = [0, 2, 0, 0, 2, 1, 1, 0] ;
X = 2,
L = [10, 0, 0, 10, 0, 1, 1, 10] ;
X = 0,
L = [10, 2, 0, 10, 2, 1, 1, 10] ;
X = 10,
L = [10, 2, 0, 0, 2, 1, 1, 0] ;
X = 2,
L = [10, 2, 0, 10, 0, 1, 1, 10] ;
X = 1,
L = [10, 2, 0, 10, 2, 0, 0, 10] .
 */


/* Ex. 4.14 - Permutar os elementos de uma lista */
/* 
permutacao(<arg-1>, <arg-2>)
<arg-1> : lista
<arg-2> : permutacao dos elementos
 */
permutacao([], []).
permutacao([X], [X]) :-!.
permutacao([X|Cauda], L) :- permutacao(Cauda,L1), adicionar_lista(L2,L3,L1),
                            adicionar_lista(L2, [X], X1), adicionar_lista(X1, L3, L).

adicionar_lista(X, [], X).
adicionar_lista(X, [Y|Cauda], [Y|L]) :- adicionar_lista(X, Cauda, L).

/* 
1 ?- permutacao([a,b,c], L).
L = [a, b, c] ;
L = [b, a, c] ;
L = [b, c, a] ;
L = [a, c, b] ;
L = [c, a, b] ;
L = [c, b, a] ;
false.

2 ?- permutacao([a,b,c,d], L). 
L = [a, b, c, d] ;
L = [b, a, c, d] ;
L = [b, c, a, d] ;
L = [b, c, d, a] ;
L = [a, c, b, d] ;
L = [c, a, b, d] ;
L = [c, b, a, d] ;
L = [c, b, d, a] ;
L = [a, c, d, b] ;
L = [c, a, d, b] ;
L = [c, d, a, b] ;
L = [c, d, b, a] ;
L = [a, b, d, c] ;
L = [b, a, d, c] ;
L = [b, d, a, c] ;
L = [b, d, c, a] ;
L = [a, d, b, c] ;
L = [d, a, b, c] ;
L = [d, b, a, c] ;
L = [d, b, c, a] ;
L = [a, d, c, b] ;
L = [d, a, c, b] ;
L = [d, c, a, b] ;
L = [d, c, b, a] ;
false.
 */


/* Ex. 4.15 - Concatenar duas listas */
/* 
concatenar(<arg-1>, <arg-2>, <arg-3>) 
<arg-1> : lista 1
<arg-2> : lista 2
<arg-3> : lista concatenada resultante
*/
concatenar([], L2, L2).
concatenar([H|T1], L2, [H|T2]) :- concatenar(T1, L2, T2).

/* 
1 ?- concatenar([a,b,c], [x], L).
L = [a, b, c, x].

2 ?- concatenar([a,b,c], X, L).   
L = [a, b, c|X].

3 ?- concatenar(X, [a,b], L).   
X = [],
L = [a, b] ;
X = [_A],
L = [_A, a, b] ;
X = [_A, _B],
L = [_A, _B, a, b] ;
X = [_A, _B, _C],
L = [_A, _B, _C, a, b] ;
X = [_A, _B, _C, _D],
L = [_A, _B, _C, _D, a, b] ;
X = [_A, _B, _C, _D, _E],
L = [_A, _B, _C, _D, _E, a, b] ;
X = [_A, _B, _C, _D, _E, _F],
L = [_A, _B, _C, _D, _E, _F, a, b] .
 */


/* Ex. 4.19 - Dividir uma lista numérica em duas sublistas que contenham
              os elementos menores ou iguais e maiores que um dado elemento */
/* 
dividir(<arg-1>, <arg-2>, <arg-3>, <arg-4>) 
<arg-1> : numero de comparação
<arg-2> : lista original
<arg-3> : lista com elementos <= <arg-1>
<arg-4> : lista com elementos > <arg-1>
*/
dividir(_, [], [], []).
dividir(X, [H|T], [H|T2], T3) :- H =< X, dividir(X, T, T2, T3).
dividir(X, [H|T], T2, [H|T3]) :- H > X, dividir(X, T, T2, T3).

/* 
1 ?- dividir(3, [1,2,3,4,5,6], Maiores, Menores).
Maiores = [1, 2, 3],
Menores = [4, 5, 6] ;
false.

2 ?- dividir(1, [1,2,3,4,5,6], Maiores, Menores). 
Maiores = [1],
Menores = [2, 3, 4, 5, 6] ;
false.

3 ?- dividir(1, [1,2,20,4,7,6], Maiores, Menores). 
Maiores = [1],
Menores = [2, 20, 4, 7, 6] ;
false.

4 ?- dividir(4, [1,2,20,4,7,6], Maiores, Menores). 
Maiores = [1, 2, 4],
Menores = [20, 7, 6] ;
false.
 */


/* Ex. 4.22 - Elementos de uma lista que possuem uma dada propriedade P */
/* 
map(<arg-1>, <arg-2>, <arg-3>)
<arg-1> : propriedade P
<arg-2> : lista original
<arg-3> : lista resultante
 */
map(_, [], []).
map(P, [A|B], [C|D]) :- Q=.. [P,A,C], call(Q), map(P,B,D).

maior(X,Y) :- X > Y.

/* 
1 ?- map(maior, [1,2,3,4], [5,1,2,3]).
false.

2 ?- map(maior, [1,2,3,4], [-1,0,3,1]). 
false.

3 ?- map(maior, [1,2,3,4], [-1,0,-3,-1]). 
true ;
false.
 */


/* Ex. 4.23 - Imprimir uma lista com deslocamento */
/* 
imprimir(<arg-1>, <arg-2>)
<arg-1> : lista original
<arg-2> : deslocamento
 */
imprimir([H|T], I) :- J is I+3,
                      imprimir(H, J), imprx(T,J).
imprimir(X,I) :- tab(I), write(X), nl.
imprx([], _).
imprx([X|T], I) :- imprimir(X, I), imprx(T, I).

/* 
1 ?- imprimir([a,b,c,[d,e,f],g,h,i], 2).
     a
     b
     c
        d
        e
        f
     g
     h
     i
true .

2 ?- imprimir([a,b,[1,[i,ii,iii],2,3],c,d,e,[f,g,h]], 2). 
     a
     b
        1
           i
           ii
           iii
        2
        3
     c
     d
     e
        f
        g
        h
true .

 */
