function GetSettingsController()

    if (m._settingsController = invalid)
        prototype = EventDispatcher()
        
        prototype.settingsMediator = GetSettingsMediator()
        prototype.eventTypes = GetEventType()

        prototype.init = function(appContainer)
            m.settingsMediator.addEventListener(m.eventTypes.CHANGE_SETTINGS_STATE, "_setChoosenSettingsState", m)
            m.settingsMediator.createSettingsView(appContainer)
        end function

        prototype._setChoosenSettingsState = function(choosenStateData)
            if (choosenStateData = "Save")
                m.dispatchEvent(m.eventTypes.NEW_GAME)
            else if (choosenStateData = "Back")
                m.dispatchEvent(m.eventTypes.OPEN_SETTINGS)
            else
                ? "WTF!?" choosenStateData
            end if
        end function

        prototype.destroy = function()
            m.settingsMediator.removeEventListener(m.eventTypes.CHANGE_SETTINGS_STATE, "_setChoosenState", m)
        end function
        m._settingsController = prototype
    end if

    return m._settingsController
end function
