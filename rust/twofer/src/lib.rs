pub fn twofer(name: &str) -> String {
    let x = if name.is_empty() { "you" } else { name };
    format!("One for {}, one for me.", x)
}
