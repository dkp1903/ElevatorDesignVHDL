    --------------------------------------------------------------------------------
    -- Company: 
    -- Engineer:
    --
    -- Create Date:   14:10:14 10/17/2019
    -- Design Name:   
    -- Module Name:   C:/Users/student/pudo/jliftcode/jliftcode_test.vhd
    -- Project Name:  jliftcode
    -- Target Device:  
    -- Tool versions:  
    -- Description:   
    -- 
    -- VHDL Test Bench Created by ISE for module: JLIFTCODE
    -- 
    -- Dependencies:
    -- 
    -- Revision:
    -- Revision 0.01 - File Created
    -- Additional Comments:
    --
    -- Notes: 
    -- This testbench has been automatically generated using types std_logic and
    -- std_logic_vector for the ports of the unit under test.  Xilinx recommends
    -- that these types always be used for the top-level I/O of a design in order
    -- to guarantee that the testbench will bind correctly to the post-implementation 
    -- simulation model.
    --------------------------------------------------------------------------------
    LIBRARY ieee;
    USE ieee.std_logic_1164.ALL;

    -- Uncomment the following library declaration if using
    -- arithmetic functions with Signed or Unsigned values
    --USE ieee.numeric_std.ALL;

    ENTITY jliftcode_test IS
    END jliftcode_test;

    ARCHITECTURE behavior OF jliftcode_test IS 

        -- Component Declaration for the Unit Under Test (UUT)

        COMPONENT JLIFTCODE
        PORT(
             c0 : IN  std_logic;
             c1 : IN  std_logic;
             c2 : IN  std_logic;
             t : IN  std_logic;
             b : IN  std_logic;
             mp : IN  std_logic;
             mn : IN  std_logic;
             clk : IN  std_logic;
             reset : IN  std_logic;
             i0 : OUT  std_logic;
             i1 : OUT  std_logic;
             i2 : OUT  std_logic;
             dir1 : OUT  std_logic;
             dir2 : OUT  std_logic;
             enable : OUT  std_logic
            );
        END COMPONENT;


       --Inputs
       signal c0 : std_logic := '0';
       signal c1 : std_logic := '0';
       signal c2 : std_logic := '0';
       signal t : std_logic := '0';
       signal b : std_logic := '0';
       signal mp : std_logic := '0';
       signal mn : std_logic := '0';
       signal clk : std_logic := '0';
       signal reset : std_logic := '0';

      --Outputs
       signal i0 : std_logic;
       signal i1 : std_logic;
       signal i2 : std_logic;
       signal dir1 : std_logic;
       signal dir2 : std_logic;
       signal enable : std_logic;

       -- Clock period definitions
       constant clk_period : time := 10 ns;

    BEGIN

      -- Instantiate the Unit Under Test (UUT)
       uut: JLIFTCODE PORT MAP (
              c0 => c0,
              c1 => c1,
              c2 => c2,
              t => t,
              b => b,
              mp => mp,
              mn => mn,
              clk => clk,
              reset => reset,
              i0 => i0,
              i1 => i1,
              i2 => i2,
              dir1 => dir1,
              dir2 => dir2,
              enable => enable
            );

       -- Clock process definitions
       clk_process :process
       begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
       end process;


       -- Stimulus process
       stim_proc: process
       begin		
          -- hold reset state for 100 ns.
          wait for 100 ns;	

          wait for clk_period*10;
        c0<='0';
        c1<='0';
        c2<='1';
        t<='0';
        b<='1';
        mp<='0';
        mn<='0';
        reset<='0';



          wait for clk_period*10;
        c0<='0';
        c1<='1';
        c2<='0';
        t<='1';
        b<='0';
        mp<='0';
        mn<='0';
        reset<='0';

          -- insert stimulus here 

          wait;
       end process;

    END;
