require "ATA2TuningTable"

local function copy(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
  return res
end

local carRecipe = "ATAJeepRecipes"

local NewCarTuningTable = {}
NewCarTuningTable["ATAJeep"] = {
    addPartsFromVehicleScript = "",
    parts = {}
}

NewCarTuningTable["ATAJeep"].parts["ATA2Bumper"] = {
    Bumper1 = {
        spawnChance = 100,
        icon = "media/ui/tuning2/jeep_bumper_1.png",
        name = "IGUI_ATA2_Bumper_Classic",
        category = "Bumpers",
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            transmitFirstItemCondition = true,
            use = {
                Autotsar__ATAJeepBumper1Item = 1,
                Screws=5,
            },
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            time = 15, 
        },
        uninstall = {
            animation = "ATA_PickLock",
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
            },
            transmitConditionOnFirstItem = true,
            result = {
                Autotsar__ATAJeepBumper1Item = 1,
            },
            time = 15,
        }
    },
    Bumper2 = {
        spawnChance = 50,
        icon = "media/ui/tuning2/jeep_bumper_2.png",
        name = "IGUI_ATA2_Bumper_Winch",
        category = "Bumpers",
        protection = {"EngineDoor"},
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            transmitFirstItemCondition = true,
            use = {
                Autotsar__ATAJeepBumper2Item = 1,
                Screws = 10,
            },
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 4,
            },
            recipes = {"Basic Mechanics", carRecipe},
            time = 20, 
        },
        uninstall = {
            animation = "ATA_PickLock",
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 4,
            },
            recipes = {"Basic Mechanics"},
            transmitConditionOnFirstItem = true,
            result = {
                Autotsar__ATAJeepBumper2Item = 1,
                Screws=5,
            },
            time = 20,
        }
    },
    Bumper3 = {
        spawnChance = 25,
        icon = "media/ui/tuning2/jeep_bumper_3.png",
        name = "IGUI_ATA2_Bullbar",
        category = "Bumpers",
        protection = {"EngineDoor", "HeadlightLeft", "HeadlightRight"},
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            transmitFirstItemCondition = true,
            use = {
                Autotsar__ATAJeepBumper3Item = 1,
                Screws = 10,
            },
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 5,
            },
            recipes = {"Basic Mechanics", carRecipe},
            time = 30, 
        },
        uninstall = {
            animation = "ATA_PickLock",
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 5,
            },
            recipes = {"Basic Mechanics"},
            transmitConditionOnFirstItem = true,
            result = {
                Autotsar__ATAJeepBumper3Item = 1,
                Screws=5,
            },
            time = 30,
        }
    },
    Bumper4 = {
        icon = "media/ui/tuning2/jeep_bumper_4.png",
        name = "IGUI_ATA2_Bumper_Lethal",
        category = "Bumpers",
        protection = {"EngineDoor", "HeadlightLeft", "HeadlightRight"}, 
        removeIfBroken = true,
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            use = {
                MetalPipe = 6,
                MetalBar = 4,
                SheetMetal = 2,
                SmallSheetMetal = 4,
                BlowTorch = 10,
                Screws=15,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 6,
                MetalWelding = 7,
            },
            recipes = {"Basic Mechanics", carRecipe},
            time = 65, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenLow",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 3,
            },
            recipes = {"Basic Mechanics"},
            result = "auto",
            time = 65,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWindowFrontLeft"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_side.png",
        category = "Protection",
        protection = {"WindowFrontLeft"},
        removeIfBroken = true,
        disableOpenWindowFromSeat = "SeatFrontLeft",
        install = {
            weight = "auto",
            area = "SeatFrontLeft",
            use = {
                MetalBar = 4,
                BlowTorch = 4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                Mechanics = 2,
                MetalWelding = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"WindowFrontLeft"},
            time = 65, 
        },
        uninstall = {
            area = "SeatFrontLeft",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                Mechanics = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWindowFrontRight"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_side.png",
        category = "Protection",
        protection = {"WindowFrontRight"},
        disableOpenWindowFromSeat = "SeatFrontRight",
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "SeatFrontRight",
            use = {
                MetalBar = 4,
                BlowTorch = 4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                Mechanics = 2,
                MetalWelding = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"WindowFrontRight"},
            time = 65, 
        },
        uninstall = {
            area = "SeatFrontRight",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                Mechanics = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWindowRearLeft"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_side.png",
        category = "Protection",
        protection = {"WindowRearLeft"},
        disableOpenWindowFromSeat = "SeatRearLeft",
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "SeatRearLeft",
            use = {
                MetalBar = 4,
                BlowTorch = 4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                Mechanics = 2,
                MetalWelding = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"WindowRearLeft"},
            time = 65, 
        },
        uninstall = {
            area = "SeatRearLeft",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                Mechanics = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWindowRearRight"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_side.png",
        category = "Protection",
        protection = {"WindowRearRight"},
        disableOpenWindowFromSeat = "SeatRearRight",
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "SeatRearRight",
            use = {
                MetalBar = 4,
                BlowTorch = 4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                Mechanics = 2,
                MetalWelding = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"WindowRearRight"},
            time = 65, 
        },
        uninstall = {
            area = "SeatRearRight",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                Mechanics = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWindshield"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_windshield.png",
        category = "Protection",
        protection = {"Windshield"},
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "TireFrontLeft",
            use = {
                MetalPipe = 2,
                SmallSheetMetal = 4,
                SheetMetal = 1,
                MetalBar = 4,
                Screws = 10,
                BlowTorch = 6,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
                MetalWelding = 4,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"Windshield"},
            time = 65, 
        },
        uninstall = {
            area = "TireFrontLeft",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                Mechanics = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWindshieldRear"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_windshield.png",
        category = "Protection",
        protection = {"WindshieldRear", "TrunkDoor", "TruckBed"},
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "TireRearRight",
            use = {
                MetalPipe = 4,
                MetalBar = 4,
                SmallSheetMetal = 2,
                Screws = 10,
                BlowTorch = 6,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                Mechanics = 3,
                MetalWelding = 4,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"WindshieldRear"},
            time = 65, 
        },
        uninstall = {
            area = "TireRearRight",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                Mechanics = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2RoofBase"] = {
    Default = {
        icon = "media/ui/tuning2/roof_base.png",
        category = "Trunks",
        install = {
            area = "ATARoof",
            weight = "auto",
            use = {
                MetalPipe = 6,
                BlowTorch = 5,
                Screws = 10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            recipes = {"Basic Mechanics", carRecipe},
            skills = {
                MetalWelding = 4,
            },
            time = 65, 
        },
        uninstall = {
            area = "ATARoof",
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=3,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            recipes = {"Basic Mechanics"},
            result = "auto",
            requireUninstalled = {"ATA2InteractiveTrunkRoofRack", "ATA2RoofTent"},
            time = 65,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2RoofTent"] = {
    Default = {
        icon = "media/ui/tuning2/roof_tent.png",
        category = "Another",
        spawnChance = 20,
        install = {
            weight = "auto",
            area = "ATARoof",
            use = {
                Autotsar__ATAJeepRoofTentItem = 1,
                Screws=10,
            },
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"ATA2RoofBase"},
            requireUninstalled = {"ATA2InteractiveTrunkRoofRack"},
            time = 65, 
        },
        uninstall = {
            area = "ATARoof",
            animation = "ATA_IdleLeverOpenHigh",
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
            },
            recipes = {"Basic Mechanics"},
            result = {
                Autotsar__ATAJeepRoofTentItem = 1,
                Screws=5,
            },
            time = 65,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2InteractiveTrunkRoofRack"] = {
    ATA_Jeep_roofrack = {
        icon = "media/ui/tuning2/roof_rack_2.png",
        category = "Trunks",
        containerCapacity = 60,
        interactiveTrunk = {
            filling = {"ATA_Jeep_roofrack_bag1", "ATA_Jeep_roofrack_bag2", "ATA_Jeep_roofrack_bag3"},
            items = {
                {
                    itemTypes = {"BoxOfJars"},
                    modelNameByCount = {"ATA_Jeep_roofrack_BoxOfJars1", "ATA_Jeep_roofrack_BoxOfJars2", },
                },
                {
                    itemTypes = {"BucketEmpty", "BucketConcreteFull", "BucketPlasterFull", "BucketWaterFull", },
                    modelNameByCount = {"ATA_Jeep_roofrack_Bucket"},
                },
                {
                    itemTypes = {"FishingNet", "BrokenFishingNet", },
                    modelNameByCount = {"ATA_Jeep_roofrack_FishingNet"},
                },
                {
                    itemTypes = {"Generator"},
                    modelNameByCount = {"ATA_Jeep_roofrack_Generator"},
                },
                {
                    itemTypes = {"Saw",},
                    modelNameByCount = {"ATA_Jeep_roofrack_Hacksaw"},
                },
                {
                    itemTypes = {"Log", "LogStacks2", "LogStacks3", "LogStacks4", "Plank", },
                    modelNameByCount = {"ATA_Jeep_roofrack_Log"},
                },
                {
                    itemTypes = {"LugWrench"},
                    modelNameByCount = {"ATA_Jeep_roofrack_LugWrench"},
                },
                {
                    itemTypes = {"PropaneTank"},
                    modelNameByCount = {"ATA_Jeep_roofrack_PropaneTank1", "ATA_Jeep_roofrack_PropaneTank2", },
                },
                {
                    itemTypes = {"TrapCage"},
                    modelNameByCount = {"ATA_Jeep_roofrack_w001"},
                },
            }
        },
        install = {
            weight = "auto",
            use = {
                MetalPipe = 12,
                MetalBar = 4,
                BlowTorch=10,
                Screws=10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 5,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"ATA2RoofBase"},
            requireUninstalled = {"ATA2RoofTent"},
            time = 65, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 65,
        }
    }
}

NewCarTuningTable["ATAJeep"].parts["ATA2InteractiveTrunkWheelRack"] = {
    WheelRack = {
        icon = "media/ui/tuning2/wheel_rack_1.png",
        category = "Trunks",
        containerCapacity = 25,
        interactiveTrunk = {
            filling = {"Cooler"},
            items = {
                {
                    itemTypes = {"Bag_BigHikingBag", "Bag_NormalHikingBag"},
                    modelNameByCount = {"BigHikingBag"},
                },
                {
                    itemTypes = {"Jack"},
                    modelNameByCount = {"Jack"},
                },
                {
                    itemTypes = {"Extinguisher"},
                    modelNameByCount = {"Extinguisher"},
                },
                {
                    itemTypes = {"PetrolCan", "EmptyPetrolCan"},
                    modelNameByCount = {"GasCan"},
                },
                {
                    itemTypes = {"Radio.RadioBlack", "Radio.RadioRed"},
                    modelNameByCount = {"Radio"},
                },
                {
                    itemTypes = {"Bag_JanitorToolbox"},
                    modelNameByCount = {"ToolBox"},
                },
                {
                    itemTypes = {"TirePump"},
                    modelNameByCount = {"TirePump"},
                },
            }
        },
        install = {
            weight = "auto",
            use = {
                MetalPipe = 4,
                MetalBar = 4,
                BlowTorch=5,
                Screws=10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 3,
            },
            recipes = {"Basic Mechanics", carRecipe},
            requireInstalled = {"ATASpareWheel"},
            time = 40, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=3,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            recipes = {"Basic Mechanics"},
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 40,
        }
    }
}


NewCarTuningTable["ATAJeep"].parts["ATA2VisualSnorkel"] = {
    Default = {
        spawnChance = 40,
        icon = "media/ui/tuning2/snorkel.png",
        category = "Another",
        install = {
            transmitFirstItemCondition = true,
            use = {
                Autotsar__ATAJeepSnorkelItem = 1,
                Screws=10,
            },
            tools = {
                primary = "Base.Screwdriver",
            },
            skills = {
                Mechanics = 3,
            },
            requireInstalled = {"TrunkDoor"},
            recipes = {"Basic Mechanics", carRecipe},
            time = 30,
        },
        uninstall = {
            transmitConditionOnFirstItem = true,
            tools = {
                primary = "Base.Screwdriver",
            },
            skills = {
                Mechanics = 3,
            },
            recipes = {"Advanced Mechanics"},
            result = {
                Autotsar__ATAJeepSnorkelItem = 1,
                Screws=5,
            },
            time = 30,
        }
    }
}


NewCarTuningTable["ATAJeep"].parts["ATA2ProtectionWheels"] = {
    ATAProtection = {
        removeIfBroken = true,
        icon = "media/ui/tuning2/wheel_chain.png",
        category = "Protection", 
        protectionModel = true, 
        protection = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"}, 
        install = { 
            sound = "ATA2InstallWheelChain",
            transmitFirstItemCondition = true,
            use = { 
                ATAProtectionWheelsChain = 1,
            },
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
            },
            recipes = {"Basic Tuning"},
            requireInstalled = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"},
            time = 65, 
        },
        uninstall = {
            sound = "ATA2InstallWheelChain",
            transmitFirstItemCondition = true,
            tools = {
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
            },
            result = {
                ATAProtectionWheelsChain = 1,
            },
            time = 40,
        }
    }
}


NewCarTuningTable["ATAJeepArcher"] = NewCarTuningTable["ATAJeep"]
NewCarTuningTable["ATAJeepRubicon"] = NewCarTuningTable["ATAJeep"]
NewCarTuningTable["ATAJeepClassic"] = NewCarTuningTable["ATAJeep"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
