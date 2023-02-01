#!/bin/env bash

life=100

player=100

while true 
do
taxa_de_acerto="$((RANDOM%100+1))" 
taxa_de_acerto_player="$((RANDOM%100+1))"
clear
echo $taxa_de_acerto
echo $taxa_de_acerto_player
echo 'Um monstro aparece a sua frente'
echo "
HP: $life     PLAYER: $player
      _    _ 
     (o)--(o)   
    /.______.\  
    \________/  
   ./        \.
  ( .        , )
   \ \_\\//_ / /
    ~~  ~~  ~~ "
echo "(1)ATK (2)RUN (3)ITENS"
read -p 'insira a escolha: ' ESCOLHA

if [ $ESCOLHA = "2" ];
then
	clear
	echo "Você fugiu"
	exit
fi

if [ $ESCOLHA = "3" ];
then
	clear
		echo "MOCHILA"
		echo "4) Poção"
		echo "5) Corda"
		read -p 'Escolha um item: ' mochila_opcao
		clear
		if [ $mochila_opcao = "4" ];
		then
			player=$(($player + 20))
		fi
	player=$(($player - 15))
fi 


if [ $ESCOLHA = "1" ]; 
then

		if [ $taxa_de_acerto_player > "50" ];
		then
			echo 'Você atingiu o sapo'
			life=$(($life - 10))
			else
				echo 'Você errou o sapo'
		fi

		if [ $taxa_de_acerto > "50" ];
		then
			echo 'Sapo atingiu você'
			player=$(($player - 5))

			else 
				echo 'Sapo errou o ataque'
		fi
		
		if [ $player = "0" ];
		then
			clear
			echo "Você foi de base"
			exit
		elif [ $life = "0" ];
		then
			clear			
			echo "╔═══╗─────────────╔╗───╔╗───╔╗
║╔═╗║────────────╔╝╚╗──║║──╔╝╚╗
║║─╚╬══╦═╗╔══╦═╦═╩╗╔╬╗╔╣║╔═╩╗╔╬╦══╦═╗╔══╗
║║─╔╣╔╗║╔╗╣╔╗║╔╣╔╗║║║║║║║║╔╗║║╠╣╔╗║╔╗╣══╣
║╚═╝║╚╝║║║║╚╝║║║╔╗║╚╣╚╝║╚╣╔╗║╚╣║╚╝║║║╠══║
╚═══╩══╩╝╚╩═╗╠╝╚╝╚╩═╩══╩═╩╝╚╩═╩╩══╩╝╚╩══╝
──────────╔═╝║
──────────╚══╝"
			exit
			
		fi 
		
fi


done
