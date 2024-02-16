defmodule Pento.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.Blogs` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> Pento.Blogs.create_blog()

    blog
  end
end
