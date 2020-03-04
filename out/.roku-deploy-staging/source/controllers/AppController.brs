function GetAppController()

    if (m._appController = invalid)
        prototype = {}

        prototype.mainMenuController = GetMainMenuController() 
        prototype.mainGameController = GetMainGameController()
        prototype.eventTypes = GetEventType()

        prototype.initApp = function(appContainer)
            m.appContainer = appContainer
            m.mainMenuController.init()
            m._showMainMenu()
        end function

        prototype._startNewGame = function()
            m._clearAppState()
            ? "_startNewGame"
            mainGameView = m.mainGameController.startNewGame()
            m.appContainer.appendChild(mainGameView)
            m.appContainer.setFocus(true)
        end function

        prototype._showSettings = function()
            ? "_showSettings"
        end function

        prototype._exit = function()
            ? "_exit"
        end function

        prototype._showMainMenu = function()
            m._clearAppState()

            m.mainMenuController.addEventListener(m.eventTypes.NEW_GAME, "_startNewGame", m)
            m.mainMenuController.addEventListener(m.eventTypes.OPEN_SETTINGS, "_showSettings", m)
            m.mainMenuController.addEventListener(m.eventTypes.EXIT_GAME, "_exit", m)

            mainMenuView = m.mainMenuController.getMainMenuView()
            m.appContainer.appendChild(mainMenuView)
            m.appContainer.setFocus(true)  
        end function

        prototype._clearAppState = function()
            m.appContainer.removeChildIndex(0)
            m._removeListeners()
        end function

        prototype._removeListeners = function()
            m.mainMenuController.removeEventListener(m.eventTypes.NEW_GAME, "_startNewGame", m)
            m.mainMenuController.removeEventListener(m.eventTypes.OPEN_SETTINGS, "_showSettings", m)
            m.mainMenuController.removeEventListener(m.eventTypes.EXIT_GAME, "_exit", m)
        end function

        m._appController = prototype
    end if
    
    return m._appController
end function