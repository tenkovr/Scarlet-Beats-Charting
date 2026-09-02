local module = {}
module.id = 000000000 -- id of song for datastore, DONT CHANGE AFTER SONG IS ADDED TO SBF
module.music = 000000000 -- song rbxassetid, separate incase audio needs to be reuploaded
module.offset = 100 -- offset specific for song if needed (default 100)
module.maxcombo = 0 -- note counts as 1, hold counts as 2, need to manually calculate (sorry)
module.artist = "Fumo" -- artist
module.mapper = "Fumo" -- mapper
module.time = "2:00" -- time of song when it ends (could be used for ending long songs early maybe)
module.bpm = 150 -- bpm, doesn't affect gameplay
module.art = "rbxassetid://" -- art needs to use template
module.fullart = "rbxassetid://" -- art for songcard (256x100 px)
module.new = false

-- difficulty
module.difficulty = 5 -- difficulty, choose one
module.plus = "+" -- shows up as + sign in name
module.sort = 55 -- basically difficulty * 10, for detailed sorting of songs (some + might be more + than others)

-- {ms, note type}
-- note type: 1 = left, 2 = up, 3 = down, 4 = right
module.notes = {

}

return module
