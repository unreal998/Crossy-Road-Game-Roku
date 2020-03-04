function init()
    m.context = m.top
    m.ENEMY_SIZE = 120
    createEnemyCar()
end function

function createEnemyCar()
    tile = m.context.findNode("carTexture")
    tile.uri = "pkg:/images/carCharacter.jpg"
    tile.width = m.ENEMY_SIZE
    tile.height = m.ENEMY_SIZE
    tile.translation = [0, 0]
    m.context.appendChild(tile)
end function