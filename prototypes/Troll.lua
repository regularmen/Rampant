-- imports

local acidBall = require("utils/AttackBall")
local biterUtils = require("utils/BiterUtils")
local swarmUtils = require("SwarmUtils")
package.path = "../libs/?.lua;" .. package.path
local constants = require("Constants")

-- constants

local troll = {}

local TROLL_UNIT_TIERS = constants.TROLL_UNIT_TIERS
local TROLL_UNIT_VARIATIONS = constants.TROLL_UNIT_VARIATIONS

local TROLL_NEST_TIERS = constants.TROLL_NEST_TIERS
local TROLL_NEST_VARIATIONS = constants.TROLL_NEST_VARIATIONS

local TROLL_WORM_TIERS = constants.TROLL_WORM_TIERS
local TROLL_WORM_VARIATIONS = constants.TROLL_WORM_VARIATIONS

-- imported functions

local buildUnitSpawner = swarmUtils.buildUnitSpawner
local buildWorm = swarmUtils.buildWorm
local createAttackBall = acidBall.createAttackBall
local createRangedAttack = biterUtils.createRangedAttack
local createMeleeAttack = biterUtils.createMeleeAttack

local softSmoke = "the-soft-smoke-rampant"


local makeUnitAlienLootTable = biterUtils.makeUnitAlienLootTable
local makeSpawnerAlienLootTable = biterUtils.makeSpawnerAlienLootTable
local makeWormAlienLootTable = biterUtils.makeWormAlienLootTable

function troll.addFaction()

    local biterLoot = makeUnitAlienLootTable("green")
    local spawnerLoot = makeSpawnerAlienLootTable("green")
    local wormLoot = makeWormAlienLootTable("green")

    -- troll biters
    buildUnitSpawner(
	{
	    unit = {
		name = "troll-biter",

		loot = biterLoot,
		attributes = {
		    explosion = "blood-explosion-small"
		},
		attack = {},
		resistances = {},

		type = "biter",
		scales = {
		    [1] = 0.7,
		    [2] = 0.8,
		    [3] = 0.9,
		    [4] = 1,
		    [5] = 1.1,
		    [6] = 1.2,
		    [7] = 1.3,
		    [8] = 1.4,
		    [9] = 1.5,
		    [10] = 1.6
		},
		tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		tint2 = {r=1, g=0.63, b=0, a=0.4}
	    },

	    unitSpawner = {
		name = "troll-biter-nest",

		loot = spawnerLoot,
		attributes = {},	    
		resistances = {},
		scales = {
		    [1] = 0.7,
		    [2] = 0.8,
		    [3] = 0.9,
		    [4] = 1,
		    [5] = 1.1,
		    [6] = 1.2,
		    [7] = 1.3,
		    [8] = 1.4,
		    [9] = 1.5,
		    [10] = 1.6
		},
		tint = {r=1.0, g=1.0, b=1.0, a=1.0}
	    }
	},

	{
	    unit = {
		{
		    type = "attribute",
		    name = "health",
		    [1] = 30,
		    [2] = 150,
		    [3] = 300,
		    [4] = 500,
		    [5] = 800,
		    [6] = 1500,
		    [7] = 3000,
		    [8] = 6000,
		    [9] = 10000,
		    [10] = 20000
		},
		
		{		
		    type = "attribute",
		    name = "healing",
		    [1] = 0.04,
		    [2] = 0.04,
		    [3] = 0.06,
		    [4] = 0.08,
		    [5] = 0.2,
		    [6] = 0.3,
		    [7] = 0.4,
		    [8] = 0.6,
		    [9] = 0.8,
		    [10] = 1
		},
		
		{		
		    type = "attribute",
		    name = "movement",
		    [1] = 0.16,
		    [2] = 0.16,
		    [3] = 0.155,
		    [4] = 0.15,
		    [5] = 0.155,
		    [6] = 0.15,
		    [7] = 0.15,
		    [8] = 0.15,
		    [9] = 0.15,
		    [10] = 0.15
		},

		{
		    type = "resistance",
		    name = "physical",
		    decrease = {
			[1] = 0,
			[2] = 0,
			[3] = 4,
			[4] = 5,
			[5] = 6,
			[6] = 8,
			[7] = 10,
			[8] = 12,
			[9] = 14,
			[10] = 15
		    },
		    percent = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 10,
			[5] = 12,
			[6] = 12,
			[7] = 13,
			[8] = 13,
			[9] = 14,
			[10] = 15
		    }
		},
		
		{
		    type = "resistance",
		    name = "explosion",
		    decrease = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 10,
			[8] = 12,
			[9] = 14,
			[10] = 15
		    },
		    percent = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 10,
			[5] = 12,
			[6] = 12,
			[7] = 13,
			[8] = 13,
			[9] = 14,
			[10] = 15
		    }
		},

		{
		    type = "resistance",
		    name = "fire",
		    decrease = {
			[1] = -15,
			[2] = -15,
			[3] = -20,
			[4] = -20,
			[5] = -25,
			[6] = -25,
			[7] = -30,
			[8] = -30,
			[9] = -35,
			[10] = -45
		    },
		    percent = {
			[1] = -100,
			[2] = -100,
			[3] = -100,
			[4] = -120,
			[5] = -120,
			[6] = -160,
			[7] = -160,
			[8] = -200,
			[9] = -200,
			[10] = -240
		    }
		}
	    },
	    
	    unitSpawner = {

		{		
		    type = "attribute",
		    name = "health",
		    [1] = 700,
		    [2] = 1000,
		    [3] = 1500,
		    [4] = 3000,
		    [5] = 5000,
		    [6] = 7000,
		    [7] = 10000,
		    [8] = 14000,
		    [9] = 20000,
		    [10] = 30000
		},

		{		
		    type = "attribute",
		    name = "healing",
		    [1] = 0.08,
		    [2] = 0.1,
		    [3] = 0.2,
		    [4] = 0.3,
		    [5] = 0.4,
		    [6] = 0.5,
		    [7] = 0.8,
		    [8] = 1,
		    [9] = 1.2,
		    [10] = 1.5
		},

		{		
		    type = "attribute",
		    name = "evolutionRequirement",
		    [1] = 0,
		    [2] = 0.12,
		    [3] = 0.22,
		    [4] = 0.32,
		    [5] = 0.42,
		    [6] = 0.52,
		    [7] = 0.62,
		    [8] = 0.72,
		    [9] = 0.82,
		    [10] = 0.92
		},

		{
		    type = "resistance",
		    name = "fire",
		    decrease = {
			[1] = -15,
			[2] = -15,
			[3] = -20,
			[4] = -20,
			[5] = -25,
			[6] = -25,
			[7] = -30,
			[8] = -30,
			[9] = -35,
			[10] = -45
		    },
		    percent = {
			[1] = -100,
			[2] = -100,
			[3] = -100,
			[4] = -120,
			[5] = -120,
			[6] = -160,
			[7] = -160,
			[8] = -200,
			[9] = -200,
			[10] = -240
		    }
		}
	    }
	},

	createMeleeAttack,

	{
	    unit = TROLL_UNIT_VARIATIONS,
	    unitSpawner = TROLL_NEST_VARIATIONS
	},

	{
	    unit = TROLL_UNIT_TIERS,
	    unitSpawner = TROLL_NEST_TIERS
	}
    )

    -- troll spitters
    buildUnitSpawner(
	{
	    unit = {
		name = "troll-spitter",

		loot = biterLoot,
		attributes = {
		    explosion = "blood-explosion-small"
		},
		attack = {
		    type = "projectile",
		    softSmokeName = softSmoke
		},
		resistances = {},

		type = "spitter",
		scales = {
		    [1] = 0.7,
		    [2] = 0.8,
		    [3] = 0.9,
		    [4] = 1,
		    [5] = 1.1,
		    [6] = 1.2,
		    [7] = 1.3,
		    [8] = 1.4,
		    [9] = 1.5,
		    [10] = 1.6
		},
		attackName = "troll-spitter",
		tint = {r=0.56, g=0.46, b=0.42, a=0.65},
		pTint = {r=0, g=1, b=1, a=0.5},
		sTint = {r=0, g=1, b=1, a=0.5}
	    },

	    unitSpawner = {
		name = "troll-spitter-nest",

		loot = spawnerLoot,
		attributes = {},
		resistances = {},
		
		scales = {
		    [1] = 0.7,
		    [2] = 0.8,
		    [3] = 0.9,
		    [4] = 1,
		    [5] = 1.1,
		    [6] = 1.2,
		    [7] = 1.3,
		    [8] = 1.4,
		    [9] = 1.5,
		    [10] = 1.6
		},
		tint = {r=0.99, g=0.09, b=0.09, a=1}
	    }
	},

	{
	    unit = {
		{		
		    type = "attribute",
		    name = "health",
		    [1] = 20,
		    [2] = 100,
		    [3] = 400,
		    [4] = 700,
		    [5] = 1500,
		    [6] = 2000,
		    [7] = 3000,
		    [8] = 6000,
		    [9] = 5000,
		    [10] = 9000
		},
		
		{		
		    type = "attribute",
		    name = "healing",
		    [1] = 0.02,
		    [2] = 0.08,
		    [3] = 0.1,
		    [4] = 0.2,
		    [5] = 0.3,
		    [6] = 0.5,
		    [7] = 0.6,
		    [8] = 0.7,
		    [9] = 0.8,
		    [10] = 1
		},
		
		{
		    type = "attribute",
		    name = "movement",
		    [1] = 0.165,
		    [2] = 0.16,
		    [3] = 0.16,
		    [4] = 0.15,
		    [5] = 0.15,
		    [6] = 0.14,
		    [7] = 0.14,
		    [8] = 0.13,
		    [9] = 0.13,
		    [10] = 0.12
		},

		{
		    type = "resistance",
		    name = "explosion",
		    percent = {
			[1] = 0,
			[2] = 0,
			[3] = 10,
			[4] = 10,
			[5] = 20,
			[6] = 20,
			[7] = 30,
			[8] = 30,
			[9] = 40,
			[10] = 40
		    }
		},

		{
		    type = "resistance",
		    name = "fire",
		    decrease = {
			[1] = -15,
			[2] = -15,
			[3] = -20,
			[4] = -20,
			[5] = -25,
			[6] = -25,
			[7] = -30,
			[8] = -30,
			[9] = -35,
			[10] = -45
		    },
		    percent = {
			[1] = -100,
			[2] = -100,
			[3] = -100,
			[4] = -120,
			[5] = -120,
			[6] = -160,
			[7] = -160,
			[8] = -200,
			[9] = -200,
			[10] = -240
		    }
		}

	    },
	    
	    unitSpawner = {
		
		{		
		    type = "attribute",
		    name = "health",
		    [1] = 700,
		    [2] = 1000,
		    [3] = 1500,
		    [4] = 3000,
		    [5] = 5000,
		    [6] = 7000,
		    [7] = 10000,
		    [8] = 14000,
		    [9] = 20000,
		    [10] = 30000
		},

		{		
		    type = "attribute",
		    name = "healing",
		    [1] = 0.02,
		    [2] = 0.1,
		    [3] = 0.2,
		    [4] = 0.3,
		    [5] = 0.4,
		    [6] = 0.5,
		    [7] = 0.8,
		    [8] = 1,
		    [9] = 1.2,
		    [10] = 1.4
		},

		{
		    type = "resistance",
		    name = "fire",
		    decrease = {
			[1] = -15,
			[2] = -15,
			[3] = -20,
			[4] = -20,
			[5] = -25,
			[6] = -25,
			[7] = -30,
			[8] = -30,
			[9] = -35,
			[10] = -45
		    },
		    percent = {
			[1] = -100,
			[2] = -100,
			[3] = -100,
			[4] = -120,
			[5] = -120,
			[6] = -160,
			[7] = -160,
			[8] = -200,
			[9] = -200,
			[10] = -240
		    }
		}
	    }
	},

	function (attributes)
	    
	    return createRangedAttack(attributes,
				      createAttackBall(attributes),
				      spitterattackanimation(attributes.scale,
							     attributes.tint))
	end,
	
	{
	    unit = TROLL_UNIT_VARIATIONS,
	    unitSpawner = TROLL_NEST_VARIATIONS
	},

	{
	    unit = TROLL_UNIT_TIERS,
	    unitSpawner = TROLL_NEST_TIERS
	}
    )

    -- troll worms
    buildWorm(
	{
	    name = "troll-worm",

	    loot = wormLoot,
	    attributes = {},
	    attack = {
		type = "projectile",
		softSmokeName = softSmoke
	    },
	    resistances = {},

	    scales = {
		    [1] = 0.7,
		    [2] = 0.8,
		    [3] = 0.9,
		    [4] = 1,
		    [5] = 1.1,
		    [6] = 1.2,
		    [7] = 1.3,
		    [8] = 1.4,
		    [9] = 1.5,
		    [10] = 1.6
		},
	    attackName = "troll-worm",
	    tint = {r=0.56, g=0.46, b=0.42, a=0.65},
	    pTint = {r=0, g=1, b=1, a=0.5},
	    sTint = {r=0, g=1, b=1, a=0.5}
	},

	{
	    {    
		type = "attribute",
		name = "health",
		[1] = 400,
		[2] = 700,
		[3] = 1000,
		[4] = 1500,
		[5] = 1800,
		[6] = 2000,
		[7] = 3000,
		[8] = 5000,
		[9] = 7500,
		[10] = 10500
	    },
	    
	    {    
		type = "attribute",
		name = "healing",
		[1] = 0.08,
		[2] = 0.08,
		[3] = 0.085,
		[4] = 0.1,
		[5] = 0.2,
		[6] = 0.3,
		[7] = 0.4,
		[8] = 0.5,
		[9] = 0.8,
		[10] = 1
	    },

	    {
		type = "resistance",
		name = "fire",
		decrease = {
		    [1] = -15,
		    [2] = -15,
		    [3] = -20,
		    [4] = -20,
		    [5] = -25,
		    [6] = -25,
		    [7] = -30,
		    [8] = -30,
		    [9] = -35,
		    [10] = -45
		},
		percent = {
		    [1] = -100,
		    [2] = -100,
		    [3] = -100,
		    [4] = -120,
		    [5] = -120,
		    [6] = -160,
		    [7] = -160,
		    [8] = -200,
		    [9] = -200,
		    [10] = -240
		}
	    }
	},

	function (attributes)
	    return createRangedAttack(attributes, createAttackBall(attributes))
	end,

	TROLL_WORM_VARIATIONS,
	TROLL_WORM_TIERS
    )
end

return troll
