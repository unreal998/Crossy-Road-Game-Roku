function init()
    m.context = m.top
    m.ENEMY_SIZE = 120
    m.context.observeField("direction", "createEnemyCar")
   
end function

function createEnemyCar()
    tile = m.context.findNode("carTexture")
    if (m.context.direction = "horiz")
        tile.uri = "pkg:/images/carCharacterHorizontal.jpg"
    else if (m.context.direction = "vert")
        tile.uri = "pkg:/images/carCharacterVertical.jpg"
    end if
    tile.width = m.ENEMY_SIZE
    tile.height = m.ENEMY_SIZE
    tile.translation = [0, 0]
    m.context.appendChild(tile)
end function