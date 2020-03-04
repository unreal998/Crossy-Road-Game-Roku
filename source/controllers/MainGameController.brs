function GetMainGameController()

    if (m._mainGameController = invalid)
        prototype = EventDispatcher()
        
        prototype.mainGameMediator = GetMainGameMediator()

        prototype.startNewGame = function()
            m.mainGameMediator.startNewGame()
            return m.mainGameMediator.mainGameView
        end function

        m._mainGameController = prototype
    end if

    return m._mainGameController
end function