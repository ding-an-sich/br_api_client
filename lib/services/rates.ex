defmodule BRApi.Services.Rates do
  @moduledoc """
  Taxas de juros e índices oficias.
  """
  @behaviour BRApi
  @url "/taxas/v1"

  alias BRApi.HttpClient

  def fetch(params \\ %{})

  def fetch(%{symbol: symbol}) do
    url = @url <> "/:sigla"
    params = %{sigla: symbol}
    HttpClient.get(url, path_params: params)
  end

  def fetch(_), do: HttpClient.get(@url)
end
