defmodule Line.Signature do
  @line_conf Application.get_env(:habbot, Line)

  def verify(req_body, line_signature) do
    hashed_body =
      :crypto.hmac(:sha256, @line_conf[:channel_secret], req_body)
      |> Base.encode64()

    if hashed_body == line_signature, do: :ok, else: :error
  end
end

defmodule Line.Signature.Verification.Plug do
  import Plug.Conn
  import Line.Signature

  def init([]), do: []

  def call(conn, _opts) do
    line_signature = conn |> get_req_header("x-line-signature") |> Enum.join()
    body = conn |> BodyReader.CacheRaw.read_raw_body()

    case verify(body, line_signature) do
      :ok -> conn
      :error -> conn |> send_resp(403, "Request must come from Line") |> halt()
    end
  end
end
