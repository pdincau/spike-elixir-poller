defmodule Project.RemoteApi do
  use HTTPotion.Base

  def process_url(url) do
    "http://www.gazzetta.it/" <> url
  end

  def process_response_body(body) do
    body
    |> IO.iodata_to_binary
    |> Poison.encode
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
    |> :orddict.from_list
  end

end
