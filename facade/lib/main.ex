# alias Facade.ScheduleServer
# alias Facade.SockectServer
# alias Facade.IFacade

# shudule = %ScheduleServer{name: ""}

# server = IFacade.start(shudule)
# IO.inspect(server)
# server = IFacade.stop(server)
# IO.inspect(IFacade.stop(server))

# IO.puts("------------------------------")

# sockect = %SockectServer{name: "Process 1"}
# socServer = IFacade.start(sockect)
# IO.inspect(socServer)
# socServer = IFacade.stop(socServer)
# IO.inspect(IFacade.stop(socServer))

IO.puts(raise( %ScheduleServer{}) != "")
