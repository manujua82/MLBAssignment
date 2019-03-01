' ******************************************************
' ** init()
' ** Initialize  Web API URL
' ******************************************************
sub init()
    m.urlbase = "https://api.mobileqa.mlbinfra.com/api/interview/v1/records"
end sub

' ******************************************************
' ** getAllRankings()
' ** Fetch the rankings for all divisions in both leagues.
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

' ******************************************************
' ** createLeagueByDivision()
' ** Create leagues divisions
' ******************************************************
function createLeagueDivision(league as Object) as object
    
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
 
   
    eastDivision.SortBy("wins", "r")
    centralDivison.SortBy("wins", "r")
    westDivision.SortBy("wins", "r")
    
    leagueByDivision.east = eastDivision
    leagueByDivision.central = centralDivison
    leagueByDivision.west = westDivision
        
    return leagueByDivision   
end function 

' ******************************************************
' ** createContentByleagues()
' ** Group content by leagues 
' ******************************************************
function createContentByleagues() as object
    contentByleagues = CreateObject("roAssociativeArray")
    contentByleagues.american  = createLeagueDivision(m.american)
    contentByleagues.national  = createLeagueDivision(m.national)
    
    return contentByleagues
end function 






