
' ******************************************************
' ** init()
' ** Initialize all parameters 
' ******************************************************
function init() as void
    
    m.fontHeader = CreateObject("roSGNode", "Font")
    m.fontHeader.uri = "pkg:/fonts/ArialBold.ttf"
    m.fontHeader.size = 25
    
    m.titleLabel = m.top.findNode("titleLabel")
    m.titleLabel.font = m.fontHeader
    
    m.winsLabel = m.top.findNode("winsLabel")
    m.winsLabel.font = m.fontHeader
    
    m.lossesLabel = m.top.findNode("lossesLabel")
    m.lossesLabel.font = m.fontHeader
    
    m.yInitial = 90
end function 

' ******************************************************
' ** onSetLeagueContent()
' ** Display Scores by division 
' ******************************************************
function onSetLeagueContent() as void
    m.content = m.top.content
    
    layout = CreateObject("roSGNode", "LayoutGroup")
    layout.translation = [50, m.yInitial]
    layout.itemSpacings = [50]
    layout.layoutDirection = "vert"
    
    eastLayout = createDivision(m.content.east, "East")
    if eastLayout <> Invalid Then layout.appendChild(eastLayout)
    
    centralLayout = createDivision(m.content.central,"Central")
    if centralLayout <> Invalid Then layout.appendChild(centralLayout)
    
    westLayout = createDivision(m.content.west, "West")
    if westLayout <> Invalid Then layout.appendChild(westLayout)
   
    m.top.appendChild(layout)
end function


' ******************************************************
' ** createDivision()
' ** Create a division table scores
' ******************************************************
function createDivision(division as Object, divisionTitle as String) as Dynamic
    if division <> Invalid then
        layout = CreateObject("roSGNode", "LayoutGroup")
        layout.layoutDirection = "vert"
        layout.itemSpacings = [5]
        
        titleLabel = layout.createChild("Label")
        titleLabel.text = divisionTitle
        titleLabel.font="font:SmallestSystemFont"
        titleLabel.color = "0x000000FF"
        
        for each team in division
            row = layout.createChild("TeamRecord")
            row.width = m.top.width - 100
            row.itemSpacings = [280,40]
            row.content = team
        end for
        
        return layout
    end if 
    return Invalid
end function 