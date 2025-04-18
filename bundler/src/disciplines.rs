pub fn validate_discipline(discipline: &str) -> anyhow::Result<()> {
    match discipline {
        "mathematics" => {}
        "business" => {}
        _ => anyhow::bail!("Disciplina Desconocida")
    }

    Ok(())
}