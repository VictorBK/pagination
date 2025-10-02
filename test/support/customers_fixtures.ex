defmodule Pagination.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating customers
  """

  alias Pagination.Repo
  alias Pagination.Customers.Customer


  def customer_fixture(attrs \\ %{}) do
    default_attrs = %{
      first_name: "John",
      last_name: "Doe",
      email: "user#{System.unique_integer([:positive])}@example.com",
      country: "USA",
      subscription_date: ~D[2024-01-01]
    }

    attrs = Map.merge(default_attrs, attrs)

    Repo.insert!(%Customer{
      first_name: attrs.first_name,
      last_name: attrs.last_name,
      email: attrs.email,
      country: attrs.country,
      subscription_date: attrs.subscription_date
      })
  end

  def customers_fixture(count) do
    Enum.map(1..count, fn i ->
      customer_fixture(%{
        last_name: "Doe#{i}",
        email: "user#{i}@example.com"
      })
    end)
  end
end
