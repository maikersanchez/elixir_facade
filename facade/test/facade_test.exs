defmodule FacadeTest do
  use ExUnit.Case
  doctest Facade

  alias Facade.ScheduleServer
  alias Facade.SockectServer
  alias Facade.IFacade

  test "Creations server schedule and run" do
    sche = %ScheduleServer{name: "n_1"};
    assert is_struct(sche)

    sche = IFacade.start(sche)
    assert sche.process == "Server ScheduleServer is ready"
  end

  test "Stop server schedule was down" do
    sche = %ScheduleServer{name: "n_1"};
    assert is_struct(sche)
    sche = IFacade.start(sche)
    sche = IFacade.stop(sche)
    assert sche.process == "Shutdown server ScheduleServer"
  end

  test "Run process without empty" do
    sche = %ScheduleServer{name: "n_1"}
    assert catch_throw(IFacade.stop(sche)) == "The server state must be running"

  end

  test "Creation empty struct ScheduleServer" do
    IO
    assert catch_throw( %ScheduleServer{})
  end

  test "Creations socket server and run" do
    soc = %SockectServer{name: "s_1"};
    assert is_struct(soc)

    soc = IFacade.start(soc)
    assert soc.process == "Server SockectServer is ready"
  end

  test "Stop socket server was down" do
    soc = %SockectServer{name: "n_1"};
    assert is_struct(soc)
    soc = IFacade.start(soc)
    soc = IFacade.stop(soc)
    assert soc.process == "Shutdown server SockectServer"
  end

  test "Tries socket server turn without be running" do
    sche = %SockectServer{name: "s_1"}
    assert catch_throw(IFacade.stop(sche)) == "The server state must be running"
  end

end
