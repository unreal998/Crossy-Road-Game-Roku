function GetAppController()

    if (m._appController = invalid)
        prototype = {}

        prototype.mainMenuController = GetMainMenuController() 
        prototype.mainGameController = GetMainGameController()
        prototype.settingsController = GetSettingsController()
        prototype.mainDialogController = GetMainDialogController()

        prototype.eventTypes = GetEventType()

        prototype.initApp = function(appContainer)
            m.appContainer = appContainer
            m._showMainMenu()
        end function

        prototype._startNewGame = function()
            m._clearAppState("menu")
            m.mainMenuController.destroy()

            m.mainGameController.init(m.appContainer)
            m.mainGameController.addEventListener(m.eventTypes.GAME_OVER, "_gameOver", m)     
        end function

        prototype._restartNewGame = function()
            m._clearAppState("dialog")
            m.mainDialogController.destroy()

            m.mainGameController.init(m.appContainer)
            m.mainGameController.addEventListener(m.eventTypes.GAME_OVER, "_gameOver", m)     
        end function

        prototype._exitToMainMenu = function()
            m._clearAppState("dialog")
            m.mainDialogController.destroy()
            
            m._showMainMenu()
        end function

        prototype._showSettings = function()
            m._clearAppState("menu")
            m.mainMenuController.destroy()

            m.settingsController.init(m.appContainer)
        end function

        prototype._exit = function()
            ' m.mainMenuController.destroy()
        end function

        prototype._gameOver = function(typeOfGameOver)
            m._clearAppState("game")
            m.mainGameController.destroy()
            m._showDialog(typeOfGameOver)
        end function
        
        prototype._showDialog = function(typeOfDialog)
            m.mainDialogController.init(m.appContainer, typeOfDialog)
            m.mainDialogController.addEventListener(m.eventTypes.NEW_GAME, "_restartNewGame", m)
            m.mainDialogController.addEventListener(m.eventTypes.EXIT_TO_MAIN_MENU, "_exitToMainMenu", m)
        end function

        prototype._showMainMenu = function()
            m.mainMenuController.init(m.appContainer)
            m.mainMenuController.addEventListener(m.eventTypes.NEW_GAME, "_startNewGame", m)
            m.mainMenuController.addEventListener(m.eventTypes.OPEN_SETTINGS, "_showSettings", m)
            m.mainMenuController.addEventListener(m.eventTypes.EXIT_GAME, "_exit", m)
        end function

        prototype._clearAppState = function(state)
            ' m.appContainer.removeChildrenIndex(m.appContainer.getChildCount(), 0)
            m.appContainer.removeChildIndex(m.appContainer.getChildCount() - 1)
            if (state = "game")
                m._removeGameListeners()
            else if (state = "menu")
                m._removeMenuListeners()
            else if (state = "dialog")
                m._removeMenuListeners()
            end if
        end function

        prototype._removeMenuListeners = function()
            m.mainMenuController.removeEventListener(m.eventTypes.NEW_GAME, "_startNewGame", m)
            m.mainMenuController.removeEventListener(m.eventTypes.OPEN_SETTINGS, "_showSettings", m)
            m.mainMenuController.removeEventListener(m.eventTypes.EXIT_GAME, "_exit", m)
        end function

        prototype._removeGameListeners = function()
            m.mainGameController.removeEventListener(m.eventTypes.GAME_OVER, "_showMainMenu", m)
        end function

        prototype._removeDialogListeners = function()
            m.mainDialogController.removeEventListener(m.eventTypes.NEW_GAME, "_restartNewGame", m)
            m.mainDialogController.removeEventListener(m.eventTypes.EXIT_TO_MAIN_MENU, "_startNewGame", m)
        end function

        m._appController = prototype
    end if
    
    return m._appController
end function