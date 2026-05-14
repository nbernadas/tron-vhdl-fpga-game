library ieee;
use ieee.std_logic_1164.all;

entity keyboard is
	port(
		clk50: in std_logic;
		nrst: in std_logic;
		
		key_read: in std_logic;
		col: in std_logic_vector(3 downto 0);
		
		ast: out std_logic;
		row: out std_logic_vector(3 downto 0);
		new_key_flag: out std_logic;
		keycode: out std_logic_vector(3 downto 0)
	);
end keyboard;