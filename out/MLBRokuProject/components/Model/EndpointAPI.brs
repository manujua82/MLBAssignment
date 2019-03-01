sub init()
    m.urlbase = "https://api.mobileqa.mlbinfra.com/api/interview/v1/records"
end sub

' ******************************************************
' Fetch the rankings for all divisions in both leagues.
' ******************************************************
function getAllRankings() as void 
    http = NewHttp(m.urlbase)
    contentStr = http.GetToString()
    teams  = ParseJSON(contentStr)
    
    if teams <> Invalid then
        m.american = CreateObject("roArray", 0, true)
        m.national = CreateObject("roArray", 0, true)
        for each team in teams
            if team.league = "AL" then
                m.american.push(team)
            else
                m.national.Push(team)
            end if 
        end for
    end if   
    
    m.top.content = createContentByleagues()
end function


function createLeagueByDivision(league as Object) as object
    
    if league = Invalid or league.count() = 0 then
        return Invalid
    end if 
        
    leagueByDivision = CreateObject("roAssociativeArray")
    
    eastDivision = CreateObject("roArray", 0, true)
    centralDivison = CreateObject("roArray", 0, true)
    westDivision = CreateObject("roArray", 0, true)
    for each team in league
        if team.division = "East" then
            eastDivision.Push(team)
        else if team.division = "Central" then
            centralDivison.Push(team)
        else if team.division = "West" then
             westDivision.Push(team)
        end if
    end for
        
    leagueByDivision.east = eastDivision
    leagueByDivision.central = centralDivison
    leagueByDivision.west = westDivision
        
    return leagueByDivision   
end function 

function createContentByleagues() as object
    contentByleagues = CreateObject("roAssociativeArray")
    contentByleagues.american  = createLeagueByDivision(m.american)
    contentByleagues.national  = createLeagueByDivision(m.national)
    
    return contentByleagues
end function 






