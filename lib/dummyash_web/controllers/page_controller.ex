defmodule DummyashWeb.PageController do
  use DummyashWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def health(conn, _) do
    # this isn't how it should be done
    _ = Ash.count!(DummyAsh.Projects.Project)

    tag = "oioi"

    conn
    |> json(%{version: tag})
  end
end
