defmodule ContainerIex.Application do
  use Application

  def start(_type, _args) do
    children = [
      IexPostgres.Repo
    ]

    opts = [strategy: :one_for_one, name: IexPostgres.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
