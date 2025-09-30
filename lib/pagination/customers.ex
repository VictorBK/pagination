defmodule Pagination.Customers do
  @moduledoc """
  Context for managing Customers and Pagination.
  """

  import Ecto.Query
  alias Pagination.Repo
  alias Pagination.Customers.Customer

  @default_page_size 20

  @doc """
  Get first page of customers.
  Example: Customers.list_customers(10)
  """
  def list_customers(page_size \\ @default_page_size) do
    query =
      from c in Customer,
        order_by: [asc: c.id],
        limit: ^(page_size + 1)

    customers = Repo.all(query)
    build_page_response(customers, page_size)
  end

  # page response helper
  defp build_page_response(customers, page_size) do
    has_more = length(customers) > page_size
    data = if has_more, do: Enum.take(customers, page_size), else: customers

    %{
      data: data,
      has_more: has_more,
      next_cursor: get_next_cursor(data),
      prev_cursor: get_prev_cursor(data),
      count: length(data)
    }
  end

  defp get_next_cursor([]), do: nil
  defp get_next_cursor(customers), do: List.last(customers).id

  defp get_prev_cursor([]), do: nil
  defp get_prev_cursor(customers), do: List.first(customers).id
end
