# PeC-Jogos-Projeto-1  
This is our repository for our Digital Games Course.

## The game

The game we are developing is called **Souls of Alanis**, in this README you will find some information about it.  

The [Storyboard](StoryBoard.md) has most of the games aspects and features that we propose to implement.  

The [Hero's Journey](The_Monomyth.md) has some quick notes about the story structure we followed for the game's Lore.  

Some of our tests and tech demos can be found on the [projects](projects/) folder.  

Through the rest of the file we have some weekly-updated information about the current state of the project.  

## Class notes

Some of the notes and activities done in each class of the curse.

- Class 1:
	- Introduction
	- **Activities**
		- [X] Organize groups
		- [X] Create Github repository
- Class 2:
	- Tech demo
	- **Activities**
		- [X] Choose tools
			- Godot Engine
			- Aseprite
			- Gimp
		- [X] Make a simple "Hello World" project
		- [X] Export to run on another machine
		- [X] Start [storyboard](#story-board-notes)
			- Something about the game
			- Something about one stage of the game
			- Some characters of the game
			- Some of the items of the game
- Class 3:
	- Work on the project
	- **Activities**
		- [X] Present a tech demo
		- [X] Play some music
		- [X] Have a Menu
		- [X] More details for story board
- Class 4:
	- Work on the project
	- **Activities**
		- [X] Tech demo for combat mechanics (Jonathas and Felipe)
		- [X] Tech demo for random map generation (Lucas and Juan)
- Class 6:
	- Work on the storyboard
- Class 7:
	- Storyboard and game presentation

## Topics from talks

Topics discussed in ~some of~ our meetings.

### 13.04.18 - Face-to-face
- some aspects for the __story board__:
- initially we should focus on what we can do, so then we create the lore based on that  
- then the lore will be used to create the game itself  
- aspects of the __game__
- we should have a room of tropheus, where there are _paints_ with images of others games that the group made  
- the initial screen shows how deep is the game save  
- and some aspects about the __player__  
- the facts that she is a warrior facilitate the sketching  
- she can still have some feline aspects  

### 20.04.18 - Face-to-face
- Combat tech demo with collision response is ready  
- Finish a proper tech demo for map generation  
- Maybe merge the two tech demos  
- Make some basic notes for the __story board__  
	- Use the hero's journey  
- Find a good model for the __story board__  

### 27.04.18 - Spiritual
- A dark day.

### 08.05.18 - Online
- Notes to make for next Friday's meeting
	- RPG model
	- Combat model
	- Attributes
	- Equipment's values
	- Metrics
	- Foes
	- Main character
- Class diagram
- Rooms examples
	- Foes
	- NPCs
	- Mini bosses
### 11.05.18 - ~not supposed to be, but it was~ Online (This will be translated and organized later)
Notas fixas:

Mapa:  
O mapa do jogo é dividido entre salas, salas tem diferentes tipos e tamanhos e o mapa é gerado aleatoriamente no início da partida.  
Salas são cenas, cada cena tem um tamanho e seu conteúdo, que podem ser estáticos ou dinâmicos.  
Conteúdo estático é fixo, nunca munda.  
Conteúdo dinâmico é gerado quando a partida (playthrough) começa, e se houverem duas salas iguais geradas eles podem variar de uma para outra.  
Os conteúdos são:  
- Estáticos:
	- Chão
	- Paredes
	- Posição das passagens
	- Posição dos objetos de cenário
	- Posição das criaturas
- Dinâmicos:
	- Quais criaturas estão em cada posição
	- Quais itens estão em cada posição
	- Quais entradas/saídas estão 'abertas' e quais salas levam.

Combate e Modelo RPG:  
- Única ação de ataque.
- Atributos
	- Vitalidade
	- Agilidade
	- Força
	- Sabedoria
- Poder Base
	- HP
	- Estamina
	- Capacidade de carga
	- Tipos de Ataque e Defesa
		- Corte
		- Impacto
		- Perfuração
	 - Ganho de XP
- Equipamentos alteram o 'Poder' diretamente, e não os atributos
- Criaturas podem ter equipamentos que vem aleatoriamente
- Armas
	- Espada: Dano médio, custo (de estamina) médio, velocidade média.
	- Machado: Dano alto, costumo alto, velocidade baixa.
	- Lança: Dano baixo, costumo baixo, velocidade alta.
	- Perks especializam os pontos positivos de cada arma.
	- Ataque = dano base da arma + bonus calculado com atributo do personagem.
	- Defesa = defesa base da armadura + bonus calculado com atributo do personagem
	- Dano = defesa - ataque
	- Armas tem dano base e peso.
- Armaduras
	- Tem peso e bônus de defesa
- Anéis
	- Tem bônus de 'poderes base'
- Alanis
	- 1 ponto de atributo por lvl
	- 1 ponto de perk     por lvl

Coisas que ainda falta ser decididas:
	- Métricas
	- Quantidades de criaturas por sala

## Activities schedule

Dynamic activities schedule

- Legend
	- Jonathas "Thatox" Conceicao - T
	- Juan "Asaki" Rios - A
	- Lucas Bretana - B
	- Felipe "OneEyedAesir" Gruendemann -  O

- 07/05 - 14/05
	- [ ] Decide RPG model
	- [ ] Decide random rooms disposition
	- [ ] Decide mobs and items and quantity
	- [ ] Decide upgrade system (Main character and foes)
	- [ ] Decide items bonus

- 07/05 - 28/05
	- [ ] Main character development => T
	- [ ] Ordinary creatures => O
		- [ ] Garden
		- [ ] Castle
		- [ ] Crypt
	- [ ] Weapons => T
		- [ ] Sword
		- [ ] Spear
		- [ ] Axe
	- [ ] Map generation => A
	- [ ] Rooms => A & B
		- [ ] Screen sized room
		- [ ] Long room
	- [ ] Rooms type => A & B
		- [ ] Basic room
		- [ ] Initial room
		- [ ] Loot room
		- [ ] Hallway room
	- [ ] Main Menu & Esc Menu => B
	- [ ] HUD => A
	- [ ] Alpha 0.1 - 28/05
