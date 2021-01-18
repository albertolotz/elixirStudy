defmodule ExMonWeb.Controllers.TrainersControllerTest do
  use ExMonWeb.ConnCase

  alias ExMon.Trainer

  describe "show/2" do
    test "when exist a trainer with the given id, show it", %{conn: conn} do
      params = %{name: "Alberto", password: "123456"}

      {:ok, %Trainer{id: id}} = ExMon.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Alberto"} = response
    end

    test "when error  return the error", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "invalid_id"))
        |> json_response(:bad_request)

      expectd_response = %{"message" => "Invalid ID format!"}

      assert response == expectd_response
    end
  end
end
