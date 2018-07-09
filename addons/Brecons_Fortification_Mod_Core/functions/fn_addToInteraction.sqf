/*
Author: Brecon
Version: 0.2
Date: 03:40 - 06/07/2018

Adds items to players interaction menu

    Params:
        _blank {array}: ?

        _type {string}: Category for ace menu

        _iconPath {string}: Path to icon

        _objectName {string}: item name for ace menu

    	_classname {string}: object class of item

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

params ["_array"];
{
    _x params [
        "_type",
        "_icon",
        "_name",
        "_classname",
        "_resources",
        "_tools",
        "_posC",
        "_rotC",
        "_posD",
        "_rotD",
        "_position",
        "_distance"
        ];
    // hint format ["PARENT: %1", _parent];
    // hint format ["_array: %1", _array];
    hint format ["%1\n%2\n%3\n%4\n%5\n%6\n%7\n%8\n%9\n%10\n%11\n%12", _type, _icon,_name,_classname,_resources,_tools,_posC,_rotC,_posD,_rotD,_position,_distance];
    _actionName = "BFM_Build_" + _name;
    _menuName = "Build" + _name;
    _statement = {
        params ["_target", "_player", "_arg"];
        _arg params ["_name","_classname","_resources","_tools","_posC","_rotC","_posD","_rotD","_position","_distance"];
        [_name,_classname,_resources,_tools,_posC,_rotC,_posD,_rotD,_position,_distance] call BFM_fnc_core;
    };
    _condition = {
        params ["_target", "_player", "_arg"];
        _arg params ["_name","_classname","_resources","_tools","_posC","_rotC","_posD","_rotD","_position","_distance"];
        [_resources, _tools] call BFM_fnc_canDeploy
    };

    _action = [_actionName,_menuName,_icon,_statement,_condition,nil,[_name,_classname,_resources,_tools,_posC,_rotC,_posD,_rotD,_position,_distance],nil,10] call ace_interact_menu_fnc_createAction;

    _path = ["ACE_SelfActions", "BFM_Actions"];
    _path append _type;

    [
        ACE_player,
        1,
        _path,
        _action
    ] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];

} forEach _array;
