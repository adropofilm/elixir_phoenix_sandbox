defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  def new(conn, params) do
    IO.inspect conn
    IO.inspect params
  end

end
