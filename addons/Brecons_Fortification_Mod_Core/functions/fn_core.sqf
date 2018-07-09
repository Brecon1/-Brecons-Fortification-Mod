/*
Author: Brecon
Version: 0.2
Date: 03:40 - 06/07/2018

Spawns the object infront of the player

    Params:
        _item {string}: item name

    	_obj {string}: object class of item

        _resources {array}: items needed to create item
                        [
                        [item, amount]
                        ]

    	_tool {array}: optional, tool required to create item
                        [
                        item,
                        ]

    	_posC {array}: optional, position for carrying spawned object
                        [
                        x(abscissa),
                        y(ordinate),
                        z(applicate)
                        ]
                        default [0,2,1]

        _rotC {integer}: optional, rotation for carrying spawned object
                        default 180

        _posD {array}: optional, position for dragging spawned object
                        [
                        x(abscissa),
                        y(ordinate),
                        z(applicate)
                        ]
                        default [0,2,0]

        _rotD {integer}: optional, rotation for dragging spawned object
                        default 180

    Returns:
        None

    Example:
        pass
*/

params [
	"_item",
	"_obj",
	"_resources",
    ["_tools", []],
    ["_posC", [0,2,1]],
    ["_rotC", 180],
    ["_posD", [0,2,0]],
    ["_rotD", 180],
    "_position",
    ["_distance", 4]
];

// Double inventory check
if !(call{[_resources, _tools] call BFM_fnc_canDeploy})  exitWith {
    systemChat format ["error code [MC/F/CORE/83]"];
};

// remove resources from inventory

for [{_i=0}, {_i < count _resources}, {_i=_i+1}] do {
    for "_j" from 1 to ((_resources select _i) select 1) do {
           ACE_player removeItem ((_resources select _i) select 0);
    };
};

_obj = _obj createVehicle [0, 0, 0];
_obj setDir ((getDir ACE_player) - _rotC);
_obj setposATL (ACE_player modelToWorld _posD);


// Setting object to carry and drag
//hint "test";

//hint format ["_position: %1", _position];
// hint format ["_position: %1", (isNil "_position")];
if (isNil "_position") then{
    parent = ["ACE_MainActions"];
}else {
    _action1 = ['BFM_Action','Test 1','',{true},{true}, nil, nil, _position, _distance] call ace_interact_menu_fnc_createAction;
    [_obj, 0, [], _action1] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];
    parent = ["BFM_Action"];

};

[_obj, true, _posC, _rotC, parent] remoteExecCall ["BFM_fnc_setCarryable", 0, true];
[_obj, true, _posD, _rotD, parent] remoteExecCall ["BFM_fnc_setDraggable", 0, true];

// Setting object to be carried

[ACE_player, _obj] call ace_dragging_fnc_startCarry;

// Setting up dismantle action

_action = [
"BFM_dismantle_" + _item,
"Dismantle",
"",
{
    params ["_target", "_player", "_arg"];
    _arg params ["_obj", "_resources", "_tools"];

    _check = False;

    for [{_i=0}, {_i < count _resources}, {_i=_i+1}] do {
        if  !(ACE_Player canAdd [((_resources select _i) select 0), ((_resources select _i) select 1)]) exitWith {
            systemChat format ["error inventory full"];
            _check = True;
        };
    };

    if ((count _tools) > 0) then {
        for [{_i=0}, {_i < count _tools}, {_i=_i+1}] do {
            if !((_tools select _i) in (items ACE_player)) exitWith {
                systemChat format ["error tool check"];
                _check = True;
            };
        };
    };
    if _check exitWith {
        {true};
    };

    deleteVehicle _obj;
    for [{_i=0}, {_i < count _resources}, {_i=_i+1}] do {
        for "_j" from 1 to ((_resources select _i) select 1) do {
               ACE_player addItem ((_resources select _i) select 0);
        };
    };
},
{true},
nil,
[_obj, _resources, _tools],
nil,
10
] call ace_interact_menu_fnc_createAction;


[_obj,
0,
["ACE_MainActions"],
_action
] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];
