defmodule ImageFinder do
  use Application

  def start(_type, _args) do
    ImageFinder.Supervisor.start_link
    Fetcher.Supervisor.start_link
    Saver.Supervisor.start_link
    Digester.Supervisor.start_link
  end
 
  def fetch(source_file, target_directory) do
    GenServer.call(ImageFinder.Worker, {:fetch, source_file, target_directory})
  end
end
