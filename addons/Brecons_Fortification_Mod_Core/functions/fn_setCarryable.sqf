params ["_object", "_enableCarry", "_position", "_direction", ["_parent", ["ACE_MainActions"]]];

if (isNil "_position") then {
    _position = _object getVariable ["ace_dragging_carryPosition", [0,1,1]];
};

if (isNil "_direction") then {
    _direction = _object getVariable ["ace_dragging_carryDirection", 0];
};

// update variables
_object setVariable ["ace_dragging_canCarry", _enableCarry];
_object setVariable ["ace_dragging_carryPosition", _position];
_object setVariable ["ace_dragging_carryDirection", _direction];

// add action to class if it is not already present

private _type = typeOf _object;
private _initializedClasses = ace_dragging_initializedClasses_carry;

// do nothing if the class is already initialized

if (_type in _initializedClasses) exitWith {};
//hint format ["PARENT: %1", _parent];
_initializedClasses pushBack _type;
ace_dragging_iinitializedClasses_carry = _initializedClasses;

private _icon = ["\z\ace\addons\dragging\UI\icons\box_carry.paa", "\z\ace\addons\dragging\UI\icons\person_carry.paa"] select (_object isKindOf "Man");

private _carryAction = ["ace_dragging_carry", localize "STR_ACE_dragging_Carry", _icon, {[_player, _target] call ace_dragging_fnc_startCarry}, {[_player, _target] call ace_dragging_fnc_canCarry}] call ace_interact_menu_fnc_createAction;
private _dropAction = ["ace_dragging_drop_carry", localize "STR_ACE_dragging_Drop", "", {[_player, _target] call ace_dragging_fnc_dropObject_carry}, {[_player, _target] call ace_dragging_fnc_canDrop_carry}] call ace_interact_menu_fnc_createAction;

[_object, 0, _parent, _carryAction] call ace_interact_menu_fnc_addActionToObject;
[_object, 0, [], _dropAction] call ace_interact_menu_fnc_addActionToObject;
