defmodule Pearljam.Repo do
  use Ecto.Repo,
    otp_app: :pearljam,
    adapter: Ecto.Adapters.Postgres
end
