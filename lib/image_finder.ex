defmodule ImageFinder do
  use Application

  def start(_type, _args) do
    #TODO estos supervisores son estaticos, tendrian que ser dinamicos y ser supervisados por uno estatico
    ImageFinder.Supervisor.start_link
    Fetcher.Supervisor.start_link
    Saver.Supervisor.start_link
    Digester.Supervisor.start_link
    #TODO poner un registry que tenga key value de dominios y pids, para ir mandando los fetch
  end
 
  def fetch(source_file, target_directory) do
    GenServer.call(ImageFinder.Worker, {:fetch, source_file, target_directory})
  end
end
