defmodule Pearljam.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PearljamWeb.Telemetry,
      Pearljam.Repo,
      {DNSCluster, query: Application.get_env(:pearljam, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pearljam.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Pearljam.Finch},
      # Start a worker by calling: Pearljam.Worker.start_link(arg)
      # {Pearljam.Worker, arg},
      # Start to serve requests, typically the last entry
      PearljamWeb.Endpoint,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pearljam.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PearljamWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
