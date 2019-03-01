function init() as void
    print "LeagueTable init: "; m.top
    
    m.font = CreateObject("roSGNode", "Font")
    m.font.uri = "pkg:/font/ArialBold.ttf"
    m.font.size = 12
    
    m.titleLabel = m.top.findNode("titleLabel")
    m.titleLabel.font = m.font
end function 

function onSetLeagueContent() as void
    m.content = m.top.content
end function