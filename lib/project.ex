defmodule Project do
  use Application

  def start(_type, _args) do
    Project.Supervisor.start_link
  end
end
