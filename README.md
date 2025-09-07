# SPOON
SPOON is a 64 bit fantasy console, that could theoretically be made with logic or something similar. It is similar to PICO-8

# Design
The SPOON architecture is built around actual variables, and variable names. They are encoded into the instructions, which does make the instructions take up significantly more space, since they hold strings.

## Memory
There is no traditional numerical addressed memory (execpt for program memory), everything is "addressed" by its variable name. This would be hard to implement it hardware, but theoretically possible. In a programming language this is easy with something like a hashmap. The names of every variable are stored without a terminating NULL character, even though there is no problem with storing it. They instead have a 1 byte size before it, this is in instructions and in memory. Each variable is strongly typed, with the first byte of its data storing its type, this would make it easy to hack in other types, and maybe even have features in a style similar to ARM. Here is an example of a integer variable.  
| Position | Length | Description    |
| :------- | :----: | -------------: |
| 0x00     | 1      | Name length(n) |
| 0x01     | n      | Name           |
| n+0x02   | 4      | Integer value  |
### Types
These are universial types, they are always supported. There may be support for program defined data types, but that is only planned
- Reserved 0x00  
Should never be used.
- Int 0x01  
| Position | Length | Description    |
| :------- | :----: | -------------: |
| 0x00     | 1      | Name lenght(n) |
| 0x01     | n      | Name           |
| n+0x02   | 4      | Integer value  |
- Float 0x02  
| Position | Length | Description    |
| :------- | :----: | -------------: |
| 0x00     | 1      | Name length(n) |
| 0x01     | n      | Name           |
| n+0x02   | 4      | Float value    |
- String 0x03  
| Position | Length | Description      |
| :------- | :----: | ---------------: |
| 0x00     | 1      | Name length(n)   |
| 0x01     | n      | Name             |
| n+0x02   | 2      | String length(i) |
| n+0x04   | i      | String contents  |
- List 0x04  
| Position | Length | Description    |
| :------- | :----: | -------------: |
| 0x00     | 1      | Name length(n) |
| 0x01     | n      | Name           |
| n+0x02   | 2      | Data length(d) |
| n+0x04   | d      | Data(nameless variables) |
- Array 0x05  
| Position | Length | Description    |
| :------- | :----: | -------------: |
| 0x00     | 1      | Name length(n) |
| 0x01     | n      | Name           |
| n+0x02   | 1      | Type           |
| n+0x02   | 2      | Data length(d) |
| n+0x04   | d      | Data(nameless and typeless variables) |
### Program Memory
Program memory(PM) is the memory space where the instructions are stored. the addresses are by default 32 bits long. It is not directly readable/writable by the program.
### Stack
There is a stack for subroutine calls, but it wont be accessable directly by the program. It can only be changed by calling/returning from a subroutine

## Instruction Set
The instruction set will is kept mostly simple. It wont adhere completely to either a RISC or CISC architecture, but it will remain close to a RISC type architecture. If an instruction refers to a variable that does not exist, it will be created.
### Instruction List
(currently just planned)
- mv
```
mv DEST_VAR SRC_VAR
```
MoVe data and type data from `DEST_VAR` to `SOURCE_VAR`
- stX
```
stX DEST_VAR DATA
```
STore X, where X is a data type initial. It sets the type of the variable to the specified type, and sets the data to the supplied data.
- add, sub, mul, div
```
add/sub/mul/div A_VAR B_VAR DEST_VAR
```
ADDs/SUBtracts/MULtiplies/DIVides `A_VAR` and `B_VAR` and stores the result in `B_VAR`, can only operate on ints and floats. The result will be in float unless two integers are operated on.
- con
```
con DEST_STR SRC_STR
```
CONcats `SRC_STR` onto the end of `DEST_STR` and stores it in `DEST_STR`

## Extensions
I plan on maybe adding some sort of extension functionality similar to ARM. But it may end up being redunant.
