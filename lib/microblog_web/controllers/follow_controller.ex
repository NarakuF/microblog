defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Follow

  def index(conn, _params) do
    redirect conn, to: message_path(conn, :index)
  end

  def new(conn, _params) do
    changeset = Blog.change_follow(%Follow{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"follow" => follow_params}) do
    case Blog.create_follow(follow_params) do
      {:ok, follow} ->
        following_user = Microblog.Accounts.get_user!(follow.following_user_id)
        conn
        |> put_flash(:info, "Follow created successfully.")
        |> redirect(to: user_path(conn, :show, following_user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = Blog.get_follow!(id)
    render(conn, "show.html", follow: follow)
  end

  def edit(conn, %{"id" => id}) do
    follow = Blog.get_follow!(id)
    changeset = Blog.change_follow(follow)
    render(conn, "edit.html", follow: follow, changeset: changeset)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = Blog.get_follow!(id)

    case Blog.update_follow(follow, follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow updated successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follow: follow, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = Blog.get_follow!(id)
    user = Microblog.Accounts.get_user!(follow.following_user_id)
    {:ok, _follow} = Blog.delete_follow(follow)

    conn
    |> put_flash(:info, "Follow deleted successfully.")
    |> redirect(to: user_path(conn, :show, user))
  end
end
