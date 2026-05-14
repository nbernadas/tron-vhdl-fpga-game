library ieee;
use ieee.std_logic_1164.all;

entity rx_module is
	port(
		clk50: in std_logic;
		nrst: in std_logic;
		rx: in std_logic;
		game_read: in std_logic;
		
		opp_x: out std_logic;
		opp_y: out std_logic;
		new_move: out std_logic
	);
end rx_module;