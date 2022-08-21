local games = {
    ['5956785391'] = 'ProjectSlayers',
    ['6152116144'] = 'ProjectSlayers',
    ['2753915549'] = 'BloxFruits',
    ['4442272183'] = 'BloxFruits',
    ['7449423635'] = 'BloxFruits',
}

game:HttpGet(('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/%s.lua'):format(games[tostring(game.PlaceId)]))
