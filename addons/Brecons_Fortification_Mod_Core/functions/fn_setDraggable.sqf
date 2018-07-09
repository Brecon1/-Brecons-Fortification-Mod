params ["_object", "_enableDrag", "_position", "_direction", ["_parent", ["ACE_MainActions"]]];

if (isNil "_position") then {
    _position = _object getVariable ["ace_dragging_dragPosition", [0,0,0]];
};

if (isNil "_direction") then {
    _direction = _object getVariable ["ace_dragging_dragDirection", 0];
};

// update variables
_object setVariable ["ace_dragging_canDrag", _enableDrag];
_object setVariable ["ace_dragging_dragPosition", _position];
_object setVariable ["ace_dragging_dragDirection", _direction];

// add action to class if it is not already present

private _type = typeOf _object;
private _initializedClasses = ace_dragging_initializedClasses;

//do nothing if the class is already initialized

if (_type in _initializedClasses) exitWith {};

_initializedClasses pushBack _type;
ace_dragging_initializedClasses = _initializedClasses;

private _icon = ["\z\ace\addons\dragging\UI\icons\box_drag.paa", "\z\ace\addons\dragging\UI\icons\person_drag.paa"] select (_object isKindOf "Man");

//private _dragAction = ["ace_dragging_drag", localize "STR_ACE_dragging_Drag", _icon, {[_player, _target] call ace_dragging_fnc_startDrag}, {[_player, _target] call ace_dragging_fnc_canDrag}] call ace_interact_menu_fnc_createAction;
private _dragAction = ["ace_dragging_drag", localize "STR_ACE_dragging_Drag", _icon, {[_player, _target] call ace_dragging_fnc_startDrag}, {true}] call ace_interact_menu_fnc_createAction;
private _dropAction = ["ace_dragging_drop", localize "STR_ACE_dragging_Drop", "", {[_player, _target] call ace_dragging_fnc_dropObject}, {[_player, _target] call ace_dragging_fnc_canDrop}] call ace_interact_menu_fnc_createAction;

[_object, 0, _parent, _dragAction] call ace_interact_menu_fnc_addActionToObject;
[_object, 0, [], _dropAction] call ace_interact_menu_fnc_addActionToObject;
