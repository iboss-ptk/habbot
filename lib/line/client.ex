defmodule Line.Client do
  @reply_endpoint "https://api.line.me/v2/bot/message/reply"
  @line_conf Application.get_env(:my_crush_bot, Line)

  def reply(messages, replyToken) do
    HTTPoison.post(
      @reply_endpoint,
      Poison.encode!(%{
        "replyToken" => replyToken,
        "messages" => messages
      }),
      [
        {"Content-Type", "application/json"},
        {"Authorization", "Bearer #{@line_conf[:channel_access_token]}"}
      ]
    )
  end

  def text(text_string) do
    %{
      "type" => "text",
      "text" => text_string
    }
  end
end
