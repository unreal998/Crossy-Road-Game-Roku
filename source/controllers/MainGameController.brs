function GetMainGameController()

    if (m._mainGameController = invalid)
        prototype = EventDispatcher()
        prototype.eventTypes = GetEventType()
        prototype.mainGameMediator = GetMainGameMediator()
        prototype.mainGameModel = GetMainGameModel()

        prototype.init = function(appContainer)
            m.mainGameModel.setPlayerData()
            m.mainGameMediator.startNewGame(appContainer, m.mainGameModel.getPlayerData(), m.mainGameModel.getGameProcessData())
            m.mainGameMediator.addEventListener(m.eventTypes.WAS_SMASHED, "_playerDie", m)
            m.mainGameMediator.addEventListener(m.eventTypes.PLAYER_WIN, "_playerWin", m)
        end function

        prototype._playerWin = function()
            m.dispatchEvent(m.eventTypes.GAME_OVER, m.eventTypes.PLAYER_WIN)
        end function

        prototype._playerDie = function()
            m.mainGameModel.decreaseHealth()
            playerData = m.mainGameModel.getPlayerData()
            if (playerData.healthCount = 0)
                m.mainGameMediator.destroyView()
                m.dispatchEvent(m.eventTypes.GAME_OVER, m.eventTypes.GAME_OVER)
            else
                m.mainGameMediator.restartLevel(playerData)
            end if
        end function

        prototype.destroy = function()
            m.mainGameMediator.removeEventListener(m.eventTypes.WAS_SMASHED, "_playerDie", m)
        end function

        m._mainGameController = prototype
    end if

    return m._mainGameController
end function
