' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()
    m.top.SetFocus(true)
    
    m.loadingIndicator = m.top.findNode("loadingIndicator")
    
    m.americanTable = m.top.findNode("americanTable")
    m.americanTable.title = "American League"
    
    m.nationalTable = m.top.findNode("nationalTable")
    m.nationalTable.title = "National League" 
    
    getRankngsContent()
End sub


' ***************************************
' Get the rankings
' ***************************************
function getRankngsContent() as void
    m.endPointAPI = createObject("RoSGNode", "EndpointAPI") 
    m.endPointAPI.functionName = "getAllRankings"
    m.endPointAPI.observeField("content", "onSetContent")
    m.endPointAPI.control = "RUN"  
end function

function onSetContent() as void
   content = m.endPointAPI.content
   
   m.americanTable.content = content.american
   m.nationalTable.content = content.national
   
   m.loadingIndicator.control = "stop"
end function  



function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
