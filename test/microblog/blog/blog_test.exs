defmodule Microblog.BlogTest do
  use Microblog.DataCase

  alias Microblog.Blog

  describe "messages" do
    alias Microblog.Blog.Message

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_message()

      message
    end

    # test "list_messages/0 returns all messages" do
    # message = message_fixture()
    # assert Blog.list_messages() == [message]
    # end

    # test "get_message!/1 returns the message with given id" do
    # message = message_fixture()
    # assert Blog.get_message!(message.id) == message
    # end

    # test "create_message/1 with valid data creates a message" do
    # assert {:ok, %Message{} = message} = Blog.create_message(@valid_attrs)
    # assert message.content == "some content"
    # end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_message(@invalid_attrs)
    end

    # test "update_message/2 with valid data updates the message" do
    # message = message_fixture()
    # assert {:ok, message} = Blog.update_message(message, @update_attrs)
    # assert %Message{} = message
    # assert message.content == "some updated content"
    # end

    # test "update_message/2 with invalid data returns error changeset" do
    # message = message_fixture()
    # assert {:error, %Ecto.Changeset{}} = Blog.update_message(message, @invalid_attrs)
    # assert message == Blog.get_message!(message.id)
    # end

    # test "delete_message/1 deletes the message" do
    # message = message_fixture()
    # assert {:ok, %Message{}} = Blog.delete_message(message)
    # assert_raise Ecto.NoResultsError, fn -> Blog.get_message!(message.id) end
    # end

    # test "change_message/1 returns a message changeset" do
    # message = message_fixture()
    # assert %Ecto.Changeset{} = Blog.change_message(message)
    # end
  end

  describe "follows" do
    alias Microblog.Blog.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_follow()

      follow
    end

    # test "list_follows/0 returns all follows" do
    # follow = follow_fixture()
    # assert Blog.list_follows() == [follow]
    # end

    # test "get_follow!/1 returns the follow with given id" do
    # follow = follow_fixture()
    # assert Blog.get_follow!(follow.id) == follow
    # end

    # test "create_follow/1 with valid data creates a follow" do
    # assert {:ok, %Follow{} = follow} = Blog.create_follow(@valid_attrs)
    # end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_follow(@invalid_attrs)
    end

    # test "update_follow/2 with valid data updates the follow" do
    # follow = follow_fixture()
    # assert {:ok, follow} = Blog.update_follow(follow, @update_attrs)
    # assert %Follow{} = follow
    # end

    # test "update_follow/2 with invalid data returns error changeset" do
    # follow = follow_fixture()
    # assert {:error, %Ecto.Changeset{}} = Blog.update_follow(follow, @invalid_attrs)
    # assert follow == Blog.get_follow!(follow.id)
    # end

    # test "delete_follow/1 deletes the follow" do
    # follow = follow_fixture()
    # assert {:ok, %Follow{}} = Blog.delete_follow(follow)
    # assert_raise Ecto.NoResultsError, fn -> Blog.get_follow!(follow.id) end
    # end

    # test "change_follow/1 returns a follow changeset" do
    # follow = follow_fixture()
    # assert %Ecto.Changeset{} = Blog.change_follow(follow)
    # end
  end

  describe "likes" do
    alias Microblog.Blog.Like

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_like()

      like
    end

   # test "list_likes/0 returns all likes" do
   #  like = like_fixture()
   #  assert Blog.list_likes() == [like]
   #  end

    # test "get_like!/1 returns the like with given id" do
    # like = like_fixture()
    # assert Blog.get_like!(like.id) == like
    # end

    # test "create_like/1 with valid data creates a like" do
    # assert {:ok, %Like{} = like} = Blog.create_like(@valid_attrs)
    # end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_like(@invalid_attrs)
    end

    # test "update_like/2 with valid data updates the like" do
    # like = like_fixture()
    # assert {:ok, like} = Blog.update_like(like, @update_attrs)
    # assert %Like{} = like
    # end

    # test "update_like/2 with invalid data returns error changeset" do
    # like = like_fixture()
    # assert {:error, %Ecto.Changeset{}} = Blog.update_like(like, @invalid_attrs)
    # assert like == Blog.get_like!(like.id)
    # end

    # test "delete_like/1 deletes the like" do
    # like = like_fixture()
    # assert {:ok, %Like{}} = Blog.delete_like(like)
    # assert_raise Ecto.NoResultsError, fn -> Blog.get_like!(like.id) end
    # end

    # test "change_like/1 returns a like changeset" do
    # like = like_fixture()
    # assert %Ecto.Changeset{} = Blog.change_like(like)
    # end
  end
end
