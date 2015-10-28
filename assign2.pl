class('Stack').
class('BoundedStack').
class('ResettableBoundedStack').
class('Stack2').
class('Stack3').

interface('Lockable').

extends('BoundedStack', 'Stack').
extends('ResettableBoundedStack', 'BoundedStack').
extends('Stack2', 'ResettableBoundedStack').
extends('Stack3', 'Stack2').

implements('BoundedStack', 'Lockable').

declares('Stack', [private, 'ArrayList<String>', elements]).
declares('Stack', [protected, int, top]).
declares('Stack3', [public, double, entropy]).
declares('Stack3', [public, 'String', label]).
declares('Stack3', [public, bool, ignoreFlag]).

defines('Stack', [public, void, push, ['String']]).
defines('Stack', [public, 'String', pop, [void]]).
defines('BoundedStack', [public, 'void', push, ['String']]).
defines('ResettableBoundedStack', [public, 'void', reset, [void]]).
defines('Stack2', [public, 'String', gget, [void]]).
defines('Stack3', [public, void, entropicPush, ['String']]).
defines('Stack3', [public, 'String', entropicPop, [void]]).
defines('Stack3', [public, 'String', entropicTop, [void]]).
defines('Stack3', [public, int, entropicCount, [void]]).
defines('Stack3', [public, 'String', toString, [void]]).

extends_path(X,Y):- extends(X,Y).
extends_path(X,Y):- extends(X,Z),extends_path(Z,Y).
extends_real(X,Y):- extends_path(X,Y).

interface(Class,Interface):-extends_real(Class,Interface),findall(Class,defines(Interface,_),L),list_to_set(L,X).
