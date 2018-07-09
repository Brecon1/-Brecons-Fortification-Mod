class CfgPatches
{
	class Brecons_Fortification_Mod_Core
	{
		name="Brecon's Fortification Mod";
		author="Brecon";
		url="http://steamcommunity.com/id/mightybrecon";
		requiredVersion=1.8;
		requiredAddons[]=
		{
			"A3_Functions_F",
			"ace_main"
		};
		units[]={};
		weapons[]={};
	};
};
class CfgFunctions
{
	class BFM
	{
		class functions
		{
			file="\Brecons_Fortification_Mod_Core\functions";
            class addItemToList{};
            class addToInteraction{};
            class canDeploy{};
			class core{};
            class clearItemList{};
            class setCarryable{};
            class setDraggable{};
		};
	};
};
class CfgFactionClasses
{
	class NO_CATEGORY;
	class BFM: NO_CATEGORY
	{
		displayName="Fortification";
	};
};
class CfgVehicles
{
    class Man;
	class CAManBase: Man
	{
		class ACE_SelfActions
		{
			class BFM_Actions
			{
                displayName = "BFM"
                class BFM_Actions_Wall
    			{
                    displayName = "Walls"
                    class BFM_Actions_Wall_Concrete
        			{
                        displayName = "Concrete"
        			};
                    class BFM_Actions_Wall_M
        			{
                        displayName = "M"
        			};
                    class BFM_Actions_Wall_H
        			{
                        displayName = "H"
        			};
    			};
                class BFM_Actions_Bunkers
    			{
                    displayName = "Bunkers"
    			};
                class BFM_Actions_Sandbags
    			{
                    displayName = "Sandbags"
    			};
                class BFM_Actions_Obstacles
    			{
                    displayName = "Obstacles"
    			};
                class BFM_Actions_Tents
    			{
                    displayName = "Tents"
    			};
                class BFM_Actions_Covers
    			{
                    displayName = "Covers"
    			};
                class BFM_Actions_Custom
    			{
                    displayName = "Custom"
    			};
			};
		};
	};

    class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Edit;
            class Combo;
            class Units;
		};
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	class BFM_moduleAddItem: Module_F
	{
		scope=2;
		displayName="Add Item";
		category="BFM";
		function="BFM_fnc_addItemToList";
		functionPriority=2;
		isGlobal=2;
        isTriggerActivated=1;
		isDisposable=0;
		class Arguments: ArgumentsBaseUnits
		{
            class type: Combo
            {
                displayName="Type";
				description="The type of Fortification";
				typeName="STRING";
				defaultValue="BFM_Actions_Custom";
                class Values
				{
					class BFM_Wall	{name = "Wall";	value = "BFM_Actions_Wall";};
					class BFM_Wall_Concrete	{name = "Wall_Concrete	"; value = "BFM_Actions_Wall, BFM_Actions_Wall_Concrete";};
					class BFM_Wall_M	{name = "Wall_M"; value = "BFM_Actions_Wall, BFM_Actions_Wall_M";};
					class BFM_Wall_H	{name = "Wall_H"; value = "BFM_Actions_Wall, BFM_Actions_Wall_H";};
					class BFM_Bunkers	{name = "Bunkers"; value = "BFM_Actions_Bunkers";};
					class BFM_Sandbags	{name = "Sandbags"; value = "BFM_Actions_Sandbags";};
					class BFM_Obstacles	{name = "Obstacles"; value = "BFM_Actions_Obstacles";};
					class BFM_Tents	{name = "Tents"; value = "BFM_Actions_Tents";};
					class BFM_Covers	{name = "Covers"; value = "BFM_Actions_Covers";};
					class BFM_Custom	{name = "Custom"; value = "BFM_Actions_Custom";};
				};
            };
            class iconPath : Edit
			{
				displayName="Icon Path";
				description="Path to Icon";
				typeName="STRING";
				defaultValue="";
			};
            class objectName : Edit
			{
				displayName="Object Name";
				description="Name that shows in ACE's menu";
				typeName="STRING";
				defaultValue="";
			};
			class classname : Edit
			{
				displayName="Classname";
				description="Classname of the Object you want to add";
				typeName="STRING";
				defaultValue="";
			};
			class Resource1 : Edit
			{
				displayName="Required Resource";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
			class amount1 : Edit
			{
				displayName="Amount:";
				description="How much items you need";
				typeName="NUMBER";
				defaultValue=0;
			};
			class Resource2 : Edit
			{
				displayName="Required Resource";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
			class amount2 : Edit
			{
				displayName="Amount";
				description="How much items you need";
				typeName="NUMBER";
				defaultValue=0;
			};
			class Resource3 : Edit
			{
				displayName="Required Resource";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
			class amount3 : Edit
			{
				displayName="Amount";
				description="How much items you need";
				typeName="NUMBER";
				defaultValue=0;
			};
			class Resource4 : Edit
			{
				displayName="Required Resource";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
			class amount4 : Edit
			{
				displayName="Amount";
				description="How much items you need";
				typeName="NUMBER";
				defaultValue=0;
			};
            class tool1 : Edit
			{
				displayName="Required Tool";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
            class tool2 : Edit
			{
				displayName="Required Tool";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
            class tool3 : Edit
			{
				displayName="Required Tool";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
            class tool4 : Edit
			{
				displayName="Required Tool";
				description="Add here the classname from one requirement, leave empty for not use this requirement";
				typeName="STRING";
				defaultValue="";
			};
            class posC : Edit
			{
				displayName="Position for carrying";
				description="[x(abscissa),y(ordinate),z(applicate)]";
				typeName="ARRAY";
				defaultValue="0,2,1";
			};
            class rotC : Edit
			{
				displayName="Rotation for carrying";
				description="Rotation for carrying object";
				typeName="number";
				defaultValue="180";
			};
            class posD : Edit
			{
				displayName="Position for dragging";
				description="[x(abscissa),y(ordinate),z(applicate)]";
				typeName="ARRAY";
				defaultValue="0,2,0";
			};
            class rotD : Edit
			{
				displayName="Rotation for dragging";
				description="Rotation for dragging object";
				typeName="number";
				defaultValue="180";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Add your own item to the item list";
			sync[]={};
		};
	};
	class BFM_moduleClearItemList: Module_F
	{
		scope=2;
		displayName="Clear Item List";
		category="BFM";
		function="BFM_fnc_clearItemList";
		functionPriority=1;
		isGlobal=2;
		isTriggerActivated=1;
		isDisposable=0;
		class Arguments: ArgumentsBaseUnits
		{
			class Units: Units
			{
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Clear all Items from the item list";
			sync[]={};
		};
	};
};
class Extended_PostInit_EventHandlers
{
	BFM_init="[] execVM '\Brecons_Fortification_Mod_Core\init.sqf'";
};
