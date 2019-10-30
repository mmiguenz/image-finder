defmodule Saver.Worker do
    use GenServer
  
    def start_link(name) do
      GenServer.start_link(__MODULE__, :ok, name: name)
    end
  
    def init(:ok) do
      {:ok, %{}}
    end
  
    def handle_call({:save, body, directory}, _from, state) do
      File.write! "#{directory}/#{digest(body)}", body
      {:reply, :ok, state}
    end    
    
    def digest(body) do
      GenServer.call(Digester.Worker, {:digest, body})            
    end    
end
  