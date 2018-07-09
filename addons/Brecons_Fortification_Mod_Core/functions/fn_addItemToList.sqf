/*
Author: Brecon
Version: 0.2
Date: 03:40 - 06/07/2018

Module to add items to be created

    Params:
        _type {string}: Category for ace menu

        _iconPath {string}: Path to icon

        _objectName {string}: item name for ace menu

    	_classname {string}: object class of item

        _resource {string}: items needed to create item

        _amount {integer}: amount of an item to create the item

    	_tool {string}: optional, tool required to create item

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

_logic = param [0,objNull,[objNull]];
waituntil {!(isNil "BFM_itemList")};

_intConvert = {
    _string = _this select 0;
    _tempLst = _string splitString ",";
    _returnLst = [];
    {
        _returnLst append [(parseNumber _x)];
    } forEach _tempLst;
    _returnLst
};

_type = _logic getVariable "type";
_iconPath = _logic getVariable "iconPath";
_objectName = _logic getVariable "objectName";
_classname = _logic getVariable "classname";
_Resource1 = _logic getVariable "Resource1";
_amount1 = _logic getVariable "amount1";
_Resource2 = _logic getVariable "Resource2";
_amount2 = _logic getVariable "amount2";
_Resource3 = _logic getVariable "Resource3";
_amount3 = _logic getVariable "amount3";
_Resource4 = _logic getVariable "Resource4";
_amount4 = _logic getVariable "amount4";
_tool1 = _logic getVariable "tool1";
_tool2 = _logic getVariable "tool2";
_tool3 = _logic getVariable "tool3";
_tool4 = _logic getVariable "tool4";
_posC = _logic getVariable "posC";
_rotC = _logic getVariable "rotC";
_posD = _logic getVariable "posD";
_rotD = _logic getVariable "rotD";

_resourceArray = [];
_toolArray = [];
if (_classname != "") then{
    if ((_Resource1 != "") && (_amount1 != 0)) then {
        _resourceArray append [[_Resource1, _amount1]];
    };
    if ((_Resource2 != "") && (_amount2 != 0)) then {
        _resourceArray append [[_Resource2, _amount2]];
    };
    if ((_Resource3 != "") && (_amount3 != 0)) then {
        _resourceArray append [[_Resource3, _amount3]];
    };
    if ((_Resource4 != "") && (_amount4 != 0)) then {
        _resourceArray append [[_Resource4, _amount4]];
    };
    if (_tool1 != "") then {
        _toolArray append [_tool1];
    };
    if (_tool2 != "") then {
        _toolArray append [_tool2];
    };
    if (_tool3 != "") then {
        _toolArray append [_tool3];
    };
    if (_tool4 != "") then {
        _toolArray append [_tool4];
    };
    if !(_resourceArray isEqualTo []) then{
        // converting strings to arrays
        _type = _type splitString ",";
        _posC = [_posC] call _intConvert;
        _posD = [_posD] call _intConvert;
        _array = [[_type,_iconPath,_objectName,_classname,_resourceArray, _toolArray, _posC, _rotC, _posD, _rotD]];
        [_array] remoteExecCall ["BFM_fnc_addToInteraction", 0, true];
    };
};
true
