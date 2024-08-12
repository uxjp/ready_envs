defmodule IexPostgres.Repo do
  use Ecto.Repo,
    otp_app: :iex_postgres,
    adapter: Ecto.Adapters.Postgres
end
