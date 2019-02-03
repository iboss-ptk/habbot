defmodule HabbotWeb.PageController do
  use HabbotWeb, :controller

  def index(conn, _params) do
    conn |> Plug.Conn.resp(200, "hello from habbot!")
  end
end
