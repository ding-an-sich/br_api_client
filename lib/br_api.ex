defmodule BRApi do
  @moduledoc """
  Documentation for `BRApi`.
  """
  @type params :: map()

  @base_url "https://brasilapi.com.br/api/"

  defmodule Response do
    @type t :: %__MODULE__{
            status: pos_integer(),
            data: map()
          }

    defstruct [:status, :data]
  end

  defmodule Error do
    @type t :: %__MODULE__{
            status: pos_integer(),
            reason: any()
          }

    defstruct [:status, :reason]
  end

  @callback fetch(params()) ::
              {:ok, BRApi.Response.t()} | {:error, BRApi.Error.t()} | {:error, Exception.t()}

  def base_url, do: @base_url
end
