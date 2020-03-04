'///////////////////////////////////////////////////////////////////////////////////
'// Event Dispatcher definition. Allows other objects (contexts) to be added as
'// listeners to specific events that are dispatched by this event-dispatcher.
'// Event-listeners can also be individually removed, removed by their context's
'// 'id' property or all listeners can be removed from the event-dispatcher instance.
'//
'// @return         - an event-dispatcher instance
'///////////////////////////////////////////////////////////////////////////////////
function EventDispatcher () as Object
  prototype = {}

  '////////////////////////////
  '/// PUBLIC API ///
  '////////////////////////////

  ' Adds a new event-listener to a particular event.
  '
  ' @param eventType    The name of the event to be listened for.
  ' @param handlerName  The name of the event-handler. This is either;
  '                     - a named-function
  '                     - an anonymous-function that has been assigned to a context.
  ' @param context      The context object.
  prototype.addEventListener = function (eventType as String, handlerName as String, context as Object) as void
    if (context.uid = Invalid)
      context.uid = "uid" + GetEventListenerUID()
    end if

    if (m._listeners[eventType] = Invalid)
      m._listeners[eventType] = {}
    end if

    listenerIdToAdd = handlerName + context.uid
    m._listeners[eventType].addReplace(listenerIdToAdd, {handlerName: handlerName, context: context})
  end function

  ' Dispatches an event to each listener for a specific event-type
  '
  ' @param eventType      the name of the event being dispatched
  ' @param payload        an optional payload of any type
  prototype.dispatchEvent = function (eventType as String, payload=Invalid as Dynamic) as Boolean
    eventTypeListeners = m._listeners[eventType]

    if (eventTypeListeners <> Invalid)
      if (payload = Invalid)
        for each listenerId in eventTypeListeners
          listener = eventTypeListeners[listenerId]
          listener.context[listener.handlerName]()
        end for
      else
        for each listenerId in eventTypeListeners
          listener = eventTypeListeners[listenerId]
          listener.context[listener.handlerName](payload)
        end for
      end if
    end if
  end function

  ' Removes a listener of a specific event
  '
  ' @param eventType    The name of the event to no longer be listened for.
  ' @param handlerName  The name of the event-handler to remove as a listener. This is either;
  '                     - a named-function
  '                     - an anonymous that is assigned to the optional context parameter.
  ' @param context      The context object.
  prototype.removeEventListener = function (eventType as String, handlerName as String, context as Object) as void
    eventTypeListeners = m._listeners[eventType]
    if (eventTypeListeners <> Invalid AND context.uid <> Invalid)
      listenerIdToDelete = handlerName + context.uid
      if (eventTypeListeners.delete(listenerIdToDelete) AND eventTypeListeners.count() = 0)
        m._listeners.delete(eventType)
      end if
    end if
  end function

  '////////////////////////////////////////////////
  '/// PRIVATE PROPERTIES ///
  '////////////////////////////////////////////////

  ' The listeners that are stored by this instance of the event-dispatcher
  prototype._listeners = {}
  return prototype
end function

' Return a unique event-listener UID to identify the listener.
function GetEventListenerUID() as String
  if (m.UIDCounterInstance = invalid)
    this = {}

    this.count = 0

    this.getNext = function() as Integer
      m.count = m.count + 1
      return m.count
    end function

    m.UIDCounterInstance = this
  end if

  return m.UIDCounterInstance.getNext().toStr()
end function

function DestroyEventListenerUID () as Void
  m.UIDCounterInstance = Invalid
end function
