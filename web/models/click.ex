defmodule Button.Click do
  use Button.Web, :model

  schema "clicks" do
    field :ip, :string
    field :last_clicked, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(ip last_clicked)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
