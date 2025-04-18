pub fn validate_category(category: &str) -> anyhow::Result<()> {
    match category {
        "office" => {}
        "book" => {}
        _ => anyhow::bail!("Categoria Desconocida")
    }

    Ok(())
}