function GetMainMenuController()

    if (m._mainMenuController = invalid)
        prototype = EventDispatcher()
        
        prototype.mainMenuMediator = GetMainMenuMediator()
        prototype.eventTypes = GetEventType()

        prototype.init = function(appContainer)
            m.mainMenuMediator.addEventListener(m.mainMenuMediator.CHANGE_APP_STATE, "_setChoosenState", m)
            m.mainMenuMediator.createMainMenuView(appContainer)
        end function

        prototype._setChoosenState = function(choosenStateData)
            if (choosenStateData = "New Game")
                m.dispatchEvent(m.eventTypes.NEW_GAME)
            else if (choosenStateData = "Settings")
                m.dispatchEvent(m.eventTypes.OPEN_SETTINGS)
            else if (choosenStateData = "Exit")
                m.dispatchEvent(m.eventTypes.EXIT_GAME)
            else
                ? "WTF!?" choosenStateData
            end if
        end function

        prototype.destroy = function()
            m.mainMenuMediator.removeEventListener(m.mainMenuMediator.CHANGE_APP_STATE, "_setChoosenState", m)
        end function
        m._mainMenuController = prototype
    end if

    return m._mainMenuController
end function
