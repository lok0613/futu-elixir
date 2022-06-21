defmodule Futu.GenServer.Common do
  @spec connect(binary, integer()) :: {:error, atom} | {:ok, port}
  def connect(host, port) do
    host_charlist = String.to_charlist(host)

    :gen_tcp.connect(host_charlist, port, [
      :binary,
      active: true,
      keepalive: true,
      buffer: 1024 * 1024
    ])
  end

  def init_state(socket) do
    %{socket: socket, from: nil, is_occupied: false, msg: "", proto_id: nil}
  end

  defp reset_state(state) do
    %{state | msg: "", proto_id: nil, is_occupied: false}
  end
end
