defmodule BRApi.HttpClient do
  @moduledoc """
  The default http client wrapper.
  """

  @base_url BRApi.base_url()

  alias BRApi.Response
  alias BRApi.Error

  def get(url, opts \\ []) do
    [url: url, method: :get, base_url: @base_url]
    |> Keyword.merge(opts)
    |> Req.new()
    |> Req.request()
    |> case do
      {:ok, %{status: status} = resp} when status in 200..399 -> parse_resp(resp)
      {:ok, resp} -> parse_error(resp)
      exception -> exception
    end
  end

  @spec parse_resp(Req.Response.t()) :: Response.t()
  defp parse_resp(response) do
    %Response{
      data: response.body,
      status: response.status
    }
  end

  @spec parse_error(Req.Response.t()) :: Error.t()
  defp parse_error(error) do
    %Error{
      reason: error.body,
      status: error.status
    }
  end
end
