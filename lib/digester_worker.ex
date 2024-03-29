defmodule Digester.Worker do
    use GenServer
  
    def start_link(name) do
      GenServer.start_link(__MODULE__, :ok, name: name)
    end
  
    def init(:ok) do
      {:ok, %{}}
    end
  
    def handle_call({:digest, body}, _from, state) do            
      {:reply, digest(body),  state}
    end    

    def digest(body) do 
      :crypto.hash(:md5 , body) |> Base.encode16()
    end
end
  