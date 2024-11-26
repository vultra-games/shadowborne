#include <SFML/Graphics.hpp>

int main() {
    sf::RenderWindow window(sf::VideoMode(800, 600), "SFML Vertical Oval");

    sf::CircleShape oval(80);  
    oval.setFillColor(sf::Color::Green);
    oval.setScale(1.1f, 2.0f);  
    oval.setPosition(360, 220);  

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear(sf::Color::Black);

        window.draw(oval);

        window.display();
    }

    return 0;
}

