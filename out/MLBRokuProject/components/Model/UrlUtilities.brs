' ******************************************************
' Constructs a URL Transfer object
' ******************************************************
Function CreateURLTransferObject(url As String) as Object
    obj = CreateObject("roUrlTransfer")
    obj.SetPort(CreateObject("roMessagePort"))
    obj.SetUrl(url)
    obj.AddHeader("Content-Type", "application/json")
    obj.EnableEncodings(true)
    obj.EnablePeerVerification(false) 
    return obj
End Function


' ******************************************************
' Url Query builder
' ******************************************************
function NewHttp(url as String) as Object
    obj = CreateObject("roAssociativeArray")
    obj.Http = CreateURLTransferObject(url)
    obj.GetToString = httpGetToString
    
    return obj
end function

' ******************************************************
' Performs Http.AsyncGetToString() with a single timeout in seconds
' ******************************************************
function httpGetToString() as String
    timeout = 3000 
    str = ""
    m.Http.EnableFreshConnection(true) 
    if (m.Http.AsyncGetToString())
        event = wait(0, m.Http.GetPort())
        if type(event) = "roUrlEvent"
            str = event.GetString()
        else if event = invalid
            ? "AsyncGetToString timeout"
            m.Http.AsyncCancel()
        else
            ? "AsyncGetToString unknown event"
        endif
    endif
    return str
end function