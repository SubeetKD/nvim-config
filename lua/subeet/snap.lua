local has_snap, snap = pcall(require, "snap")

if not has_snap then
	return
end

snap.register.map({"n"},{"<leader>tf"}, function ()
	snap.run {
		producer = snap.get'consumer.fzy'(snap.get'producer.ripgrep.file'),
		select = snap.get'select.file'.select,
		multiselect = snap.get'select.file'.multiselect,
	}
end)
