package main

import "fmt"

type Survivor struct {
	Name   string
	Hunger int
	Alive  bool
}

type SurvivalGame struct {
	Survivors []Survivor
	Food      int
}

func (g *SurvivalGame) AddSurvivor(name string) {
	g.Survivors = append(g.Survivors, Survivor{Name: name, Hunger: 0, Alive: true})
}

func (g *SurvivalGame) SimulateDay() {
	for i := range g.Survivors {
		if g.Survivors[i].Alive {
			g.Survivors[i].Hunger++
			if g.Food > 0 {
				g.Food--
				g.Survivors[i].Hunger--
			}
			if g.Survivors[i].Hunger > 3 {
				g.Survivors[i].Alive = false
			}
		}
	}
}

func (g *SurvivalGame) PrintStatus() {
	fmt.Printf("Food: %d\n", g.Food)
	for _, s := range g.Survivors {
		fmt.Printf("%s - Hunger: %d Alive: %v\n", s.Name, s.Hunger, s.Alive)
	}
}

func main() {
	game := SurvivalGame{Food: 10}
	game.AddSurvivor("Sam")
	game.AddSurvivor("Alex")
	for i := 0; i < 5; i++ {
		fmt.Printf("Day %d\n", i+1)
		game.SimulateDay()
		game.PrintStatus()
	}
	fmt.Println("Survival Strategy Game Ended.")
}