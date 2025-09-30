use std::collections::VecDeque;

struct Message {
    user: String,
    content: String,
}

struct ChatRoom {
    messages: VecDeque<Message>,
}

impl ChatRoom {
    fn new() -> ChatRoom {
        ChatRoom { messages: VecDeque::new() }
    }
    fn send(&mut self, user: &str, text: &str) {
        self.messages.push_back(Message {
            user: user.to_string(),
            content: text.to_string(),
        });
        if self.messages.len() > 10 {
            self.messages.pop_front();
        }
    }
    fn show(&self) {
        for m in &self.messages {
            println!("{}: {}", m.user, m.content);
        }
    }
}

fn main() {
    let mut room = ChatRoom::new();
    room.send("Alice", "Hello!");
    room.send("Bob", "Hi!");
    room.send("Alice", "How are you?");
    room.send("Bob", "Great!");
    for i in 0..7 {
        room.send("Guest", &format!("Message {}", i));
    }
    room.show();
    println!("Web Chat Ended.");
}