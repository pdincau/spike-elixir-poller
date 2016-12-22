defmodule Samples do

  def send(value) do
    ## configure
    token = "your token here"
    url = "http://www.yoururlhere.com"
    ## build your json object as you prefer
    {:ok, body} = %{key: value} |> Poison.encode
    headers = ["Authorization": "Bearer #{token}", "Content-Type": "application/json"]
    ## we use IO.inspect to print on screen
    IO.inspect(HTTPoison.post(url, body, headers))
  end

end
