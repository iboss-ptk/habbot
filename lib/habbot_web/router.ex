defmodule HabbotWeb.Router do
  use HabbotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HabbotWeb do
    get "/", PageController, :index
  end

  scope "/api", HabbotWeb do
    pipe_through :api
  end
end
