--****************************************************************************
--**
--**  File     :  /lua/AI/AIBuilders/SorianEditExpansionBuilders.lua
--**
--**  Summary  : Builder definitions for expansion bases
--**
--**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

local BBTmplFile = '/lua/basetemplates.lua'
local ExBaseTmpl = 'ExpansionBaseTemplates'
local BuildingTmpl = 'BuildingTemplates'
local BaseTmpl = 'BaseTemplates'
local Adj2x2Tmpl = 'Adjacency2x2'
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'
local MABC = '/lua/editor/MarkerBuildConditions.lua'
local OAUBC = '/lua/editor/OtherArmyUnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local PCBC = '/lua/editor/PlatoonCountBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local PlatoonFile = '/lua/platoon.lua'
local SBC = '/mods/Sorian Edit/lua/editor/SorianEditBuildConditions.lua'
local SIBC = '/mods/Sorian Edit/lua/editor/SorianEditInstantBuildConditions.lua'
local BasePanicZone, BaseMilitaryZone, BaseEnemyZone = import('/mods/AI-Uveso/lua/AI/uvesoutilities.lua').GetDangerZoneRadii(true)

local ExtractorToFactoryRatio = 3

	do
	LOG('--------------------- SorianEdit Expansion Builders loading')
	end
	
BuilderGroup {
    BuilderGroupName = 'SorianEditEngineerExpansionBuildersFull',
    BuildersType = 'EngineerBuilder',

    --------------------------------------------------------------------------------
    ---- Builds expansion bases
    --------------------------------------------------------------------------------
    ------ Start the Factories in the expansion
    Builder {
        BuilderName = 'SorianEdit T1VacantStartingAreaEngineer - Rush',
        PlatoonTemplate = 'EngineerBuilderSorianEdit',
        Priority = 1500,
        InstanceCount = 2,
        BuilderConditions = {
            { SBC, 'LessThanGameTime', { 600 } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 10, 1, 'StructuresNotMex' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 0,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T1GroundDefense',
                    'T1LandFactory',
                    'T1LandFactory',
                    'T1AADefense',
                    'T1Radar',
                    'T1LandFactory',
                    'T1AirFactory',
                    'T1LandFactory',
                    'T1LandFactory',
                }
            },
            NeedGuard = true,
        }
    },
    Builder {
        BuilderName = 'SorianEdit T2VacantStartingAreaEngineer',
        PlatoonTemplate = 'T2EngineerBuilderSorianEdit',
        Priority = 980,
        InstanceCount = 5,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 10, 1, 'StructuresNotMex' } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 - categories.HYDROCARBON } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 2,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T2AADefense',
                    'T2Radar',
                    'T1LandFactory',
                    'T1LandFactory',
                    'T1AirFactory',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T1LandFactory',
                }
            },
            NeedGuard = true,
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3VacantStartingAreaEngineer',
        PlatoonTemplate = 'T3EngineerBuilderSorianEdit',
        Priority = 922,
        InstanceCount = 2,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 10, 1, 'StructuresNotMex' } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 2,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T3AADefense',
                    'T2Radar',
                    'T1LandFactory',
                    'T1AirFactory',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                }
            },
            NeedGuard = true,
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianEditEngineerExpansionBuildersFulldrop',
    BuildersType = 'EngineerBuilder',

    --------------------------------------------------------------------------------
    ---- Builds expansion bases
    --------------------------------------------------------------------------------
    ------ Start the Factories in the expansion
    Builder {
        BuilderName = 'SorianEdit T1VacantStartingAreaEngineer - drop',
        PlatoonTemplate = 'EngineerBuilderSorianEdit',
        Priority = 1000,
        InstanceCount = 2,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'StructuresNotMex' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = true,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 0,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T1GroundDefense',
                    'T1LandFactory',
                    'T1LandFactory',
                    'T1AADefense',
                    'T1Radar',
                    'T1LandFactory',
                    'T1AirFactory',
                    'T1LandFactory',
                    'T1LandFactory',
                }
            },
            NeedGuard = true,
        }
    },
    Builder {
        BuilderName = 'SorianEdit T2VacantStartingAreaEngineer - drop',
        PlatoonTemplate = 'T2EngineerBuilderSorianEdit',
        Priority = 1000,
        InstanceCount = 2,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 10, 1, 'StructuresNotMex' } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 - categories.HYDROCARBON } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = true,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 2,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T2AADefense',
                    'T2Radar',
                    'T1LandFactory',
                    'T1LandFactory',
                    'T1AirFactory',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T1LandFactory',
                }
            },
            NeedGuard = true,
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3VacantStartingAreaEngineer - drop',
        PlatoonTemplate = 'T3EngineerBuilderSorianEdit',
        Priority = 1000,
        InstanceCount = 1,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 10, 1, 'StructuresNotMex' } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = true,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 2,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T3AADefense',
                    'T2Radar',
                    'T1LandFactory',
                    'T1AirFactory',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                }
            },
            NeedGuard = true,
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianEditEngineerExpansionBuildersSmall',
    BuildersType = 'EngineerBuilder',

    --------------------------------------------------------------------------------
    ---- Builds expansion bases
    --------------------------------------------------------------------------------
    Builder {
        BuilderName = 'SorianEdit T1 Vacant Expansion Area EngineerFull Base',
        PlatoonTemplate = 'EngineerBuilderSorianEdit',
        Priority = 922,
        InstanceCount = 2,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'ExpansionAreaNeedsEngineer', { 'LocationType', 1000, -1000, 10, 1, 'StructuresNotMex' } },
            { UCBC, 'StartLocationsFull', { 'LocationType', 1000, -1000, 100, 2, 'StructuresNotMex' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Expansion Area',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 2,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T1GroundDefense',
                    'T1LandFactory',
                    'T1AADefense',
                    'T1Radar',
                }
            },
            NeedGuard = true,
        }
    },
    Builder {
        BuilderName = 'SorianEdit T1 Vacant Expansion Area Engineer(Fire base)',
        PlatoonTemplate = 'EngineerBuilderSorianEdit',
        Priority = 850,
        InstanceCount = 3,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .7 } },
            { SIBC, 'ExpansionPointNeedsStructure', { 'LocationType', 1000, 'DEFENSE TECH1 STRUCTURE', 20, 3, 0, 1, 2, 'StructuresNotMex' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                MarkerRadius = 20,
                NearMarkerType = 'Expansion Area',
                LocationRadius = 1000,
                ExpansionRadius = 200,
                LocationType = 'LocationType',
                ThreatMin = -20000,
                ThreatMax = 900,
                ThreatRings = 2,
                MarkerUnitCount = 3,
                ThreatType = 'StructuresNotMex',
                MarkerUnitCategory = 'DEFENSE TECH1 STRUCTURE',
                BuildStructures = {
                    'T1GroundDefense',
                    'T1GroundDefense',
                    'T1AADefense',
                    'T1AADefense',
                }
            },
            NeedGuard = true,
        }
    },
    Builder {
        BuilderName = 'SorianEdit T2VacantExpansiongAreaEngineer',
        PlatoonTemplate = 'T2EngineerBuilderSorianEdit',
        Priority = 850,
        InstanceCount = 2,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .7 } },
            { UCBC, 'ExpansionAreaNeedsEngineer', { 'LocationType', 1000, -1000, 0, 2, 'StructuresNotMex' } },
            { UCBC, 'StartLocationsFull', { 'LocationType', 1000, -1000, 0, 2, 'StructuresNotMex' } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 - categories.HYDROCARBON } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                ExpansionBase = true,
                ExpansionRadius = 200,
                NearMarkerType = 'Expansion Area',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 2,
                ThreatType = 'StructuresNotMex',
                BuildStructures = {
                    'T2GroundDefense',
                    'T1LandFactory',
                    'T2AADefense',
                    'T2Radar',
                }
            },
            NeedGuard = true,
        }
    },
}


BuilderGroup {
    BuilderGroupName = 'SorianEditEngineerFirebaseBuilders',
    BuildersType = 'EngineerBuilder',

    --------------------------------------------------------------------------------
    ---- Builds fire bases
    --------------------------------------------------------------------------------
    Builder {
        BuilderName = 'SorianEdit T2 Expansion Area Firebase Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorianEdit',
        Priority = 851,
        InstanceCount = 3,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 - categories.HYDROCARBON } },
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 256,
                NearMarkerType = 'Expansion Area',
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 700,
                ThreatRings = 1,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRATEGIC',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2ShieldDefense',
                    'T2GroundDefense',
                    'T2Radar',
                    'T2Artillery',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2AADefense',
                    'T2GroundDefense',
                    'T2StrategicMissile',
                    'T2Artillery',
                    'T2ShieldDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2Artillery',
                    'T2Artillery',
                    'T2MissileDefense',
                    'T2MissileDefense',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - Cybran',
        PlatoonTemplate = 'CybranT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 700,
                NearMarkerType = 'Expansion Area',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2ShieldDefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2ShieldDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2EngineerSupport',
                    'T2EngineerSupport',
                    'T2ShieldDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T3Artillery',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - Aeon',
        PlatoonTemplate = 'AeonT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 900,
                NearMarkerType = 'Expansion Area',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2ShieldDefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2ShieldDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2EngineerSupport',
                    'T2EngineerSupport',
                    'T2ShieldDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T3Artillery',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - UEF',
        PlatoonTemplate = 'UEFT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 750,
                NearMarkerType = 'Expansion Area',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2ShieldDefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2ShieldDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2EngineerSupport',
                    'T2EngineerSupport',
                    'T2ShieldDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T3Artillery',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - Seraphim',
        PlatoonTemplate = 'SeraphimT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 825,
                NearMarkerType = 'Expansion Area',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2ShieldDefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2ShieldDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2EngineerSupport',
                    'T2EngineerSupport',
                    'T2ShieldDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T3Artillery',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - Cybran - DP',
        PlatoonTemplate = 'CybranT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 700,
                NearMarkerType = 'Defensive Point',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T3ShieldDefense',
                    'T3AADefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T2MissileDefense',
                    'T3ShieldDefense',
                    'T3ShieldDefense',
                    'T3Artillery',
                    'T2StrategicMissile',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - Aeon - DP',
        PlatoonTemplate = 'AeonT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 900,
                NearMarkerType = 'Defensive Point',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T3ShieldDefense',
                    'T3AADefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T2MissileDefense',
                    'T3ShieldDefense',
                    'T3ShieldDefense',
                    'T3Artillery',
                    'T2StrategicMissile',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer Nuke',
        PlatoonTemplate = 'T3EngineerBuilderSorianEdit',
        Priority = 1200,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.STRUCTURE * categories.TECH3 * categories.ANTIMISSILE}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 900,
                NearMarkerType = 'Defensive Point',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T3ShieldDefense',
                    'T3AADefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T3MissileDefense',
                    'T3ShieldDefense',
                    'T3ShieldDefense',
                    'T3StrategicMissile',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - UEF - DP',
        PlatoonTemplate = 'UEFT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 750,
                NearMarkerType = 'Defensive Point',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T3ShieldDefense',
                    'T3AADefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T2MissileDefense',
                    'T3ShieldDefense',
                    'T3ShieldDefense',
                    'T3Artillery',
                    'T2StrategicMissile',
                }
            }
        }
    },
    Builder {
        BuilderName = 'SorianEdit T3 Expansion Area Firebase Engineer - Seraphim - DP',
        PlatoonTemplate = 'SeraphimT3EngineerBuilderSorianEdit',
        Priority = 950,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.3 } },
			{ EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
			{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.25 }},
            { UCBC, 'UnitCapCheckLess', { .85 } },
            { SBC, 'EnemyInT3ArtilleryRange', { 'LocationType', false } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON } },
            --CanBuildFirebase { 500, 500 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = ExBaseTmpl,
                FireBase = true,
                ExpansionRadius = 200,
                FireBaseRange = 825,
                NearMarkerType = 'Defensive Point',
                LocationType = 'LocationType',
                ThreatMin = -10000,
                ThreatMax = 700,
                ThreatRings = 1,
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'STRUCTURE ARTILLERY TECH3',
                MarkerRadius = 20,
                BuildStructures = {
                    'T2RadarJammer',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T2GroundDefense',
                    'T3ShieldDefense',
                    'T3AADefense',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2StrategicMissile',
                    'T2StrategicMissile',
                    'T2Radar',
                    'T3AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                    'T2MissileDefense',
                    'T2Artillery',
                    'T2Artillery',
                    'T2Artillery',
                    'T2MissileDefense',
                    'T3ShieldDefense',
                    'T3ShieldDefense',
                    'T3Artillery',
                    'T2StrategicMissile',
                }
            }
        }
    },
}
	do
	LOG('--------------------- SorianEdit Expansion Builders loaded')
	end
