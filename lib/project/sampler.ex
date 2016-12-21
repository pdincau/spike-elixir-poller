defmodule Sampler do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def sample_every(timer) do
    GenServer.call(__MODULE__, {:sample, timer})
  end

  def handle_call({:sample, timer}, _from, state) do
    reschedule_after(timer)
    new_state = Map.put(state, :timer, timer)
    {:reply, {:ok, timer}, new_state} 
  end

  def handle_info(:work, %{timer: timer} = state) do
    IO.inspect(state)
    reschedule_after(timer)
    {:noreply, state}
  end

  defp reschedule_after(timer) do
    Process.send_after(self(), :work, timer)
  end
end
