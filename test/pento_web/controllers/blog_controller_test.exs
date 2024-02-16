defmodule PentoWeb.BlogControllerTest do
  use PentoWeb.ConnCase

  import Pento.BlogsFixtures

  @create_attrs %{title: "some title", content: "some content"}
  @update_attrs %{title: "some updated title", content: "some updated content"}
  @invalid_attrs %{title: nil, content: nil}

  describe "index" do
    test "lists all blog", %{conn: conn} do
      conn = get(conn, ~p"/blog")
      assert html_response(conn, 200) =~ "Listing Blog"
    end
  end

  describe "new blog" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/blog/new")
      assert html_response(conn, 200) =~ "New Blog"
    end
  end

  describe "create blog" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/blog", blog: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/blog/#{id}"

      conn = get(conn, ~p"/blog/#{id}")
      assert html_response(conn, 200) =~ "Blog #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/blog", blog: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Blog"
    end
  end

  describe "edit blog" do
    setup [:create_blog]

    test "renders form for editing chosen blog", %{conn: conn, blog: blog} do
      conn = get(conn, ~p"/blog/#{blog}/edit")
      assert html_response(conn, 200) =~ "Edit Blog"
    end
  end

  describe "update blog" do
    setup [:create_blog]

    test "redirects when data is valid", %{conn: conn, blog: blog} do
      conn = put(conn, ~p"/blog/#{blog}", blog: @update_attrs)
      assert redirected_to(conn) == ~p"/blog/#{blog}"

      conn = get(conn, ~p"/blog/#{blog}")
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, blog: blog} do
      conn = put(conn, ~p"/blog/#{blog}", blog: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Blog"
    end
  end

  describe "delete blog" do
    setup [:create_blog]

    test "deletes chosen blog", %{conn: conn, blog: blog} do
      conn = delete(conn, ~p"/blog/#{blog}")
      assert redirected_to(conn) == ~p"/blog"

      assert_error_sent 404, fn ->
        get(conn, ~p"/blog/#{blog}")
      end
    end
  end

  defp create_blog(_) do
    blog = blog_fixture()
    %{blog: blog}
  end
end
