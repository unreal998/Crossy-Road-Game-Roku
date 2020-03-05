function GetMainDialogMediator()

    if(m._mainDialogMediator = invalid)
        prototype = EventDispatcher()

        prototype.CHANGE_APP_STATE = "_mainDialogMediator.CHANGE_APP_STATE"

        prototype.createMainDialogView = function(appContainer, typeOfDialog)
            m.mainDialogView = createObject("roSGNode", "DialogsView")
            m.mainDialogView.dialogType = typeOfDialog
            m.mainDialogView.observeField("selectedState", "changeDialogAppState")
            appContainer.appendChild(m.mainDialogView)
        end function
        
        prototype._changeAppState = function(navigationData)
            m.dispatchEvent(m.CHANGE_APP_STATE, navigationData)
        end function
 
        m._mainDialogMediator = prototype
    end if

    return m._mainDialogMediator 
end function

function changeDialogAppState(data)
    m._mainDialogMediator._changeAppState(data.getData())
end function