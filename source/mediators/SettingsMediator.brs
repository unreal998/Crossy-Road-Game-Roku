function GetSettingsMediator()

    if(m._settingsMediator = invalid)
        prototype = EventDispatcher()

        prototype.eventTypes = GetEventType()

        prototype.createSettingsView = function(appContainer)
            m.settingsView = createObject("roSGNode", "SettingsView")
            m.settingsView.observeField("selectedState", "_changeSettingsState")
            appContainer.appendChild(m.settingsView)
            m.settingsView.setFocus(true)
        end function
        
        prototype._changeSettingsState = function(navigationData, changedData = invalid)
            m.dispatchEvent(m.eventTypes.CHANGE_SETTINGS_STATE, navigationData)
        end function
 
        m._settingsMediator = prototype
    end if

    return m._settingsMediator 
end function

function _changeSettingsState(data)
    m._settingsMediator._changeSettingsState(data.getData())
end function