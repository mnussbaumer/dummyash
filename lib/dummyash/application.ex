defmodule Dummyash.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DummyashWeb.Telemetry,
      Dummyash.Repo,
      {DNSCluster, query: Application.get_env(:dummyash, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Dummyash.PubSub},
      # Start a worker by calling: Dummyash.Worker.start_link(arg)
      # {Dummyash.Worker, arg},
      # Start to serve requests, typically the last entry
      DummyashWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dummyash.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DummyashWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
