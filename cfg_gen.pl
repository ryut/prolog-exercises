%main function
generator(grammar(NonTermList, Rules, St), Result) :-
    gen(St, Rules, NonTermList, Result).

%find possible symbols that forms rule with Sym which is in Rules.
tryRule(Sym, Rules, Var) :-
    member(rule(Sym, Var), Rules).

%base case, if no more elments, juststop.
gen([], _, _, []).

%base case, if reached a terminal symbol, add into Result.
gen([H|T], Rules, NonTerm, [H|Seq]) :-
    \+ member(H, NonTerm),
    gen(T, Rules, NonTerm, Seq).

%main recursion routine
gen([H|T], Rules, NonTerm, Result) :-
    member(H, NonTerm),
    tryRule(H, Rules, NewHead),
    append(NewHead, T, NewSeq),
    gen(NewSeq, Rules, NonTerm, Result).    
