defmodule HelloPhxWeb.Router do
  use HelloPhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HelloPhxWeb do
    pipe_through :api

    resources "/messages", MessageController
  end
end
