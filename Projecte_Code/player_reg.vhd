library ieee;
use ieee.std_logic_1164.all;

entity player_reg is
	port(
		clk50: in std_logic;
		nrst: in std_logic;
		
		up: in std_logic;
		down: in std_logic;
		turn_right: in std_logic;
		turn_left: in std_logic;
		
		read_move: in std_logic;
		new_code: in std_logic;
		game_over: in std_logic;
		
		initialize: in std_logic;
		switch: in std_logic;
		
		movt_new: out std_logic;
		x: out integer range -1 to 1;
		y: out integer range -1 to 1;
		key_read: out std_logic
	);
end player_reg;

architecture func of player_reg is
	type states is (wait_init, p1_init, p2_init, wait_move, move_read, ack_key, ack_game);
	signal st: states;
begin
	process (clk50, nrst) begin
		if nrst = '0' then st <= wait_init;
		elsif clk50'event and clk50 = '1' then
			case st is
				when wait_init => if initialize = '1' then 
									if switch = '0' then st <= p1_init;
									else st <= p2_init;
									end if;
								  end if;
				when p1_init => st <= wait_move;
				when p2_init => st <= wait_move;
				when wait_move => if game_over = '1' then st <= wait_init; elsif new_code = '1' then st <= move_read; end if;
				when move_read => st <= ack_key;
				when ack_key => st <= ack_game;
				when ack_game => if game_over = '1' then st <= wait_init; elsif read_move = '1' then st <= wait_move; end if;
			end case;
		end if;
	end process;
	
	process (clk50, nrst) begin
		if nrst = '0' then x <= 0; y <= 0;
		elsif clk50'event and clk50 = '1' then
			if st = p1_init then x <= 1; y <= 0;
			elsif st = p2_init then  x <= -1; y <= 0;
			elsif st = move_read then
				if up = '1' then x <= 0; y <= -1; end if;
				if down = '1' then x <= 0; y <= 1; end if;
				if turn_left = '1' then x <= -1; y <= 0; end if;
				if turn_right = '1' then x <= 1; y <= 0; end if;
			end if;
		end if;
	end process;
	
	movt_new <= '1' when st = ack_game else '0';
	key_read <= '1' when st = ack_key else '0';
	
end func;

