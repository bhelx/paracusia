defmodule Paracusia.MpdClient.AudioOutputs do
  defstruct outputenabled: nil, outputid: nil, outputname: nil
  alias Paracusia.MessageParser
  alias Paracusia.MpdClient

  @moduledoc"""
  Functions related to audio output devices available to MPD.

  See also: https://musicpd.org/doc/protocol/output_commands.html
  """

  @doc"""
  Turns an output off.
  """
  @spec disable(integer) :: :ok | {:error, {String.t, String.t}}
  def disable(id) do
    MpdClient.send_and_ack("disableoutput #{id}\n")
  end

  @doc"""
  Turns an output on.
  """
  @spec enable(integer) :: :ok | {:error, {String.t, String.t}}
  def enable(id) do
    MpdClient.send_and_ack("enableoutput #{id}\n")
  end

  @doc"""
  Turns an output on or off, depending on the current state.
  """
  @spec toggle(integer) :: :ok | {:error, {String.t, String.t}}
  def toggle(id) do
    MpdClient.send_and_ack("toggleoutput #{id}\n")
  end

  @doc"""
  Returns a map containing information about all audio outputs.
  """
  @spec all() :: {:ok, [%Paracusia.MpdClient.AudioOutputs{}]} | {:error, {String.t, String.t}}
  def all() do
    with {:ok, reply} <- Paracusia.MpdClient.send_and_recv("outputs\n") do
      {:ok, reply |> MessageParser.parse_outputs}
    end
  end

end
