defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n===== Jogo Iniciado! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== é a vez do #{player}  =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n===== Fim do Jogo  =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n===== Invalid Move: #{move}. =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n===== Player attacked computer dealing #{damage} damage  :) =====\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n===== Computer attacked player dealing #{damage} damage  :( =====\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n===== O #{player} curou #{life}  :( =====\n")
  end
end
