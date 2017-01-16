local fall_stones_params = {offset = 0, scale = 1, spread = {x = 8, y = 8, z = 8}, seed = 221, octaves = 2, persist = 0.7}
local fall_stones_threshhold = 0.2

local conf_table = fall_stones_config:to_table()

fall_stones_rarity_reg_clay = conf_table["rarity_regular_clay"]
if type(fall_stones_rarity_reg_clay) ~= "number" then fall_stones_rarity_reg_clay=5 end
fall_stones_rarity_reg_cobble = conf_table["rarity_regular_cobble"]
if type(fall_stones_rarity_reg_cobble) ~= "number" then fall_stones_rarity_reg_cobble=5 end
fall_stones_rarity_reg_dirt = conf_table["rarity_regular_dirt"]
if type(fall_stones_rarity_reg_dirt) ~= "number" then fall_stones_rarity_reg_dirt=5 end
fall_stones_rarity_reg_stbrick = conf_table["rarity_regular_stone_brick"]
if type(fall_stones_rarity_reg_stbrick) ~= "number" then fall_stones_rarity_reg_stbrick=5 end

fall_stones_rarity_falling_clay = conf_table["rarity_falling_clay"]
if type(fall_stones_rarity_falling_clay) ~= "number" then fall_stones_rarity_falling_clay=5 end
fall_stones_rarity_falling_cobble = conf_table["rarity_falling_cobble"]
if type(fall_stones_rarity_falling_cobble) ~= "number" then fall_stones_rarity_falling_cobble=5 end
fall_stones_rarity_falling_dirt = conf_table["rarity_falling_dirt"]
if type(fall_stones_rarity_falling_dirt) ~= "number" then fall_stones_rarity_falling_dirt=5 end
fall_stones_rarity_falling_stbrick = conf_table["rarity_falling_stone_brick"]
if type(fall_stones_rarity_falling_stbrick) ~= "number" then fall_stones_rarity_falling_stbrick=5 end

fall_stones_rarity_falling_ice = conf_table["rarity_falling_ice"]
if type(fall_stones_rarity_falling_ice) ~= "number" then fall_stones_rarity_falling_ice=5 end
fall_stones_rarity_falling_dirt = conf_table["rarity_falling_snow"]
if type(fall_stones_rarity_falling_snow) ~= "number" then fall_stones_rarity_falling_snow=5 end
fall_stones_rarity_falling_dirt = conf_table["rarity_falling_stone"]
if type(fall_stones_rarity_falling_stone) ~= "number" then fall_stones_rarity_falling_stone=5 end



-- generate regular clay and falling clay
local rare=tonumber(fall_stones_rarity_reg_clay)
if rare>0 then
	minetest.register_ore({
		ore_type         = "blob",
		ore              = "default:clay",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		clust_size       = 5,
		y_min       = -11000,
		y_max       = -1000,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

local rare=tonumber(fall_stones_rarity_falling_clay)
if rare>0 then
	minetest.register_ore({
		ore_type         = "blob",
		ore              = "fall_stones:fall_clay",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		clust_size       = 4,
		y_min       = -24000,
		y_max       = -8000,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

-- generate regular dirt and falling dirt
local rare=tonumber(fall_stones_rarity_reg_dirt)
if rare>0 then
	minetest.register_ore({
		ore_type         = "blob",
		ore              = "default:dirt",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		clust_size       = 5,
		y_min       = -31000,
		y_max       = -1000,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

local rare=tonumber(fall_stones_rarity_falling_dirt)
if rare>0 then
	minetest.register_ore({
		ore_type         = "blob",
		ore              = "fall_stones:fall_dirt",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		clust_size       = 4,
		y_min       = -10000,
		y_max       = 150,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

-- generate cobble and falling cobble
local rare=tonumber(fall_stones_rarity_reg_cobble)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "default:cobble",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		column_height_max  = 4,
		y_min       = -750,
		y_max       = 150,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

local rare=tonumber(fall_stones_rarity_falling_cobble)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "fall_stones:fall_cobble",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		column_height_max  = 3,
		y_min       = -750,
		y_max       = 150,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

-- generate falling ice and snow
local rare=tonumber(fall_stones_rarity_falling_ice)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "fall_stones:fall_ice",
		wherein          = "default:ice",
		clust_scarcity   = 30*rare,
		column_height_max  = 3,
		y_min       = -1000,
		y_max       = 1000,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

local rare=tonumber(fall_stones_rarity_falling_snow)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "fall_stones:fall_snow",
		wherein          = "default:snowblock",
		clust_scarcity   = 30*rare,
		column_height_max  = 2,
		y_min       = -1000,
		y_max       = 1000,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

-- generate falling stone
local rare=tonumber(fall_stones_rarity_falling_stone)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "fall_stones:fall_stone",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		column_height_max  = 3,
		y_min       = -7500,
		y_max       = -1500,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})

	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "fall_stones:fall_stone",
		wherein          = "default:stone",
		clust_scarcity   = 60*rare,
		column_height_max  = 5,
		y_min       = -31000,
		y_max       = -7500,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

-- generate stonebrick and falling stonebrick
local rare=tonumber(fall_stones_rarity_reg_stbrick)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "default:stonebrick",
		wherein          = "default:stone",
		clust_scarcity   = 90,
		column_height_max  = 3,
		y_min       = -15500,
		y_max       = -4500,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end

local rare=tonumber(fall_stones_rarity_falling_stbrick)
if rare>0 then
	minetest.register_ore({
		ore_type         = "sheet",
		ore              = "fall_stones:fall_stone_brick",
		wherein          = "default:stone",
		clust_scarcity   = 180,
		column_height_max  = 3,
		y_min       = -20000,
		y_max       = -6000,
		noise_params     = fall_stones_params,
		noise_threshhold = fall_stones_threshhold,
	})
end


minetest.log("info", "[fall_stones] Done loading oregen.lua.")