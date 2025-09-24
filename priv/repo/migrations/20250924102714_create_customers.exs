defmodule Pagination.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :index, :integer, null: false
      add :customer_id, :string, null: false
      add :first_name, :string
      add :last_name, :string
      add :company, :string
      add :city, :string
      add :country, :string
      add :phone_1, :string
      add :phone_2, :string
      add :email, :string
      add :subscription_date, :date
      add :website, :string

      timestamps()
    end

    create unique_index(:customers, [:index])
    create index(:customers, [:subscription_date, :index])
  end
end
