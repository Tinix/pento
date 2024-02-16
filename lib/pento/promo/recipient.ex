defmodule Pento.Promo.Recipient do
  defstruct [:first_name, :email]

  @types %{
    first_name: :string,
    email: :string
  }
  alias Pento.Promo.Recipient
  import Ecto.Changeset

  def changeset(%Recipient{} = user, attrs) do
    {user, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:first_name, :email])
    |> validate_format(:email, ~r/@/)
  end

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(recipient, attrs) do
    # TODO
  end
end
