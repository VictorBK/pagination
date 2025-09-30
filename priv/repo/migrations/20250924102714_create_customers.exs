defmodule Pagination.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :country, :string
      add :email, :string
      add :subscription_date, :date

      timestamps()
    end

    create index(:customers, [:email])
    create index(:customers, [:country])
    create index(:customers, [:subscription_date])
  end
end
