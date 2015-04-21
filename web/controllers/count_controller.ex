defmodule Button.CountController do
  use Button.Web, :controller
  import Ecto.Query
  alias Button.Click
  plug :action

  def index(conn, _params) do
    query = (from c in Click, select: count(c.id))
    count = Button.Repo.one(query)
    send_resp(conn, 200, "#{count}")
  end

  def create(conn, %{"ip" => ip}) do
    click = %Click{ip: ip, last_clicked: Ecto.DateTime.utc()}
    |> Repo.insert
    json(conn, click)
  end

  def latest(conn, %{"ip" => ip}) do
    query = (from c in Click, where: c.ip == ^ip, select: c.last_clicked,
    limit: 1, order_by: [desc: c.id])
    send_resp(conn, 200, Ecto.DateTime.to_iso8601(Repo.one(query)))
  end
end
