defmodule Response do
  @moduledoc """
  %{
    "ErrorCode" => 1,
    "ErrorStatus" =>
    "Success",
    "Message" => "Ok",
    "MessageData" => %{},
    "Response" => ,
    "ThrottleSeconds" => 0
  }
  """

  @derive[Poison.Encoder]
  defstruct [:ErrorCode, :ErrorStatus, :Success, :Message, :MessageData, :Response, :ThrottleSeconds]
end
