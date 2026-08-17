defmodule DummyashWeb.PageController do
  use DummyashWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
