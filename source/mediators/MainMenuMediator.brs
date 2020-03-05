function GetMainMenuMediator()

    if(m._mainMenuMediator = invalid)
        prototype = EventDispatcher()

        prototype.CHANGE_APP_STATE = "MainMenuMediator.CHANGE_APP_STATE"

        prototype.createMainMenuView = function(appContainer)
            m.mainMenuView = createObject("roSGNode", "MainMenuView")
            m.mainMenuView.observeField("selectedState", "changeAppState")
            appContainer.appendChild(m.mainMenuView)
            m.mainMenuView.setFocus(true)
        end function
        
        prototype._changeAppState = function(navigationData)
            m.dispatchEvent(m.CHANGE_APP_STATE, navigationData)
        end function
 
        m._mainMenuMediator = prototype
    end if

    return m._mainMenuMediator 
end function

function changeAppState(data)
    m._mainMenuMediator._changeAppState(data.getData())
end function