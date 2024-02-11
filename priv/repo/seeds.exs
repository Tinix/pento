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

defmodule Seeder do
  alias Pento.Catalog
  alias FakerElixir.{Number, Lorem, Name}

  def run do
    if Catalog.list_products() |> Enum.empty?() do
      Enum.each(1..6, fn _ ->
        attrs = %{
          name: Name.name(),
          description: Lorem.sentence(),
          sku: Number.digits(5),
          unit_price: Number.decimal(2)
        }

        Catalog.create_product(attrs)
        |> IO.inspect(label: "Product created:")
      end)
    end
  end
end

Seeder.run()
