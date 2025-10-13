local item = sbar.add("item", {
	position = "left",
	icon = {
		string = "",
		drawing = true,
	},
})

item:subscribe("front_app_switched", function(env)
	item:set({
		label = {
			string = env.INFO,
		},
	})
end)
