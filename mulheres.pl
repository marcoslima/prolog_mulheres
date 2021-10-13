%% A mulher da toalha Amarela está ao lado da mulher que está bebendo suco de Limão.
%% A Chef está em algum lugar entre a Pilota e a mulher que está bebendo suco de Uva, nessa ordem.
%% A Tradutora está ao lado da mulher que está comendo sanduíche de Atum.
%% A mulher de 30 anos está exatamente à esquerda da mulher que está bebendo suco de Limão.
%% Michele está ao lado da mulher que está usando a toalha Vermelha.
%% A mulher de 35 anos está exatamente à esquerda da mulher de 40 anos.
%% A Chef está exatamente à direita da mulher que está bebendo suco de Laranja.
%% A mulher da toalha Vermelha está em algum lugar entre a mulher de 30 anos e a mulher que está comendo sanduíche de Presunto, nessa ordem.
%% Michele está bebendo suco de Manga.
%% Em uma das pontas está a mulher de 40 anos.
%% A Engenheira está exatamente à esquerda da mulher de 35 anos.
%% A Tradutora está ao lado de Eliana.
%% Quem está comendo sanduíche de carne de Porco está em algum lugar entre a Yasmin e quem está comendo sanduíche de Atum, nessa ordem.
%% A mulher da toalha Roxa está comendo sanduíche de Bacon.
%% Na primeira posição está a mulher que está usando a toalha Verde.
%% A dona da toalha Vermelha está em algum lugar entre a mulher de 30 anos e a dona da toalha Amarela, nessa ordem.
%% Eliana está exatamente à direita da mulher que está bebendo suco de Uva.
%% Lídia está em algum lugar à direita da mulher da toalha Vermelha.
%% A Engenheira tem 45 anos.
%% Em uma das pontas está a mulher que está comendo sanduíche de Presunto.
%% Michele trabalha como Engenheira.

print_mulheres([M|[]]) :- write(M), nl, !.
print_mulheres([M|T]) :- write(M), nl, print_mulheres(T).

ao_lado(A, B, [A, B | _ ]).
ao_lado(A, B, [B, A | _ ]).
ao_lado(A, B, [_|T]) :- ao_lado(A, B, T).

a_direita(A, B, [A, B | _]).
a_direita(A, B, [_ | T]) :- a_direita(A, B, T).
a_direita(A, B, [A | [H|T] ]) :- a_direita(H, B, [H|T]).

exata_direita(A, B, [A, B | _]).
exata_direita(A, B, [_| T]) :- exata_direita(A, B, T).

a_esquerda(A, B, [B, A | _]).
a_esquerda(A, B, [_ | T]) :- a_esquerda(A, B, T).
a_esquerda(A, B, [B | [A1| T] ]) :- a_esquerda(A, A1, [A1| T]).

entre(A, Left, Right, L) :- a_direita(Left, A, L) , a_esquerda(Right, A, L).

eh_primeiro(A, [A | _]).
eh_ultimo(A, [A]).
eh_ultimo(A, [_ | T]) :- eh_ultimo(A, T).
eh_ponta(A, L) :- eh_primeiro(A, L) ; eh_ultimo(A, L).


solve() :-
    Mulheres = [
        %% mulher(nome, idade, prof, toalha, sand, suco),
        mulher(_, _, _, _, _, _),
        mulher(_, _, _, _, _, _),
        mulher(_, _, _, _, _, _),
        mulher(_, _, _, _, _, _),
        mulher(_, _, _, _, _, _)
    ],

    %% A mulher da toalha Amarela está ao lado da mulher que está bebendo suco de Limão.
    ao_lado(mulher(_,_,_,amarela,_,_), mulher(_,_,_,_,_,limao), Mulheres),

    %% A Chef está em algum lugar entre a Pilota e a mulher que está bebendo suco de Uva, nessa ordem.
    entre(mulher(_,_,chef,_,_,_), mulher(_,_,pilota,_,_,_), mulher(_,_,_,_,_,uva), Mulheres),

    %% A Tradutora está ao lado da mulher que está comendo sanduíche de Atum.
    ao_lado(mulher(_,_,tradutora,_,_,_), mulher(_,_,_,_,atum,_), Mulheres),

    %% A mulher de 30 anos está exatamente à esquerda da mulher que está bebendo suco de Limão.
    a_esquerda(mulher(_,_,_,_,_,limao), mulher(_,30,_,_,_,_), Mulheres),

    %% Michele está ao lado da mulher que está usando a toalha Vermelha.
    ao_lado(mulher('Michele',_,_,_,_,_), mulher(_,_,_,vermelha,_,_), Mulheres),

    %% A mulher de 35 anos está exatamente à esquerda da mulher de 40 anos.
    a_esquerda(mulher(_,40,_,_,_,_), mulher(_,35,_,_,_,_), Mulheres),

    %% A Chef está exatamente à direita da mulher que está bebendo suco de Laranja.
    a_direita(mulher(_,_,_,_,_,laranja), mulher(_,_,chef,_,_,_), Mulheres),

    %% A mulher da toalha Vermelha está em algum lugar entre a mulher de 30 anos e a mulher que está comendo sanduíche de Presunto, nessa ordem.
    entre(mulher(_,_,_,vermelha,_,_), mulher(_,30,_,_,_,_), mulher(_,_,_,_,presunto,_), Mulheres),

    %% Michele está bebendo suco de Manga.
    member(mulher('Michele',_,_,_,_,manga), Mulheres),

    %% Em uma das pontas está a mulher de 40 anos.
    eh_ponta(mulher(_,40,_,_,_,_), Mulheres),

    %% A Engenheira está exatamente à esquerda da mulher de 35 anos.
    a_esquerda(mulher(_,35,_,_,_,_), mulher(_,_,engenheira,_,_,_), Mulheres),

    %% A Tradutora está ao lado de Eliana.
    ao_lado(mulher(_,_,tradutora,_,_,_), mulher('Eliana',_,_,_,_,_), Mulheres),

    %% Quem está comendo sanduíche de carne de Porco está em algum lugar entre 
    %% a Yasmin e quem está comendo sanduíche de Atum, nessa ordem.
    entre(mulher(_,_,_,_,porco,_), mulher('Yasmin',_,_,_,_,_), mulher(_,_,_,_,atum,_), Mulheres),

    %% A mulher da toalha Roxa está comendo sanduíche de Bacon.
    member(mulher(_,_,_,roxa,bacon,_), Mulheres),

    %% Na primeira posição está a mulher que está usando a toalha Verde.
    eh_primeiro(mulher(_,_,_,verde,_,_), Mulheres),

    %% A dona da toalha Vermelha está em algum lugar entre a mulher de 30 anos 
    %% e a dona da toalha Amarela, nessa ordem.
    entre(mulher(_,_,_,vermelha,_,_), mulher(_,30,_,_,_,_), mulher(_,_,_,amarela,_,_), Mulheres),

    %% Eliana está exatamente à direita da mulher que está bebendo suco de Uva.
    exata_direita(mulher(_,_,_,_,_,uva), mulher('Eliana',_,_,_,_,_), Mulheres),

    %% Lídia está em algum lugar à direita da mulher da toalha Vermelha.
    a_direita(mulher(_,_,_,vermelha,_,_), mulher('Lidia',_,_,_,_,_), Mulheres),

    %% A Engenheira tem 45 anos.
    member(mulher(_,45,engenheira,_,_,_), Mulheres),

    %% Em uma das pontas está a mulher que está comendo sanduíche de Presunto.
    eh_ponta(mulher(_,_,_,_,presunto,_), Mulheres),

    %% Michele trabalha como Engenheira.
    member(mulher('Michele',_,engenheira,_,_,_), Mulheres),

    %% Extras
    member(mulher(_,_,_,_,queijo,_), Mulheres),
    member(mulher(_,_,_,_,_,maca), Mulheres),
    member(mulher(_,25,_,_,_,_), Mulheres),
    member(mulher('Angelina',_,_,_,_,_), Mulheres),
    member(mulher(_,_,designer,_,_,_), Mulheres),
    member(mulher(_,_,_,branca,_,_), Mulheres),

    print_mulheres(Mulheres).
