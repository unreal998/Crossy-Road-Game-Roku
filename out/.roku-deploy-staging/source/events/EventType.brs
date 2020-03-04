'//////////////////
'/// events.EventType
'//////////////////
function GetEventType() as Object
  if (m._eventTypeSingleton = Invalid)

    prototype = {}
    prototype.NEW_GAME = "EventType:NEW_GAME"
    prototype.OPEN_SETTINGS = "EventType:OPEN_SETTINGS"
    prototype.EXIT_GAME = "EventType:EXIT_GAME"

    m._eventTypeSingleton = prototype
  end if

  return m._eventTypeSingleton
end function

function DestroyEventType () as Void
  m._eventTypeSingleton = Invalid
end function
