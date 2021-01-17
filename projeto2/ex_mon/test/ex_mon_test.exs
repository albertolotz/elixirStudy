defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "retorna o jogador criado" do
      expectd_response = %Player{
        life: 100,
        moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
        name: "Alberto"
      }

      assert expectd_response == ExMon.create_player("Alberto", :soco, :chute, :cura)
    end
  end

  describe "start_game/1" do
    test "mensagem quando game começa" do
      player = Player.build("Rafael", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "é a vez do computer"
    end
  end
end
