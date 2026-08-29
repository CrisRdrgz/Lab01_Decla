% reglas.pl

:- consult('hechos.pl').

mayor_de_edad(P) :-
    edad(P, E),
    E >= 18.

esta_armado(P) :-
    tiene(P, O),
    arma(O).

zona_sin_enemigos(Z) :-
    zona(Z),
    \+ aparece(_, Z).

amenaza_en(Z, E) :-
    enemigo(E),
    aparece(E, Z).

zona_peligrosa(Z, M) :-
    peligro(Z, N, M),
    nivel_riesgo(N, V),
    V >= 3.

zona_mas_peligrosa(Z1, Z2, M) :-
    peligro(Z1, N1, M),
    peligro(Z2, N2, M),
    nivel_riesgo(N1, V1),
    nivel_riesgo(N2, V2),
    V1 > V2.

zona_accesible(P, Z) :-
    personaje(P),
    zona(Z),
    (   \+ requiere_llave(Z)
    ;   tiene(P, llave)
    ).

zona_transitable(P, Z, M) :-
    momento(M),
    zona_accesible(P, Z),
    once((   \+ zona_peligrosa(Z, M)
         ;   esta_armado(P)
         )).

puede_recolectar(P, Mat, M) :-
    material(Mat),
    se_encuentra(Mat, Z),
    zona_transitable(P, Z, M).

aliado_disponible(A) :-
    aliado(A),
    \+ capturado(A).

requiere_rescate(P) :-
    aliado(P),
    capturado(P).

ayudante_constructor(P, A) :-
    aliado_disponible(A),
    A \== P,
    obedece_ordenes(A),
    habilidad(A, construir),
    habilidad(A, cargar_troncos).

puede_construir_refugio(P) :-
    necesita(P, refugio),
    tiene(P, hacha),
    (   habilidad(P, construir)
    ;   ayudante_constructor(P, _)
    ).

refugio_seguro(Z) :-
    zona_sin_enemigos(Z),
    \+ zona_peligrosa(Z, _).

momento_recomendado(Z, M) :-
    zona(Z),
    momento(M),
    \+ zona_peligrosa(Z, M).

puede_comunicarse(P) :-
    personaje(P),
    \+ no_habla(P).

posible_aliado(P) :-
    (   aliado(P)
    ;   puede_volverse_aliado(P)
    ).
