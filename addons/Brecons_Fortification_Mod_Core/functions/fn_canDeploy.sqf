/*
Author: Brecon
Version: 0.2
Date: 03:40 - 06/07/2018


Checks if player can spawn item

    Params:

        _resources {array}: items needed to create item
                        [
                        [item, amount]
                        ]

    	_tool {array}: optional, tool required to create item
                        [
                        item,
                        ]
    Returns:
        Boolean: True if player has items

    Example:
        pass
*/


params ["_resources", "_tools"];

_check = True;
//resource check
for [{_i=0}, {_i < count _resources}, {_i=_i+1}] do {

    if (({(_resources select _i) select 0 == _x} count (items ACE_player)) <(_resources select _i) select 1) exitWith {
        _check = False;
    };
};
// tool check
if ((count _tools) > 0) then {
    for [{_i=0}, {_i < count _tools}, {_i=_i+1}] do {
        if !((_tools select _i) in (items ACE_player)) exitWith {
            _check = False;
        };
    };
};
// returns result
_check;
