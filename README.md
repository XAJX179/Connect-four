
[![Documentation](https://github.com/XAJX179/Connect-four/actions/workflows/documentation.yml/badge.svg)](https://github.com/XAJX179/Connect-four/actions/workflows/documentation.yml)
[![Ruby Test](https://github.com/XAJX179/Connect-four/actions/workflows/tests.yml/badge.svg)](https://github.com/XAJX179/Connect-four/actions/workflows/tests.yml)

# Table of contents

<!--toc:start-->

- [Table of contents](#table-of-contents)
  - [🫣 Peek](#-peek)
  - [Connect Four](#connect-four)
  - [Documentation](#documentation)
  - [📦 Structure](#-structure)

<!--toc:end-->

## 🫣 Peek

![peek](https://raw.githubusercontent.com/XAJX179/Connect-four/refs/heads/main/connect-4-peek.png)

![peek gif](https://raw.githubusercontent.com/XAJX179/Connect-four/refs/heads/main/connect-4-peek.gif)

## Connect Four

On a 6x7 grid, 2 players take turns and drops colored tokens,
the tokens fall straight down, taking the lowest available space
within column. The objective of the game is to be the first to
form a horizontal, vertical, or diagonal line of four of one's own tokens.

## Documentation

[Documentation](https://xajx179.github.io/Connect-four/)
  made for learning github actions to build and deploy docs automatically ,
  so not actual full documentation of code.

## 📦 Structure

```plaintext
.
├── lib
│   ├── connect_four
│   │   ├── board.rb
│   │   ├── data_structure
│   │   │   ├── linked_list.rb
│   │   │   └── node.rb
│   │   ├── display.rb
│   │   ├── game.rb
│   │   └── player.rb
│   └── connect_four.rb
├── main.rb // just a file to run my game
├── README.md
└── spec //tests
    ├── connect_four
    │   ├── board_spec.rb
    │   ├── game_spec.rb
    │   └── player_spec.rb
    ├── connect_four_spec.rb
    └── spec_helper.rb
├── Gemfile
├── Gemfile.lock
```
