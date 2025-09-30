#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

class Card {
public:
    std::string suit;
    std::string value;
    Card(std::string v, std::string s) : suit(s), value(v) {}
    void show() { std::cout << value << " of " << suit << "\n"; }
};

class Deck {
    std::vector<Card> cards;
public:
    Deck() {
        std::string suits[] = {"Hearts", "Diamonds", "Clubs", "Spades"};
        std::string values[] = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
        for (auto& s : suits)
            for (auto& v : values)
                cards.push_back(Card(v, s));
    }
    void shuffle() {
        std::srand(unsigned(std::time(0)));
        std::random_shuffle(cards.begin(), cards.end());
    }
    Card draw() {
        Card c = cards.back();
        cards.pop_back();
        return c;
    }
    int size() { return cards.size(); }
};

class Player {
public:
    std::string name;
    std::vector<Card> hand;
    Player(std::string n) : name(n) {}
    void drawFromDeck(Deck& deck) {
        if (deck.size() > 0)
            hand.push_back(deck.draw());
    }
    void showHand() {
        std::cout << name << "'s hand:\n";
        for (auto& c : hand) c.show();
    }
};

int main() {
    Deck deck;
    deck.shuffle();
    Player p1("Alice"), p2("Bob");
    for (int i=0; i<5; ++i) {
        p1.drawFromDeck(deck);
        p2.drawFromDeck(deck);
    }
    p1.showHand();
    p2.showHand();
    std::cout << "Cards left in deck: " << deck.size() << "\n";
    return 0;
}