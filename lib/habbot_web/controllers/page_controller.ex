defmodule HabbotWeb.PageController do
  use HabbotWeb, :controller
  import Line.Client
  require Logger

  plug(Line.Signature.Verification.Plug)

  def index(conn, _params) do
    conn |> Plug.Conn.resp(200, "hello from habbot!")
  end

  def webhook(conn, %{"events" => [%{"replyToken" => replyToken}]}) do
    messages = [text(Enum.random(["dak noy noy noi", "piggy", "go workout!", "sus", "555"]))]

    case messages |> reply(replyToken) do
      {:ok, resp} ->
        Logger.info(inspect(resp))
        conn |> send_resp(200, "OK")

      {:error, reason} ->
        Logger.error(inspect(reason))
        conn |> send_resp(500, "Internal server error")
    end
  end
end
