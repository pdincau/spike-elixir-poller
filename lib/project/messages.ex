defmodule Project.Messages do

  def send do
    IO.inspect(Project.RemoteApi.post("messages/send"))
  end

end
