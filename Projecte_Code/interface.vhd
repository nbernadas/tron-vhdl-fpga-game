library ieee;
use ieee.std_logic_1164.all;

entity interface is
	port(
		clk50: in std_logic;
		nrst: in std_logic;
		
		led_win: in std_logic;
		led_lose: in std_logic;
		led_tie: in std_logic;
		
		begin_three_segs: in std_logic;
		memory_content: in std_logic_vector(2 downto 0);
		
		memory_address: out std_logic_vector(14 downto 0);
		vga_r: out std_logic_vector(9 downto 0);
		vga_b: out std_logic_vector(9 downto 0);
		vga_a: out std_logic_vector(9 downto 0);
		vga_hs: out std_logic;
		vga_vs: out std_logic;
		vga_blank: out std_logic;
		vga_sync: out std_logic;
		vga_clk: out std_logic;
		hex0: out std_logic_vector(6 downto 0);
		led_red: out std_logic;
		led_green: out std_logic
	);
end interface;