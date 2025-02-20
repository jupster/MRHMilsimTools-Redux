
class MRH // Defines the "owner"
{
	class InitFunctionsCallBack// category
	{
	tag = "MRH";
	file = "\MRHMilsimTools\Functions\InitFunctions";
	    class MilsimTools_Core_SetPlayerIntel
		{};
		class MilsimTools_Core_PlayersRegistry
		{};
		class MilsimTools_Core_InitPlayerLocal
		{};
		class MilsimTools_Core_initMRHPlayer
		{};
		
	};
	class CoreFunctions// category
	{
	tag = "MRH";
	file = "\MRHMilsimTools\Functions\CoreFunctions";
	    class MilsimTools_Core_SetRevived
		{};
		class MilsimTools_Core_BriefingAdminMenuLink
		{};
		class MilsimTools_Core_FindPlayerByUID
		{};
		class MilsimTools_Core_RemoteFor
		{};
		class MilsimTools_Core_RemoteForServer
		{};
		class MilsimTools_Core_ReturnCountsForRegistry
		{};
		class MilsimTools_Core_ReturnPlayerSimpleList
		{};
		class MilsimTools_Core_AdminDeadCount
		{};
		class MilsimTools_Core_ReturnEmptyCargoSlots
		{};
		class MilsimTools_Core_LocRankIntel
		{};
		class MilsimTools_Core_ListGroupsWithPlayers
		{};
		class MilsimTools_Core_SortGroupsBySide 
		{};
		class MilsimTools_Core_SortUnitsBySide 
		{};
		class MilsimTools_Core_GenerateRosterText
		{};
		class MilsimTools_Core_ApplyRosterTextSettings
		{};
		class MilsimTools_Core_AddBriefingRoster
		{};
		class MilsimTools_Core_SetCtrlSize
		{};
		class MilsimTools_Core_RemoteExecForGivenPlayer
		{};
		class MilsimTools_Core_CutsceneToPlayer
		{};
		/*
		class MilsimTools_Core_RegisterNewPlayer
		{};
		*/
		class MilsimTools_Core_GenAllOnline
		{};
		class MilsimTools_Core_GenAliveAndDead
		{};
		class MilsimTools_Core_resultForSide
		{};
		class MilsimTools_Core_realisticGrid
		{};
		class MilsimTools_Core_InvCurator
		{};
		class MilsimTools_Core_toggleCuratorInv
		{};
		class MilsimTools_Core_stringTo
		{};
		class MilsimTools_Core_isAliveAndConscious
		{};
		class MilsimTools_Core_getAliveAndConsciousGrpMembers
		{};
		class MilsimTools_Core_playVideoOnObject
		{};
		class MilsimTools_Core_nearestDoor
		{};
		class MilsimTools_Core_nearestDoorNumber
		{};
		class MilsimTools_Core_lockDoor
		{};
		class MilsimTools_Core_isLockedDoor
		{};
		class MilsimTools_Core_toggleDoorState
		{};
		class MilsimTools_Core_notifyPlayer
		{};
		class MilsimTools_Core_notifySide
		{}
		class MilsimTools_Core_isNight
		{};
		class MilsimTools_Core_returnAltitude
		{};
		class MilsimTools_Core_addParachuteToObject
		{}
		class MilsimTools_Core_isExistingVariableName
		{};
		class MilsimTools_Core_attributeVariableName
		{};
		class MilsimTools_Core_addMultipleParachutesToObject
		{};
		class MilsimTools_Core_ensureSafeLanding
		{};
		class MilsimTools_Core_scatterPosition
		{};
		class MilsimTools_Core_findObjectFromString
		{};
		class MilsimTools_Core_paraRemoveBackPack
		{}
		class MilsimTools_Core_paraRestoreBackpack
		{}
		class MilsimTools_Core_testPercentageOdds
		{};
		class MilsimTools_Core_freeCargoIndexes
		{};
		class MilsimTools_Core_stopCuratorFollow
		{};
		class MilsimTools_Core_conditionalPFEH
		{};
		class MilsimTools_Core_addItem
		{};
		class MilsimTools_Core_handleIncorrectVersion
		{};
		class MilsimTools_Core_cmpGrabObject
		{};
		class MilsimTools_Core_cmpCreateObject
		{};
		class MilsimTools_Core_cmpStoreComp
		{};
		class MilsimTools_Core_cmpSpawnComp
		{};
		class MilsimTools_Core_cmpCreateComp
		{};
		class MilsimTools_Core_cmpDeleteComp
		{};
		class MilsimTools_Core_cmpGetComp
		{};
		class MilsimTools_Core_stringListToArray
		{};
		class MilsimTools_Core_arrayToCfgArray
		{}
		class MilsimTools_Core_compGetAndSpawnComp
		{};
		class MilsimTools_Core_stringToBool
		{};
		class MilsimTools_Core_getBoolArray
		{};
		class MilsimTools_Core_isDeployableFob
		{};
		class MilsimTools_Core_assignMedicPatch
		{};
		class MilsimTools_Core_findCtrlBoxIndexFor
		{};
		class MilsimTools_Core_putContainerInVehicle
		{};
		class MilsimTools_Core_returnDepth
		{};
		class MilsimTools_Core_gridInPutCheck
		{};
		class MilsimTools_Core_checkGridValidity
		{};
		class MilsimTools_Core_parseCoordinates
		{};
		class MilsimTools_Core_fiveDigitsGridFormat
		{};
		class MilsimTools_Core_sortVehiclesObjectsByCargoSize
		{};
		class MilsimTools_Core_selectHasEnoughCargoObject
		{};
		class MilsimTools_Core_sortVehiclesByCargoSize
		{};
		class MilsimTools_Core_selectHasEnoughCargo
		{};
		class MilsimTools_Core_clearAllWaypoints
		{};
		class MilsimTools_Core_deleteVehicleAndCrew
		{};
		class MilsimTools_Core_lockNonCargo
		{};
		class MilsimTools_Core_generateAceDefaultLoadOuts
		{};
		class MilsimTools_Core_isCurator
		{};
		class MilsimTools_Core_serverCreateCurator
		{};
		class MilsimTools_Core_cbaEventHandlersPlayer
		{};
		class MilsimTools_Core_getSoundFile
		{};
		class MilsimTools_Core_playSound3D
		{};
		class MilsimTools_Core_playSound3Dlocal
		{};
		class MilsimTools_Core_CuratorViewEh
		{};
		class MilsimTools_Core_handleCuratorWaterMark
		{};
		class MilsimTools_Core_isConnectedToAntenna
		{};
		class MilsimTools_Core_getPlayersWithZeusPowers
		{};
		class MilsimTools_Core_addObjectsToCurators
		{};
		class MilsimTools_Core_triggerActivate_global
		{};
		class MilsimTools_Core_triggerActivate_target
		{};
		class MilsimTools_Core_updateLoadOutText
		{};
		class MilsimTools_Core_generateLoadOutText
		{};
		class MilsimTools_Core_generateMagazinesText
		{};
		class MilsimTools_Core_generateItemText
		{};
		class MilsimTools_Core_getCfgInfo
		{};
		class MilsimTools_Core_diaryPercentageBar
		{};
		class MilsimTools_Core_getContainerWeightAndMaxLoad
		{};
		class MilsimTools_Core_armaWeightToReal
		{};
		class MilsimTools_Core_allPlayers
		{};
		class MilsimTools_Core_BFT
		{};
		class MilsimTools_Core_NATO_symbols_for
		{};
		class MilsimTools_Core_showOnBFT
		{};
		class MilsimTools_Core_addToBFTenabledList
		{};
		class MilsimTools_Core_childrenClasses
		{};
		class MilsimTools_Core_vehHasSatcom
		{};
		class MilsimTools_Core_canConnectToVehSatCom
		{};

		/*
		class MilsimTools_Core_
		{};
		*/
		
	};
	

	/*
	class Template // tomoveelsewhere in case of mod conversion
	{
	tag = "MRH";
	file = "\MRHMilsimTools\Functions\somedir";
		class somefunc
		{};

	};
	*/
};
		
		