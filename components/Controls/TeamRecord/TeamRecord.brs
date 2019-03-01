'*************************************************************
'** init()
'** Initialize all parameters of the team record
'*************************************************************
function init() as void
    m.fontHeader = CreateObject("roSGNode", "Font")
    m.fontHeader.uri = "pkg:/fonts/Arial.ttf"
    m.fontHeader.size = 20
    
    m.titleLabel = m.top.findNode("titleLabel")
    m.titleLabel.font = m.fontHeader
    
    m.winsLabel = m.top.findNode("winsLabel")
    m.winsLabel.font = m.fontHeader
    
    m.lossesLabel = m.top.findNode("lossesLabel")
    m.lossesLabel.font = m.fontHeader
end function


'*************************************************************
'** onSetDivisionContent()
'** Set the parameters of Labels
'*************************************************************
function onSetDivisionContent() as void    
    m.content = m.top.content
    m.titleLabel.text = m.content.team
    m.titleLabel.width = m.top.width * 0.70
    
    m.winsLabel.text = m.content.wins
    m.winsLabel.width = m.top.width * 0.15
    
    m.lossesLabel.text = m.content.losses
    m.lossesLabel.width = m.top.width * 0.15
end function 