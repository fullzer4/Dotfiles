use tui::{
    backend::Backend,
    layout::Alignment,
    style::{Color, Style},
    widgets::{Block, BorderType, Borders, Paragraph},
    Frame,
};

use crate::app::App;

pub fn render<B: Backend>(_app: &mut App, frame: &mut Frame<'_, B>) {
    frame.render_widget(
        Paragraph::new(format!(
            "🚀 Welcome to fullbuilder 🚀\n\
                Press `Esc`, `Ctrl-C` or `q` to stop running.\n\
                "
        ))
        .block(
            Block::default()
                .title(" Fullzer4s Builder ")
                .title_alignment(Alignment::Center)
                .borders(Borders::ALL)
                .border_type(BorderType::Rounded),
        )
        .style(Style::default().fg(Color::Rgb(255, 0, 0)).bg(Color::Reset))
        .alignment(Alignment::Center),
        frame.size(),
    );
}
