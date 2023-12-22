defmodule TodoWeb.HomeLive do
  use TodoWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    Coming Soon
    """
  end
end
