defmodule HabbotWeb.Router do
  use HabbotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HabbotWeb do
    pipe_through :api
  end
end
