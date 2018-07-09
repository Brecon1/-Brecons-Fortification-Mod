/*
Author: Brecon
Version: 0.2
Date: 03:40 - 06/07/2018

Handles default item set up

    BFM_itemList (In element order):

        _type {array}: Category for ace menu
                    ["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"] - Walls - Concrete
                    ["BFM_Actions_Wall", "BFM_Actions_Wall_M"] - Walls - M
                    ["BFM_Actions_Wall", "BFM_Actions_Wall_H"] - Walls - H
                    ["BFM_Actions_Bunkers"] - Bunkers
                    ["BFM_Actions_Sandbags"] - Sandbags
                    ["BFM_Actions_Obstacles"] - Obstacles
                    ["BFM_Actions_Tents"] - Tents
                    ["BFM_Actions_Covers"] - Covers

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
        [_type, _iconPath, _objectName, _classname,_resources, _tool, _posC, _rotC, _posD, _rotD]];
*/
if (isDedicated) exitWith {};

BFM_itemList = [
[["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"],"", "4M Small", "Land_Concrete_SmallWall_4m_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0],180,[0,2,0],180, [0,0,1], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"],"", "8M Small", "Land_Concrete_SmallWall_8m_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0],180,[0,2,0],180, [0,0,1], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"],"", "Single Wall", "Land_CncWall1_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,-0.4], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"],"", "Long Wall", "Land_CncWall4_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,-0.4], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"],"", "Medium", "Land_CncBarrierMedium_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,0.5], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_Concrete"],"", "Medium Long", "Land_CncBarrierMedium4_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,0.5], 4],

[["BFM_Actions_Wall", "BFM_Actions_Wall_M"],"", "Corner", "Land_Mil_WallBig_Corner_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],135,[0,2,0],180, [0,0,-0.5], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_M"],"", "Base Wall", "Land_Mil_WallBig_4m_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,-0.5], 4],

[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "Block", "Land_HBarrier_1_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,0.3], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "3 Block", "Land_HBarrier_3_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,0.3], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "5 Block", "Land_HBarrier_5_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,0.3], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "Big 4 Block", "Land_HBarrier_Big_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,0,0.3], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "Corridor", "Land_HBarrierWall_corridor_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,3,0.25],180,[0,3,0],180, [0,2,0.3], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "Corner", "Land_HBarrierWall_corner_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"], [1,2,0.25], 0, [1,2,0], 0, [-0.75,-1,0.5], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "4 Wall", "Land_HBarrierWall4_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],0,[0,2,0],0, [0,-1,0.5], 4],
[["BFM_Actions_Wall", "BFM_Actions_Wall_H"],"", "8 Wall", "Land_HBarrierWall6_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],0,[0,2,0],0, [0,-1,0.5], 4],


[["BFM_Actions_Bunkers"],"", "HBarrier Tower", "Land_HBarrierTower_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,5,0.25],180,[0,5,0],180, [0,4,-0.8], 4],
[["BFM_Actions_Bunkers"],"", "Small Sandbag Bunker", "Land_BagBunker_Small_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,0.25],180,[0,2,0],180, [0,1,0], 3],
[["BFM_Actions_Bunkers"],"", "Large Sandbag Bunker", "Land_BagBunker_Large_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,6.5,0],180,[0,6.5,0],180, [-0.15,3.5,0], 4],
[["BFM_Actions_Bunkers"],"", "Sandbag Tower", "Land_BagBunker_Tower_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,6,0.25],180,[0,6,0],180, [0,5,-1], 4],

[["BFM_Actions_Sandbags"],"", "Sandbag End", "Land_BagFence_End_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Sandbags"],"", "Sandbag Short", "Land_BagFence_Short_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Sandbags"],"", "Sandbag Long", "Land_BagFence_Long_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Sandbags"],"", "Sandbag Corner", "Land_BagFence_Corner_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Sandbags"],"", "Sandbag Round", "Land_BagFence_Round_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],

[["BFM_Actions_Obstacles"],"", "DragonsTeeth", "Land_DragonsTeeth_01_1x1_new_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Obstacles"],"", "CzechHedgehog", "Land_CzechHedgehog_01_new_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Obstacles"],"", "ConcreteHedgehog", "Land_ConcreteHedgehog_01_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Obstacles"],"", "Razorwire", "Land_Razorwire_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],

[["BFM_Actions_Tents"],"", "Tent", "Land_MedicalTent_01_white_generic_open_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],

[["BFM_Actions_Covers"],"", "CanvasCover Large", "Land_CanvasCover_01_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "CanvasCover Small", "Land_CanvasCover_02_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "CamoNet Digital", "CamoNet_INDP_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "Open CamoNet Digital", "CamoNet_INDP_open_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "Large CamoNet Digital", "CamoNet_INDP_big_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "CamoNet Green", "CamoNet_BLUFOR_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "Open CamoNet Green", "CamoNet_BLUFOR_open_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "Large CamoNet Green", "CamoNet_BLUFOR_big_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "CamoNet Hex", "CamoNet_OPFOR_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "Open CamoNet Hex", "CamoNet_OPFOR_open_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180],
[["BFM_Actions_Covers"],"", "Large CamoNet Hex", "CamoNet_OPFOR_big_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,2,1],180,[0,2,0],180]
];

//BFM_itemList = [[["BFM_Actions_Bunkers"],"", "Large Sandbag Bunker", "Land_BagBunker_Large_F",[["ACE_Banana",5]],["ACE_EntrenchingTool"],[0,6.5,0],180,[0,6.5,0],180,[-0.15,3.5,0], 4]];

[BFM_itemList] remoteExecCall ["BFM_fnc_addToInteraction", 0, true];
