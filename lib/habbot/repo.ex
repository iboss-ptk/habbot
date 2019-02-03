defmodule Habbot.Repo do
  use Ecto.Repo,
    otp_app: :habbot,
    adapter: Ecto.Adapters.Postgres
end
