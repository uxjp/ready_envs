# IexPostgres

This repo aims to test database connections using iex with minimal code. This setup eliminates the need to install Elixir on the host machine or to install any databases locally, as all operations are executed within Docker containers.

## Testing 

![iex postgres connection success](images/iex-postgres-connection.png)
### 1/6 Setup the Database

The Java repo contains scripts for this setup. Essentially, you'll need to create a new Docker network using the bridge driver and run a Postgres server container within that network.
The connection between the iex container and the Postgres container is achieved via the Docker network, so no ports need to be exposed for this example.

### 2/6 Test database conection

The Java repo provides a sample script to connect to the Postgres server container using a psql client container to test the credentials. The current repo using iex requires a few additional steps compared to the psql option.

### 3/6 Run the container
Run `dev.sh`

### 4/6 Get Deps
Run: 
```bash 
cd iex_container
mix deps.get
```

### 5/6 Get Deps
Inside the container run:  
```bash
iex -S mix
```

### 6/6 Test Connection to the Database
Inside the `iex` REPL type:  
```elixir
IexPostgres.Repo.start_link()
```

If the connection fails, you'll see an error message like this:

![failed db connection](images/fail-iex-postgres-connection.png)

## File Structure importance

This repo has minimal infra to connect to a database, if you look at the Ecto's tutorial you'll find way more steps. To improve the learning even further I gonna explain the roles of the files used to connect to a database using elixir.

### 1/4 `mix.exs`

`mix.exs` is the build file for an Elixir project, managed by the Mix build tool. Within it we declared the dependencies to `postgrex` and `ecto` necessary to connect to the database. Also declared the Elixir version that must comply with the version on the host where we're developing.

### 2/4 `config/config.exs`

`config/config.exs` is the central configuration file for your Elixir project. It’s used to define global configurations for the application and its dependencies.
In our case we used the name of the container that has the `postgres server` as the host of the database, this is possible because the container where we are running `iex` and the database container are running in the same docker network created using the `bridge`driver.

### 3/4 `lib/iex_postgres/repo.ex`

repo.ex typically defines a repository in Elixir using Ecto, which is the database wrapper and query generator. In this context:

- Database Interface: Serves as the main interface for interacting with the database.
- Configuration: Ties together the database configuration from config.exs with Ecto’s functionality.
- Database Operations: Enables running queries, migrations, and transactions against your database.

### 4/4 `lib/iex_postgres/application.ex`

`application.ex` is the entry point for your Elixir application. It is essential for:

- Starting the Application: Defines the application's supervision tree, which includes workers and processes that should be started when the application starts.
- Supervision Tree: Manages the lifecycle of processes, ensuring fault tolerance by restarting failed processes.
- Application Configuration: Specifies additional applications that need to be started before your application, like the Ecto repository.
