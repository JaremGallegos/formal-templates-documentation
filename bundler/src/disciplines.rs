pub fn validate_discipline(discipline: &str) -> anyhow::Result<()> {
    match discipline {
        "mathematics" => {}
        "business" => {}
        "general" => {}
        _ => anyhow::bail!("Disciplina Desconocida")
    }

    Ok(())
}