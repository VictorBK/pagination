defmodule Pagination.Customer do
  use Ecto.Schema

  schema "customers" do
    field :index, :integer
    field :customer_id, :string
    field :first_name, :string
    field :last_name, :string
    field :company, :string
    field :city, :string
    field :country, :string
    field :phone_1, :string
    field :phone_2, :string
    field :email, :string
    field :subscription_date, :date
    field :website, :string

    timestamps()
  end
end
