defmodule Pagination.Customers.Customer do
  use Ecto.Schema

  import Ecto.Changeset

  schema "customers" do
    field :first_name, :string
    field :last_name, :string
    field :country, :string
    field :email, :string
    field :subscription_date, :date

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :country, :email, :subscription_date])
    |> validate_required([:first_name, :last_name, :email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/, message: "must be a valid email address")
    |> validate_length(:first_name, min: 2, max: 20)
    |> validate_length(:last_name, min: 2, max: 20)
    |> unique_constraint(:email)
  end
end
