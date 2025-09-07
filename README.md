# SPOON
SPOON is a fantasy console, that could theoretically be made with logic or something similar. It is similar to PICO-8

# Design
The SPOON architecture is built around actual variables, and variable names. They are encoded into the instructions, which does make the instructions take up significantly more space, since they hold strings.

## Memory
There is no traditional numerical addressed memory, everything is "addressed" by its variable name. This would be hard to implement it hardware, but theoretically possible. In a programming language this is easy with something like a hashmap. The names of every variable are stored without a terminating NULL character, even though there is no problem with storing it. They instead have a 1 byte size before it, this is in instructions and in memory. Each variable is strongly typed, with the first byte of its data storing its type, this would make it easy to hack in other types, and maybe even have features in a style similar to ARM. Here is an example of a integer variable.  
| Position | Length | Description   |
| :------- | :----: | ------------: |
| 0x00     | 1      | Name size(n)  |
| 0x01     | n      | Name          |
| n+0x02   | 4      | Integer value |

## Instruction Set
