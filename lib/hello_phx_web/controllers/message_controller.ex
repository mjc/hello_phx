defmodule HelloPhxWeb.MessageController do
  use HelloPhxWeb, :controller

  alias HelloPhx.Generic
  alias HelloPhx.Generic.Message

  action_fallback HelloPhxWeb.FallbackController

  def index(conn, _params) do
    messages = Generic.list_messages()
    render(conn, "index.json", messages: messages)
  end

  def create(conn, %{"message" => message_params}) do
    with {:ok, %Message{} = message} <- Generic.create_message(message_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.message_path(conn, :show, message))
      |> render("show.json", message: message)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Generic.get_message!(id)
    render(conn, "show.json", message: message)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = Generic.get_message!(id)

    with {:ok, %Message{} = message} <- Generic.update_message(message, message_params) do
      render(conn, "show.json", message: message)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Generic.get_message!(id)

    with {:ok, %Message{}} <- Generic.delete_message(message) do
      send_resp(conn, :no_content, "")
    end
  end
end
