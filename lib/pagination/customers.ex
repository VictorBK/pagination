defmodule Pagination.Customers do
  @moduledoc """
  Context for managing Customers and Pagination.
  """


  import Ecto.Query
  alias Pagination.Repo
  alias Pagination.Customer

  @default_page_size 20

  @doc """
  Get first page of customers.
  Example: Customers.list_customers(10)
  """
  def list_customers(page_size \\ @default_page_size) do
    query =
      from c in Customer,
      where: c.id > ^cursor_id,
      order_by: [desc: c.id],
      limit: ^(page_size + 1)

      customers = Repo.all(query)
      build_page_response(customers, page_size)
  end
end
