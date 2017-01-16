fall_stones_config = Settings(minetest.get_worldpath().."/fall_stones.conf")

local conf_table = fall_stones_config:to_table()

local defaults = {
	enable_crafting_recipes = "true",
	enable_falling_clay = "true",
	enable_falling_cobble = "true",
	enable_falling_dirt = "true",
	enable_falling_ice = "true",
	enable_falling_snow = "true",
	enable_falling_stone = "true",
	enable_falling_stonebrick = "true",
	rarity_regular_clay = "4",
	rarity_regular_cobble = "4",
	rarity_regular_dirt = "3",
	rarity_regular_stone_brick = "4",
	rarity_falling_clay = "2",
	rarity_falling_cobble = "2",
	rarity_falling_dirt = "2",
	rarity_falling_ice = "2",
	rarity_falling_snow = "2",
	rarity_falling_stone = "2",
	rarity_falling_stonebrick = "2"
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		fall_stones_config:set(k, v)
	end
end
fall_stones_config:write()

fall_stones_debug_light=0;

if fall_stones_config:get_bool("enable_falling_clay") then 
	minetest.register_node("fall_stones:fall_clay", {
		description = "Falling Clay",
		light_source = fall_stones_debug_light,
		tiles = {"default_clay.png^[colorize:#444444:60"},		-- a little darker than normal clay
		groups = {crumbly=3, falling_node = 1},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:clay_lump 5'
	})
end

if fall_stones_config:get_bool("enable_falling_cobble") then 
	minetest.register_node("fall_stones:fall_cobble", {
		description = "Fall Cobble",
		light_source = fall_stones_debug_light,
		tiles = {"default_cobble.png"},
		groups = {cracky=2, falling_node = 1, stone=2},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:gravel'
	})
end

if fall_stones_config:get_bool("enable_falling_dirt") then 
	minetest.register_node("fall_stones:fall_dirt", {
		description = "Falling Dirt",
		light_source = fall_stones_debug_light,
		tiles = {"default_dirt.png"},
		groups = {crumbly=3, falling_node = 1},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:dirt'
	})
end

if fall_stones_config:get_bool("enable_falling_ice") then 
	minetest.register_node("fall_stones:fall_ice", {
		description = "Falling Ice",
		light_source = fall_stones_debug_light,
		paramtype = "light",
		tiles = {"default_ice.png"},
		groups = {crumbly=3, falling_node = 1, puts_out_fire = 1, cools_lava = 1},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:ice'
	})
end

if fall_stones_config:get_bool("enable_falling_snow") then 
	minetest.register_node("fall_stones:fall_snow", {
		description = "Falling Snow",
		light_source = fall_stones_debug_light,
		tiles = {"default_snow.png"},
		groups = {crumbly=2, falling_node = 1, puts_out_fire = 1, cools_lava = 1},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:snowball'
	})
end

if fall_stones_config:get_bool("enable_falling_stone") then 
	minetest.register_node("fall_stones:fall_stone", {
		description = "Fall Stone",
		light_source = fall_stones_debug_light,
		tiles = {"default_stone.png"},
		groups = {cracky=2, falling_node = 1, stone=2},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:stone'
	})
end

if fall_stones_config:get_bool("enable_falling_stonebrick") then 
	minetest.register_node("fall_stones:fall_stone_brick", {
		description = "Fall Stone Brick",
		light_source = fall_stones_debug_light,
		tiles = {"default_stone_brick.png"},
		groups = {cracky=2, falling_node = 1, stone=2},
		sounds = default.node_sound_sand_defaults(),
		drop = 'default:stone'
	})
end

if fall_stones_config:get_bool("enable_crafting_recipes") then 
	if fall_stones_config:get_bool("enable_falling_clay") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_clay 2',
			recipe = { 'default:clay', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
	if fall_stones_config:get_bool("enable_falling_cobble") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_cobble 2',
			recipe = { 'default:cobble', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
	if fall_stones_config:get_bool("enable_falling_dirt") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_dirt 2',
			recipe = { 'default:dirt', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
	if fall_stones_config:get_bool("enable_falling_ice") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_ice 2',
			recipe = { 'default:ice', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
	if fall_stones_config:get_bool("enable_falling_snow") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_snow 2',
			recipe = { 'default:snowblock', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
	if fall_stones_config:get_bool("enable_falling_stone") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_stone 2',
			recipe = { 'default:stone', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
	if fall_stones_config:get_bool("enable_falling_stonebrick") then 
		minetest.register_craft({
			type = "shapeless",
			output = 'fall_stones:fall_stone_brick 2',
			recipe = { 'default:stonebrick', 'default:gravel', 'default:gravel', 'default:gravel'}
		})
	end
end

local modpath = minetest.get_modpath("fall_stones")

dofile(modpath.."/oregen.lua")

minetest.log("info", "[fall_stones] Done loading main.")
