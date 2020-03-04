function init()
    m.context = m.top
    m.context.layoutDirection = "horiz"
    m.TILE_WIDTH_SIZE = 192
    m.TILE_HEIGHT_SIZE = 135
    createTilesLine()
end function

function createTilesLine()
    for i = 0 to 10
        tile = createObject("roSGNode", "Poster")
        tile.uri = "pkg:/images/asphalt.jpg"
        tile.width = m.TILE_WIDTH_SIZE
        tile.height = m.TILE_HEIGHT_SIZE
        tile.translation = [m.TILE_WIDTH_SIZE * i, 0]
        m.context.appendChild(tile)
    end for
end function