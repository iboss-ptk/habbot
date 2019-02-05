defmodule Line.Client do
  @reply_endpoint "https://api.line.me/v2/bot/message/reply"
  @line_conf Application.get_env(:habbot, Line)

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

  def text(text_string, quick_reply) do
    Map.merge(text(text_string), quick_reply)
  end
end

defmodule Line.Client.QuickReply do
  def quick_reply(items) do
    %{
      "quickReply" => %{
        "items" => items
      }
    }
  end

  def quick_message(label, text) do
    %{
      "type" => "action",
      "action" => %{
        "type" => "message",
        "label" => label,
        "text" => text
      }
    }
  end

  def quick_message(text), do: quick_message(text, text)
end
