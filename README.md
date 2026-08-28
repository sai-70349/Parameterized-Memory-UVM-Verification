# \# Parameterized Memory RTL Design and UVM-Based Functional Verification using SystemVerilog

# 

\## Project Overview



This project focuses on the design and functional verification of a parameterized memory using Verilog and SystemVerilog/UVM.



The memory RTL is configurable in terms of depth and data width, with the implemented configuration using \*\*32 memory locations × 8-bit data width\*\*. The design supports read and write operations along with synchronous reset functionality.



A reusable UVM-based verification environment is developed to verify the memory functionality through directed and constrained-random test cases, functional coverage, SystemVerilog Assertions (SVA), and a self-checking scoreboard.



\## Project Objective



The main objective of this project is to design and functionally verify a parameterized memory RTL using Verilog and a reusable UVM-based verification environment.



The verification aims to:



\* Verify correct memory read and write operations.

\* Verify synchronous reset functionality.

\* Verify configurable memory depth and data width.

\* Verify normal, corner, and boundary scenarios.

\* Verify data integrity using a self-checking scoreboard.

\* Use constrained-random testing to improve scenario coverage.

\* Use SystemVerilog Assertions (SVA) to check specified design behaviors.

\* Measure verification completeness using functional and code coverage.

\* Debug and analyze simulation behavior using QuestaSim waveforms.



\## DUT / Design Description



The Design Under Test (DUT) is a parameterized memory RTL implemented in Verilog.



\### Memory Configuration



\* \*\*Memory Depth:\*\* 32 locations

\* \*\*Data Width:\*\* 8 bits

\* \*\*Configuration:\*\* 32 × 8-bit memory

\* \*\*Read Operation:\*\* Supported

\* \*\*Write Operation:\*\* Supported

\* \*\*Reset:\*\* Synchronous reset

\* \*\*Parameterization:\*\* Memory depth and data width are configurable through parameters.



The parameterized design allows the same memory RTL to be reused with different memory depths and data widths without modifying the core memory implementation.



\## Technologies / Tools Used



\* \*\*Verilog HDL\*\* — Used for designing the parameterized memory RTL.

\* \*\*SystemVerilog\*\* — Used for developing the verification environment.

\* \*\*UVM (Universal Verification Methodology)\*\* — Used to build a reusable and structured verification environment.

\* \*\*QuestaSim\*\* — Used for simulation, waveform analysis, and debugging.

\* \*\*Git\*\* — Used for version control.

\* \*\*GitHub\*\* — Used for project repository management and sharing.



\## UVM Verification Environment



A reusable UVM-based verification environment was developed to verify the parameterized memory DUT.



The verification environment consists of the following components:



\* \*\*Sequence\*\* — Generates memory transactions for different verification scenarios.

\* \*\*Sequencer\*\* — Controls and sends sequence items to the driver.

\* \*\*Driver\*\* — Drives generated transactions to the DUT through the interface.

\* \*\*Monitor\*\* — Observes DUT signals and collects transactions.

\* \*\*Agent\*\* — Encapsulates the sequencer, driver, and monitor components.

\* \*\*Environment\*\* — Integrates the verification components.

\* \*\*Scoreboard\*\* — Performs self-checking by comparing expected and actual memory behavior.

\* \*\*Functional Coverage\*\* — Measures the verification of important memory operations and scenarios.



\### Verification Flow



```text

Sequence

&#x20;  ↓

Sequencer

&#x20;  ↓

Driver

&#x20;  ↓

Interface

&#x20;  ↓

Memory DUT

&#x20;  ↓

Monitor

&#x20;  ↓

Scoreboard

&#x20;  ↓

PASS / FAIL

```



Functional coverage is collected in parallel with the verification environment to measure verification completeness.



\## Test Cases / Verification Scenarios



The memory design was verified using directed and constrained-random test cases covering different read and write transaction scenarios.



| Test Case   | Description                                                                            |

| ----------- | -------------------------------------------------------------------------------------- |

| \*\*1WR\*\*     | Verifies a single write transaction to the memory.                                     |

| \*\*5WR\*\*     | Verifies five consecutive write transactions.                                          |

| \*\*1WR\_1RD\*\* | Verifies one write transaction followed by one read transaction.                       |

| \*\*5WR\_5RD\*\* | Verifies five write transactions followed by five read transactions.                   |

| \*\*NWR\_NRD\*\* | Verifies multiple write and read transactions using a variable number of transactions. |



These test cases are used to verify memory read/write functionality and data integrity across different transaction patterns.



\## Assertions



Procedural assertions were used to validate important verification operations and configuration checks.



The following assertions are used in the verification environment:



\### 1. Randomization Check



```systemverilog

assert(randomize());

```



This assertion checks whether transaction randomization is successful. If `randomize()` fails, the assertion reports a failure.



\### 2. Virtual Interface Configuration Check



```systemverilog

assert(uvm\_config\_db#(virtual mem\_intrf)::get(this,"","vif",vif));

```



This assertion checks whether the virtual interface is successfully retrieved from the UVM configuration database. If the interface is not available, the assertion reports a failure.



These checks help detect randomization failures and UVM virtual-interface configuration issues during simulation.



\## Functional Coverage



Functional coverage was implemented to measure the completeness of the memory verification across different read and write transaction scenarios.



The coverage was used to ensure that important memory operations and transaction combinations were exercised during simulation.



\### Coverage Highlights



\* Read and write transaction scenarios were covered.

\* Normal, corner, and boundary scenarios were exercised.

\* Directed and constrained-random tests were used to improve scenario coverage.

\* \*\*Functional Coverage Achieved: 95%+\*\*

\* \*\*Code Coverage Achieved: 95%+\*\*



\### Functional Coverage Report



!\[Functional Coverage](screenshots/functional\_coverage.png)



\### Code Coverage Report



!\[Code Coverage](screenshots/code\_coverage.png)





\## Simulation / Verification Results



The parameterized memory RTL was verified using directed and constrained-random test cases in QuestaSim.



\### Test Results



| Test Case   | Result |

| ----------- | ------ |

| \*\*1WR\*\*     | PASS   |

| \*\*5WR\*\*     | PASS   |

| \*\*1WR\_1RD\*\* | PASS   |

| \*\*5WR\_5RD\*\* | PASS   |

| \*\*NWR\_NRD\*\* | PASS   |



The verification environment uses a self-checking scoreboard to compare expected and actual memory behavior. Waveform-based debugging was performed in QuestaSim to analyze and validate DUT behavior.



All implemented test scenarios completed successfully with \*\*zero unresolved scoreboard mismatches\*\*.



\### Coverage Results



\* \*\*Functional Coverage:\*\* 95%+

\* \*\*Code Coverage:\*\* 95%+



\## Simulation Waveforms / Screenshots



The following QuestaSim waveform screenshots demonstrate the memory read and write operations for the implemented verification scenarios.



\### 1WR — Single Write



!\[1WR Test](screenshots/1WR.png)



\### 5WR — Five Write Transactions



!\[5WR Test](screenshots/5WR.png)



\### 1WR\_1RD — One Write and One Read



!\[1WR\\\_1RD Test](screenshots/1WR\_1RD.png)



\### 5WR\_5RD — Five Writes and Five Reads



!\[5WR\\\_5RD Test](screenshots/5WR\_5RD.png)



\### NWR\_NRD — Multiple Write and Read Transactions



!\[NWR\\\_NRD Test](screenshots/NWR\_NRD.png)



\## Project Structure



```text

Parameterized-Memory-UVM-Verification/

│

├── memory.v              # Parameterized memory RTL

│

├── mem\_tx.sv             # Memory transaction

├── mem\_bfm.sv            # Bus functional model / interface driver

├── mem\_intrf.sv          # Memory interface

│

├── mem\_sqr.sv            # UVM sequencer

├── mem\_agent.sv          # UVM agent

├── mem\_mon.sv            # UVM monitor

├── mem\_env.sv            # UVM environment

├── mem\_sbd.sv            # Self-checking scoreboard

├── mem\_cov.sv            # Functional coverage

├── mem\_common.sv         # Common definitions

│

├── seq\_lib.sv            # Sequence library

├── test\_lib.sv           # Test library

├── mem\_tb.sv             # Top-level testbench

├── list.svh              # File list

├── run.do                # QuestaSim simulation script

│

├── screenshots/          # Simulation and coverage screenshots

│   ├── functional\_coverage.png

│   ├── code\_coverage.png

│   ├── 1WR.png

│   ├── 5WR.png

│   ├── 1WR\_1RD.png

│   ├── 5WR\_5RD.png

│   └── NWR\_NRD.png

│

├── .gitignore            # Excludes generated simulation files

└── README.md             # Project documentation

```



\## How to Run the Simulation



The project can be simulated using QuestaSim with the provided `run.do` script.



\### Steps



1\. Open \*\*QuestaSim\*\*.

2\. Navigate to the project directory.

3\. Compile the RTL and SystemVerilog/UVM files using the provided file list.

4\. Execute the simulation script:



```tcl

do run.do

```



5\. Select and run the required test case.

6\. Observe the simulation output and waveform results in QuestaSim.

7\. Review the scoreboard results and coverage reports after simulation.



The `run.do` script is included in the repository to simplify the simulation and verification flow.



\## Coverage Results



The verification environment achieved high coverage across the implemented memory verification scenarios.



\### Coverage Summary



| Coverage Type           |   Result |

| ----------------------- | -------: |

| \*\*Functional Coverage\*\* | \*\*95%+\*\* |

| \*\*Code Coverage\*\*       | \*\*95%+\*\* |



The coverage reports were generated during QuestaSim simulation and analyzed to evaluate verification completeness.



The corresponding coverage screenshots are available in the \[`screenshots`](screenshots/) directory.



\## Future Improvements



The following enhancements can be considered for future development of the project:



\* Extend the verification environment with additional constrained-random scenarios.

\* Improve functional coverage by adding more coverage points and cross coverage.

\* Add more SystemVerilog Assertions for protocol and functional checks.

\* Extend verification to additional memory configurations using different depth and data-width parameters.

\* Enhance the test suite with additional corner-case and boundary-condition scenarios.

\* Further improve UVM-based reusable verification components.



\## Author



\*\*Sai Teja\*\*



This project was developed as part of hands-on learning and practice in RTL Design and Design Verification using Verilog, SystemVerilog, and UVM.











