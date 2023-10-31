defmodule BRApi.NCM do
  @moduledoc """
  A Nomenclatura é um sistema ordenado que permite, pela aplicação de regras e procedimentos próprios,
  determinar um único código numérico para uma dada mercadoria. Esse código, uma vez conhecido,
  passa a representar a própria mercadoria.

  A Nomenclatura Comum do Mercosul (NCM) é uma Nomenclatura regional para categorização de mercadorias
  adotada pelo Brasil, Argentina, Paraguai e Uruguai desde 1995, sendo utilizada em todas as operações
  de comércio exterior dos países do Mercosul. A NCM toma por base o Sistema Harmonizado (SH), que é uma
  expressão condensada de “Sistema Harmonizado de Designação e de Codificação de Mercadorias” mantido pela
  Organização Mundial das Alfândegas (OMA), que foi criado para melhorar e facilitar o comércio internacional
  e seu controle estatístico.

  Os idiomas oficiais da NCM são o português e o espanhol.
  """
  @behaviour BRApi
  @url "/ncm/v1"

  alias BRApi.HttpClient

  def fetch(%{search: _code} = params) do
    params = Map.take(params, [:search])
    HttpClient.get(@url, params: params)
  end

  def fetch(%{code: _code} = params) do
    url = @url <> "/:code"
    params = Map.take(params, [:code])
    HttpClient.get(url, path_params: params)
  end

  def fetch(_) do
    HttpClient.get(@url)
  end
end
