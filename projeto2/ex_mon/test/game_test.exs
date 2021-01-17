defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "inicia o jogo" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("PC", :chute, :soco, :cura)
      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "retorna estado do jogo" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("PC", :chute, :soco, :cura)
      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "PC"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Rafael"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "estado do jogo sendo atualizado" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("PC", :chute, :soco, :cura)
      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "PC"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Rafael"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %Player{
          life: 85,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "PC"
        },
        player: %Player{
          life: 50,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Rafael"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end
