sub init()
    m.loadingIndicatorGroup = m.top.findNode("loadingIndicatorGroup")
    m.loadingLabel = m.top.findNode("loadingLabel") 
    
    m.fadeAnimation = m.top.findNode("fadeAnimation")
    
    m.timerLoading = m.top.findNode("timerLoading")
    m.timerLoading.observeField("fire", "animLoadingEvent")
    
    onControlChange()
end sub

sub animLoadingEvent()
    if m.loadingLabel.text = "..." Then
        m.loadingLabel.text = "."
    else if m.loadingLabel.text = ".." Then
        m.loadingLabel.text = "..."
    else if m.loadingLabel.text = "." Then
         m.loadingLabel.text = ".."
    end if
end sub

sub onControlChange()
  if m.top.control = "start"
    m.loadingIndicatorGroup.opacity = 1
    m.timerLoading.control = "start"
    m.top.state = "running"
  else if m.top.control = "stop"
    if m.top.fadeInterval > 0
      m.fadeAnimation.duration = m.top.fadeInterval
      m.fadeAnimation.observeField("state", "onFadeAnimationStateChange")
      m.fadeAnimation.control = "start"
    else
      stopAnimation()
    end if
  end if    
end sub

sub onFadeAnimationStateChange()
  if m.fadeAnimation.state = "stopped"
    stopAnimation()
  end if
end sub

sub stopAnimation()
    m.loadingIndicatorGroup.opacity = 0
    m.timerLoading.control = "stop"
    m.top.state = "stopped"
end sub