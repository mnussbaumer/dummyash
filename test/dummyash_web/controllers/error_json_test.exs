defmodule DummyashWeb.ErrorJSONTest do
  use DummyashWeb.ConnCase, async: true

  test "renders 404" do
    assert DummyashWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert DummyashWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
