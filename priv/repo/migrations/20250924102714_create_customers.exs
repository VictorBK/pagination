defmodule Pagination.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string
      add :last_name, :string
      add :country, :string
      add :email, :string
      add :subscription_date, :date

      timestamps()
    end

    create index(:customers, [:customer_id])
    create index(:customers, [:email])
    create index(:customers, [:country])
    create index(:customers, [:subscription_date])
  end
end
