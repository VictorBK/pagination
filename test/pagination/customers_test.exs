defmodule Pagination.CustomersTest do
use Pagination.DataCase
alias Pagination.Customers

describe "list_customers/1" do
    test "returns empty result when no customers" do
      result = Customers.list_customers()

      assert result.data == []
      assert result.has_more == false
      assert result.next_cursor == nil
    end

    test "returns customers with Pagination info" do
      customers_fixture(5)

      result = Customers.list_customers(3)

      assert length(result.data) == 3
    end

  end
end
