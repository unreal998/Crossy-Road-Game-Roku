'//////////////////
'/// events.EventType
'//////////////////
function GetEventType() as Object
  if (m._eventTypeSingleton = Invalid)

    prototype = {}
    prototype.NEW_GAME = "EventType:NEW_GAME"
    prototype.OPEN_SETTINGS = "EventType:OPEN_SETTINGS"
    prototype.EXIT_GAME = "EventType:EXIT_GAME"
    prototype.EXIT_TO_MAIN_MENU = "EventType:EXIT_TO_MAIN_MENU"
    prototype.WAS_SMASHED = "WAS_SMASHED"
    prototype.GAME_OVER = "GAME_OVER"
    prototype.PLAYER_WIN = "PLAYER_WIN"
    prototype.CHANGE_SETTINGS_STATE = "CHANGE_SETTINGS_STATE"

    m._eventTypeSingleton = prototype
  end if

  return m._eventTypeSingleton
end function

function DestroyEventType () as Void
  m._eventTypeSingleton = Invalid
end function
