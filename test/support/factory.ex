defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Fabiano",
      email: "fabiano@banana.com",
      cpf: "12345678900",
      age: 43,
      address: "Rua das Bananeiras, 17"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza Portuguesa",
      category: :pizza,
      unity_price: Decimal.new("59.80"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das Bananeiras, 17",
      items: [
        %Item{
          category: :pizza,
          description: "Pizza Portuguesa",
          quantity: 1,
          unity_price: Decimal.new("59.80")
        },
        %Item{
          category: :japonesa,
          description: "Temaki",
          quantity: 2,
          unity_price: Decimal.new("19.90")
        },
        %Item{
          category: :sobremesa,
          description: "Açaí",
          quantity: 3,
          unity_price: Decimal.new("4.90")
        }
      ],
      total_price: Decimal.new("114.30"),
      user_cpf: "12345678900"
    }
  end
end
