defmodule Button.Repo.Migrations.CreateClick do
  use Ecto.Migration

  def change do
    create table(:clicks) do
      add :ip, :string
      add :last_clicked, :datetime

      timestamps
    end
  end
end
