defmodule HabbotWeb.BotController do
  use HabbotWeb, :controller
  import Line.Client
  require Logger

  plug(Line.Signature.Verification.Plug)

  def webhook(conn, %{"events" => events}) do
    Enum.each(events, fn event ->
      messages = [
        Line.Client.text(
          "What did you eat/drink?",
          Line.Client.QuickReply.quick_reply([
            Line.Client.QuickReply.quick_message("proper meal"),
            Line.Client.QuickReply.quick_message("dessert"),
            Line.Client.QuickReply.quick_message("snack"),
            Line.Client.QuickReply.quick_message("coffee"),
            Line.Client.QuickReply.quick_message("soft drink"),
            Line.Client.QuickReply.quick_message("beer")
          ])
        )
      ]

      case messages |> reply(event["replyToken"]) do
        {:ok, resp} ->
          Logger.info(inspect(resp))

        {:error, reason} ->
          Logger.error(inspect(reason))
          conn |> send_resp(500, "Internal server error") |> halt()
      end
    end)

    conn |> send_resp(200, "OK")
  end
end
