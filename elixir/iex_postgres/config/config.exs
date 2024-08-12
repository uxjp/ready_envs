import Config

config :iex_postgres, IexPostgres.Repo,
  database: "postgres",
  username: "postgres",
  password: "mysecretpassword",
  hostname: "postgres-db" #it's the container name

config :iex_postgres, ecto_repos: [IexPostgres.Repo]
