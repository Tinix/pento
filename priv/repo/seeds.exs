# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pento.Catalog

products = [
  %{
    name: "Chess",
    description: "The classic game of chess",
    sku: 5_678_901,
    unit_price: 10
  },
  %{
    name: "Tic-Tac-Toe",
    description: "The game of cats and dogs",
    sku: 11_121_314,
    unit_price: 3.00
  },
  %{
    name: "Table Tennis",
    description: "Bat and ball back and forth. Don't miss!",
    sku: 15_222_324,
    unit_price: 12.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)
