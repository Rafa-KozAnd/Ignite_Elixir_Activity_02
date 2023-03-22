defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "create the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "12345678900,pizza,1,59.80japonesa,2,19.90sobremesa,3,4.90,114.30\n12345678900,pizza,1,59.80japonesa,2,19.90sobremesa,3,4.90,114.30\n"

      assert response == expected_response
    end
  end
end
