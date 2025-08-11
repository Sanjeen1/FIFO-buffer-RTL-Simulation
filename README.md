# FIFO-buffer-RTL-Simulation
This repository contains the Register Transfer Level (RTL) design and simulation of a FIFO (First-In First-Out) buffer implemented in Verilog. The FIFO acts as a data queue, where the first data written is the first to be read, making it ideal for buffering and streaming applications in digital systems.

**Key Concepts**

If you write data in the order: A → B → C, then you will read it out in the same order: A → B → C.

**Two Main Operations**

---> Write (Push/Enqueue) → Add data into FIFO.

---> Read (Pop/Dequeue) → Remove data from FIFO.

**Flags / Status Signals**

---> Full → FIFO cannot accept more data (memory is full).

---> Empty → FIFO has no data to read.

There are two types of FIFO -

Synchronous FIFO – Read and write operations happen with the same clock.

Asynchronous FIFO – Read and write operations happen with different clocks (used in clock domain crossing).

Where FIFO is Used
Data buffering in communication systems (UART, SPI, Ethernet).

Clock domain crossing between different parts of a chip.

Audio/Video streaming where smooth data flow is needed.

Case - 1

![1](https://github.com/user-attachments/assets/f7ecf309-2b82-4e15-8141-b318a825cd7d)

Data is being written because write enable signal(wr_en) is high or activated but read enable is off or low so data out is having no data. Data is not being read beacuse read enable (rd_en) signal is not activated and emopty flag is 0 or low because there is atleast one data in buffer. If there is even a single data available in buffer then empty flag will be low.

Case - 2

![2](https://github.com/user-attachments/assets/135c6153-35b4-4a92-a1b1-e9830fda260b)

Here write enable is on long enough that all 8 location of fifo is written then full flag will get activated as we can see and still read signal is in off state and we can see we can not read data because read enable signal is low.

Case -3 

![3](https://github.com/user-attachments/assets/9d057697-d925-4476-b437-a3c3120266b5)

Here write enable signal is off so whatever data is coming is not being written in buffer so empty flag is on means buffer is empty and not a singe data is available in buffer and full flag will be obviously be low.

Case -4

![4](https://github.com/user-attachments/assets/ddaa72e8-4d69-42a3-ad9d-5d605ebd9c75)

When read enable signal is on then the data written in buffer is read out as shown in waveform . All the 5 data are read as first in first out manner that's why it   is called fifo and when last data is read this means fifo becomes empty , all data is read then again empty flag goes high that means not a single data is present in fifo . 

Case -5

![5](https://github.com/user-attachments/assets/89015c76-4ddd-440d-aba0-6da362af184d)

Write enable is activated after data "136" and read enable activated after that so only 136 is written in buffer so data to be read by read enable signal is 136 only that time emprty signal will go low because continously data is coming and write enable signal is on also. 







