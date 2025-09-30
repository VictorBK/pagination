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

  end
end
