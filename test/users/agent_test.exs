defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent

  setup do
    UserAgent.start_link(%{})
    :ok
  end

  describe "save/1" do
    test "save the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    test "when the user is found return the user" do
      :user
      |> build(cpf: "11122233355")
      |> UserAgent.save()

      response = UserAgent.get("11122233355")

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua das Bananeiras, 17",
           age: 43,
           cpf: "11122233355",
           email: "fabiano@banana.com",
           name: "Fabiano"
         }}

      assert response == expected_response
    end

    test "when the user is not found return an error" do
      response = UserAgent.get("00099909099")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
