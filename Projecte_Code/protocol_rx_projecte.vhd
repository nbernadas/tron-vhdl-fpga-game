library ieee;
use ieee.std_logic_1164.all;

entity protocol_rx_projecte is
	port (
		clk50, nrst: in std_logic;
		rx_data: in std_logic_vector(2 downto 0);
		up, down, turn_right, turn_left, ast: out std_logic;
		data_read, new_frame: out std_logic;
		rx_new, frame_read: in std_logic
		);
end protocol_rx_projecte;

architecture main of protocol_rx_projecte is

	type states is (st_wait, st_read, st_send, st_wait_ack);
	signal st: states;
	signal rx_data_aux: std_logic_vector(2 downto 0);

begin
		process (clk50, nrst) begin
			if nrst = '0' then
				st <= st_wait;
				
			elsif clk50'EVENT and clk50 = '1' then
				case st is
					when st_wait => if rx_new = '1' then st <= st_read; end if;
					when st_read => st <= st_send;
					when st_send => st <= st_wait_ack;
					when st_wait_ack => if frame_read = '1' then st <= st_wait; end if;
				end case;
			end if;
		end process;
		
		process (clk50, nrst) begin
			if nrst = '0' then
				rx_data_aux <= "000";
				
			elsif clk50'EVENT and clk50 = '1' then
				if st = st_read then rx_data_aux <= rx_data; end if;
			end if;
		end process;
		
		process (clk50, nrst) begin
			if nrst = '0' then
				up <= '0'; down <= '0'; turn_right <= '0'; turn_left <= '0'; ast <= '0';
				
			elsif clk50'event and clk50 = '1' then
				if st =st_send then
					if rx_data_aux = "010" then up <= '0'; down <= '1'; turn_right <= '0'; turn_left <= '0'; ast <= '0';
					elsif rx_data_aux = "011" then up <= '1'; down <= '0'; turn_right <= '0'; turn_left <= '0'; ast <= '0';
					elsif rx_data_aux = "000" then up <= '0'; down <= '0'; turn_right <= '1'; turn_left <= '0'; ast <= '0';
					elsif rx_data_aux = "001" then up <= '0'; down <= '0'; turn_right <= '0'; turn_left <= '1'; ast <= '0';
					elsif rx_data_aux = "100" then up <= '0'; down <= '0'; turn_right <= '0'; turn_left <= '0'; ast <= '1';
					end if;
				end if;
			end if;
		end process;
		
		new_frame <= '1' when st = st_wait_ack else '0';

		data_read <= '1' when st = st_send else '0';
end; 