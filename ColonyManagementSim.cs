using System;
using System.Collections.Generic;

class Colonist {
    public string Name;
    public int Hunger;
    public Colonist(string name) { Name = name; Hunger = 0; }
    public void Eat() { Hunger = Math.Max(0, Hunger - 2); }
    public void Work() { Hunger += 1; }
}

class Colony {
    List<Colonist> colonists = new List<Colonist>();
    int foodSupply = 10;

    public void AddColonist(string name) {
        colonists.Add(new Colonist(name));
    }

    public void SimulateDay() {
        foreach (var c in colonists) {
            c.Work();
            if (foodSupply > 0) {
                c.Eat();
                foodSupply--;
            }
        }
    }

    public void PrintStatus() {
        Console.WriteLine("Food supply: " + foodSupply);
        foreach (var c in colonists)
            Console.WriteLine($"{c.Name} Hunger: {c.Hunger}");
    }
}

class Program {
    static void Main() {
        Colony colony = new Colony();
        colony.AddColonist("Eve");
        colony.AddColonist("Rob");
        for (int i = 0; i < 5; i++) {
            Console.WriteLine($"Day {i+1}");
            colony.SimulateDay();
            colony.PrintStatus();
        }
        Console.WriteLine("Colony Simulation End.");
    }
}