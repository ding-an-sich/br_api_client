defmodule BRApi.Services.RegistroBr do
  @moduledoc """
  O Registro.br é o departamento do NIC.br responsável pelas atividades de
  registro e manutenção dos nomes de domínios que usam o .br.
  """

  @behaviour BRApi
  @url "/registrobr/v1/:domain"

  alias BRApi.HttpClient

  def fetch(%{domain: _} = params) do
    params = Map.take(params, [:domain])
    HttpClient.get(@url, path_params: params)
  end
end
