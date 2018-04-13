all: receive_implicit receive_explicit transmit_implicit transmit_explicit

LoRa.o: LoRa.c
	gcc -c LoRa.c -o LoRa.o -lpigpio -lrt -pthread -lm

tx_implicit_example.o: tx_implicit_example.c
	gcc -c tx_implicit_example.c -o tx_implicit_example.o -lpigpio -lrt -pthread -lm

rx_implicit_example.o: rx_implicit_example.c
	gcc -c rx_implicit_example.c -o rx_implicit_example.o -lpigpio -lrt -pthread -lm

tx_explicit_example.o: tx_explicit_example.c
	gcc -c tx_explicit_example.c -o tx_explicit_example.o -lpigpio -lrt -pthread -lm

rx_explicit_example.o: rx_explicit_example.c
	gcc -c rx_explicit_example.c -o rx_explicit_example.o -lpigpio -lrt -pthread -lm

transmit_explicit: LoRa.o tx_explicit_example.o
	gcc -o transmit_explicit tx_explicit_example.o LoRa.o -lpigpio -lrt -pthread -lm

transmit_implicit: LoRa.o tx_implicit_example.o
	gcc -o transmit_implicit tx_implicit_example.o LoRa.o -lpigpio -lrt -pthread -lm

receive_explicit: LoRa.o rx_explicit_example.o
	gcc -o receive_explicit rx_explicit_example.o LoRa.o -lpigpio -lrt -pthread -lm

receive_implicit: LoRa.o rx_implicit_example.o
	gcc -o receive_implicit rx_implicit_example.o LoRa.o -lpigpio -lrt -pthread -lm