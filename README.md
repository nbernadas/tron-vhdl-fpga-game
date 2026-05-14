# Tron 2D FPGA Game

Hardware implementation of a two-player Tron game in VHDL featuring VGA graphics, RS-232 communication and real-time synchronization between FPGA boards.

## Overview

This project implements a multiplayer version of the classic Tron light-cycle game entirely in hardware using VHDL.

Each player runs the game on a separate FPGA board connected through a serial RS-232 link. Both systems continuously exchange movement information and keep the game state synchronized in real time.

The game is displayed through a VGA monitor and controlled using an external keypad.

## Features

- Real-time two-player gameplay
- VGA video output
- RS-232 bidirectional communication
- Collision detection
- Synchronous game engine
- Modular VHDL architecture
- Multi-port memory system
- Keyboard interface
- Game state synchronization between boards

## System Architecture

The design is divided into several hardware modules:

- **Game Engine**
  - Handles game logic, movement updates and collision detection.

- **VGA Interface**
  - Generates the video output and renders the game arena.

- **Memory of Positions**
  - Stores occupied cells and allows simultaneous access from multiple modules.

- **TX/RX Communication Modules**
  - Exchange movement information between FPGA boards through RS-232.

- **Keyboard Interface**
  - Reads user input from an external keypad.

- **Metronome / Timing Module**
  - Controls refresh timing and synchronization windows.

## Communication Protocol

A compact 3-bit protocol is used to transmit player movement information between boards.

| Frame | Meaning |
|---|---|
| 000 | Move right |
| 001 | Move left |
| 010 | Move down |
| 011 | Move up |
| 100 | Start game (`*`) |

The game refreshes at 4 Hz, with synchronization windows designed to minimize desynchronization between players.

## Graphics

The game uses a VGA output at 640x480 resolution.

To simplify rendering and memory usage, the effective game resolution is reduced to a 40x30 grid using virtual pixels of 16x16 real pixels.

## Hardware

- FPGA development board
- VGA monitor
- External keypad
- RS-232 serial connection

## Repository Structure

```text
/src            VHDL source files
/sim            Simulation files
/docs           Project documentation and diagrams
```

## Demo

_Add screenshots or videos here._

## What I Learned

Through this project I gained practical experience with:

- VHDL hardware design
- Finite State Machines (FSMs)
- VGA signal generation
- Serial communication protocols
- Synchronous digital systems
- Memory arbitration
- Hardware/software timing constraints
- Modular FPGA design

## Notes

This project was originally developed as part of a digital systems laboratory project.
