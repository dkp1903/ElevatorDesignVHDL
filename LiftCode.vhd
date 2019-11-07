    ----------------------------------------------------------------------------------
    -- Company: 
    -- Engineer: 
    -- 
    -- Create Date:    14:34:45 11/14/2018 
    -- Design Name: 
    -- Module Name:    elevator - Behavioral 
    -- Project Name: 
    -- Target Devices: 
    -- Tool versions: 
    -- Description: 
    --
    -- Dependencies: 
    --
    -- Revision: 
    -- Revision 0.01 - File Created
    -- Additional Comments: 
    --
    ----------------------------------------------------------------------------------
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

    -- Uncomment the following library declaration if using
    -- arithmetic functions with Signed or Unsigned values
    --use IEEE.NUMERIC_STD.ALL;

    -- Uncomment the following library declaration if instantiating
    -- any Xilinx primitives in this code.
    --library UNISIM;
    --use UNISIM.VComponents.all;

    entity elevator is
    Port (  
      call0 : in STD_LOGIC;
      call1 : in STD_LOGIC;
      call2 : in STD_LOGIC;
      bottom : in STD_LOGIC;
      middle_minus : in STD_LOGIC;
      middle_plus : in STD_LOGIC;
      top : in STD_LOGIC;
      reset : in STD_LOGIC;
      enable : in STD_LOGIC;
      clock : in STD_LOGIC; 
      enlift : out STD_LOGIC;
      indicator0 : out STD_LOGIC;
      indicator1 : out STD_LOGIC;
      indicator2 : out STD_LOGIC;
      direction: out std_logic_vector (1 downto 0)
      );
    end elevator;

    architecture Behavioral of elevator is

      signal floor: std_logic_vector (1 downto 0):="00";
      TYPE num_state IS (F0, F1, F2, MU1,MU2,MD1,MD0);
      signal current_state:	num_state ;

      signal c,temp: std_logic;
    signal count : integer range 0 to 2499 :=0;
    begin 

    process(clock)
            begin
                if(rising_edge(clock)) then
                    if(count = 2499) then
                        temp <= not temp;
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;
                end if;
            end process;
        c <= temp;


     process(c)

      begin
       if(rising_edge(c)) then
        if(enable='1') then


    --			if(reset='1') then
    --				--floor := "00";
    --				if( current_state /= F0) then
    --				direction <="10";
    --				else
    --				direction <="00";
    --				end if;
    --				enlift <= '1';
    --				indicator0 <= '1';
    --				indicator1 <= '0';
    --				indicator2 <= '0';
    --				current_state <= F0;
           --else
            if(current_state = F0) then

              if(call2 ='1') then
                --floor := "00";
                direction <="01";
                enlift <= '1';
                indicator0 <= '0';
                indicator1 <= '0';
                indicator2 <= '1';
                current_state <= MU2;
              elsif(call1 = '1') then
                --floor := "01";
                direction <="01";
                enlift <= '1';
                indicator0 <= '0';
                indicator1 <= '1';
                indicator2 <= '0';
                current_state <= MU1;
              else
                --floor := "10";
                direction <="00";
                enlift <= '0';
                indicator0 <= '0';
                indicator1 <= '0';
                indicator2 <= '0';
                current_state <= F0;
              end if;

            elsif(current_state = MU1) then
              if(reset='1') then
                enlift<='1';
                direction<="10";
                current_state<=MD0;

              elsif(middle_plus='1' and middle_minus='1') then
                current_state <= F1;
                direction <= "01";
                --floor := "01";
                enlift <= '1';
                indicator0 <= '0';
                indicator1 <= '1';
                indicator2 <= '0';
              end if;

            elsif(current_state = MU2) then
                if(reset='1' and enable='1') then
                direction<="10";
                enlift<='1';
                current_state<=MD0;

              elsif(top='1') then
                current_state <= F2;
                direction <= "01";
                enlift <= '1';
                --floor := "10";
                indicator0 <= '0';
                indicator1 <= '0';
                indicator2 <= '1';
              end if;
            elsif(current_state = F1) then
              if(reset='1' and enable='1') then
                direction<="10";
                enlift<='1';
                current_state<=MD0;
                --end if;
              elsif(call0 ='1') then	
                direction <="10";
                enlift <= '1';
                indicator0 <= '1';
                indicator1 <= '0';
                indicator2 <= '0';
                current_state <= MD0;
              elsif(call2 = '1') then
                --floor := "10";
                direction <="01";
                enlift <= '1';
                indicator0 <= '0';
                indicator1 <= '0';
                indicator2 <= '1';
                current_state <= MU2;
              else
                --floor := "10";
                direction <="00";
                enlift <= '0';
                indicator0 <= '0';
                indicator1 <= '0';
                indicator2 <= '0';
                current_state <= F1;
              end if;

            elsif(current_state = F2) then
              if(reset='1') then
                direction<="10";
                enlift<='1';
                current_state<=MD0;
              elsif(call0 ='1') then
                --floor := "00";
                direction <="10";
                enlift <= '1';
                indicator0 <= '1';
                indicator1 <= '0';
                indicator2 <= '0';
                current_state <= MD0;
              elsif(call1 = '1') then
                --floor := "10";
                direction <="10";
                enlift <= '1';
                indicator0 <= '0';
                indicator1 <= '1';
                indicator2 <= '0';
                current_state <= MD1;
              else
                --floor := "10";
                direction <="00";
                enlift <= '0';
                indicator0 <= '0';
                indicator1 <= '0';
                indicator2 <= '0';
                current_state <= F2;
              end if;

            elsif(current_state = MD0) then
              if(bottom='1') then
                current_state <= F0;
                direction <= "10";
                --floor := "10";
                enlift <= '0';
                indicator0 <= '1';
                indicator1 <= '0';
                indicator2 <= '0';
              end if;

            elsif(current_state = MD1) then
              if(reset='1') then
                direction<="10";
                enlift<='1';
                current_state<=MD0;

              elsif(middle_plus='1' and middle_minus='1') then
                current_state <= F1;
                direction <= "10";
                enlift <= '1';
                --floor := "10";
                indicator0 <= '0';
                indicator1 <= '1';
                indicator2 <= '0';
              end if;
            end if;
          --end if;
          else 
          enlift<='0';
          direction<="00";




        end if;
       end if;

    end process;
    end Behavioral;

