/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_;
*/
#include "MRH_C_Path.hpp"
params ["_ctrl"];

lbClear _ctrl;


_addonComps = FUNC(listAddonCompositions);


_missionComps = FUNC(listMissionCompositions);

_all = _addonComps + _missionComps;
systemChat str _all;
{
	 _index = _ctrl lbAdd (_x select 0);
	_ctrl lbSetData [_index,(_x select 1)];
} forEach _all;