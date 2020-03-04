function init()
    m.context = m.top
    m.TILE_WIDTH_SIZE = 90
    m.TILE_HEIGHT_SIZE = 90
    m.context.observeField("typeOfBlood", "createTilesLine")
end function

function getypeOfBlood()
    pathToFIle = ""
    if ( m.context.typeOfBlood = 1 )
        pathToFIle = "pkg:/images/blood/bloodSplat1.png"
    else if(m.context.typeOfBlood = 2)
        pathToFIle = "pkg:/images/blood/bloodSplat2.png"
    else if(m.context.typeOfBlood = 3)
        pathToFIle = "pkg:/images/blood/bloodSplat3.png"
    else if(m.context.typeOfBlood = 4)
        pathToFIle = "pkg:/images/blood/bloodSplat4.png"
    end if
    return pathToFIle
end function

function createTilesLine()
    tile = createObject("roSGNode", "Poster")
    tile.uri = getypeOfBlood()
    tile.width = m.TILE_WIDTH_SIZE
    tile.height = m.TILE_HEIGHT_SIZE
    m.context.appendChild(tile)
end function