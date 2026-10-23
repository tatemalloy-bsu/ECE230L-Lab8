# Multiplexers and Demultiplexers

In this lab you have learned about multiplexers and demultiplexers.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names

Tate Malloy, Hayden Nguyen, Peter Kjaer

## Summary

In this lab, we designed and used a 4-input multiplexer and a 4-output demultiplexer. They each handle 4 input buses and have select bits from 0-3 and an enable bit. Depending on the select bit in the multiplexer, it will route one of the 4 inputs to its output. The demultiplexer does the opposite of routing 1 input into 1 of 4 outputs. We used 16 switches on our Basys3 board to create 4 different input buses and buttons on the board to decide if the mux & demux are enabled and what inputs/outputs are selected on them.

## Lab Questions

### In plain English describe the function and use of a multiplexer.

A multiplexer is a circuit that take multiple input and selects one to send to the output. It uses select lines to decide which input is chosen. It useful because it lets you control which data gets sent through one input.

### In plain English describe the function and use of a demultiplexer.
A demultiplexer takes in data and selection bits, and outputs that data to the selected output bit. Demultiplexers are used to send data to different locations based on certain reasons.

### What other uses might these circuits have? (Think Shannon’s)
One use is the ability to create any function using multi and demultiplexers, since Shannon's expansion gives the basis for this to be possible.
