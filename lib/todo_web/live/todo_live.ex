defmodule TodoWeb.TodoLive do
  use TodoWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Hello</h1>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end

