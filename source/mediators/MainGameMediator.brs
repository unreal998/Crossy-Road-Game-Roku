function GetMainGameMediator()

    if(m._mainGameMediator = invalid)
        prototype = EventDispatcher()
        prototype.eventNames = GetEventType()

        prototype.startNewGame = function(appContainer, playerData, gameProcessData )
            m.mainGameView = createObject("roSGNode", "MainGameView")
            newGameData = {
                playerData: playerData,
                gameProcessData: gameProcessData
            }
            m.mainGameView.callFunc("startNewGame", newGameData)
            m.mainGameView.observeField("gameState", "gameStateListener")
            appContainer.appendChild(m.mainGameView)
        end function
        
        prototype.restartLevel = function(playerData)
            m.mainGameView.callFunc("restartLevel", playerData)
            m.mainGameView.gameState = ""
        end function

        prototype.wasSmashed = function()
            m.dispatchEvent(m.eventNames.WAS_SMASHED)
        end function

        prototype.playerWin = function()
            m.dispatchEvent(m.eventNames.PLAYER_WIN)
        end function

        prototype.destroyView = function()
            m.mainGameView = invalid
        end function

        m._mainGameMediator = prototype
    end if

    return m._mainGameMediator 
end function

function gameStateListener(data)
    eventName = data.getData()
    if (eventName = m._mainGameMediator.eventNames.WAS_SMASHED)
        m._mainGameMediator.wasSmashed()
    else if (eventName = m._mainGameMediator.eventNames.PLAYER_WIN)
        m._mainGameMediator.playerWin()
    end if
end function