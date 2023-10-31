defmodule BRApi.Services.Pix do
  @moduledoc """
  Informações referentes ao Pix.
  """
  @behaviour BRApi
  @url "/pix/v1/participants"

  alias BRApi.HttpClient

  def fetch(_ \\ %{}), do: HttpClient.get(@url)
end
