function init()
    m.context = m.top
    m.context.observeField("direction", "changeDirection")
    m.CHARACTERS_SIZE = 96
    createPlayerCharacter()
end function

function createPlayerCharacter()
    m.player = m.context.findNode("playerTexture")
    m.player.uri = "pkg:/images/characterDown.png"
    m.player.width = m.CHARACTERS_SIZE
    m.player.height = m.CHARACTERS_SIZE
    m.context.appendChild(m.player)
end function

function changeDirection()
    if (m.context.direction = "up")
        m.player.uri = "pkg:/images/characterUp.png"
    else if (m.context.direction = "down")
        m.player.uri = "pkg:/images/characterDown.png"
    else if (m.context.direction = "left")
        m.player.uri = "pkg:/images/characterLeft.png"
    else if (m.context.direction = "right")
        m.player.uri = "pkg:/images/characterRight.png"
    end if
end function