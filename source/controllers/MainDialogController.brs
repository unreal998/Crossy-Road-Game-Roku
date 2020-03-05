function GetMainDialogController()

    if (m._mainDialogController = invalid)
        prototype = EventDispatcher()
        
        prototype.mainDialogMediator = GetMainDialogMediator()
        prototype.eventTypes = GetEventType()

        prototype.init = function(sceneContainer, typeOfDialog)
            m.mainDialogMediator.addEventListener(m.mainDialogMediator.CHANGE_APP_STATE, "_setChoosenState", m)
            m.mainDialogMediator.createMainDialogView(sceneContainer, typeOfDialog)
        end function

        prototype._setChoosenState = function(choosenStateData)
            if (choosenStateData = "Restart")
                m.dispatchEvent(m.eventTypes.NEW_GAME)
            else if (choosenStateData = "Exit")
                m.dispatchEvent(m.eventTypes.EXIT_TO_MAIN_MENU)
            else
                ? "WTF!?" choosenStateData
            end if
        end function

        prototype.destroy = function()
            m.mainDialogMediator.removeEventListener(m.mainDialogMediator.CHANGE_APP_STATE, "_setChoosenState", m)
        end function
        m._mainDialogController = prototype
    end if

    return m._mainDialogController
end function
