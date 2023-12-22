defmodule TodoWeb.FooLive do
  use TodoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Foo</h1>
    """
  end
end
