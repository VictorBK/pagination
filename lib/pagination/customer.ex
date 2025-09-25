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

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:index, :customer_id, :first_name, :last_name, :company, :city, :country, :phone_1, :phone_2, :email, :subscription_date, :website])
    |> validate_required([:customer_id, :first_name, :last_name, :phone_1, :email])
    |> unique_constraints(:index)
  end
end
