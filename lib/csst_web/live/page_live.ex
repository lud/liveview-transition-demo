defmodule CsstWeb.PageLive do
  use CsstWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      poll_messages()
    end

    socket = assign(socket, :mode, "prepend")

    {:ok, socket, temporary_assigns: [messages: []]}
  end

  defp make_message(data) do
    make_message(to_string(System.monotonic_time()), data)
  end

  defp make_message(id, text) when is_binary(text) do
    %{id: id, text: text}
  end

  defp gen_id() do
  end

  defp poll_messages() do
    poll_messages(0)
  end

  defp poll_messages(id) do
    Process.send_after(self(), {:new_message, id}, 1000)
  end

  def handle_info({:new_message, id}, socket) do
    poll_messages(id + 1)
    {:noreply, assign(socket, :messages, [make_message(id, random_string <> " (#{id})")])}
  end

  defp random_string do
    "Here is a random message"
    |> String.split(" ")
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&Enum.shuffle/1)
    |> Enum.intersperse(?\s)
    |> to_string
    |> String.capitalize()
  end

  def handle_event("change_mode", x, socket) do
    mode =
      case socket.assigns.mode do
        "prepend" -> "append"
        _ -> "prepend"
      end

    {:noreply, assign(socket, :mode, mode)}
  end
end
