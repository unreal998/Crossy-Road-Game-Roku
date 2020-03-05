function init()
    m.context = m.top
    m.TILE_WIDTH_SIZE = 90
    m.TILE_HEIGHT_SIZE = 90
    m.context.observeField("healthCount", "createHealthBar")
end function

function removeHealth(helthData)
    helthItem = m.healthBarContainer.getChild(helthData.helthCount)
    helthItem.uri = "pkg:/images/health/HeartBlack.png"
end function

function createHealthBar()
    m.healthBarContainer = createObject("roSGNode", "Group")
    for i = 0 to m.context.healthCount - 1
        heart = createObject("roSGNode", "Poster")
        heart.uri = "pkg:/images/health/Heart.png"
        heart.width = m.TILE_WIDTH_SIZE
        heart.height = m.TILE_HEIGHT_SIZE
        heart.translation = [m.TILE_WIDTH_SIZE * i, 0]
        m.healthBarContainer.appendChild(heart)
    end for
    m.context.appendChild(m.healthBarContainer)    
end function