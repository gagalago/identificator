defmodule Identificator.Router do
  @moduledoc false

  use Identificator.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", Identificator do
    pipe_through :browser # Use the default browser stack

    get "/", RootController, :index
  end

  scope "/api", Identificator do
    pipe_through :api

    resources "/identities", IdentityController, only: [:show, :index, :create, :update, :delete]
    resources "/registration", RegistrationController, only: [:create]
  end

  if Mix.env == :dev do
    scope "/dev" do
      pipe_through [:browser]
      forward "/mailbox", Plug.Swoosh.MailboxPreview, [base_path: "/dev/mailbox"]
    end
  end
end
