pub fn validate_category(category: &str) -> anyhow::Result<()> {
    match category {
        "office" => {}
        "book" => {}
        "report" => {}
        _ => anyhow::bail!("Categoria Desconocida")
    }

    Ok(())
}