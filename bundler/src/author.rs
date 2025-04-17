use anyhow::{bail, Context};
use email_address::EmailAddress;
use unscanny::Scanner;

/// Validacion del formato de un autor. Este puede contener el nombre y los scopes, ademas de una
/// URL, correo o Github.
pub fn validate_author(name: &str) -> anyhow::Result<()> {
    let mut s = Scanner::new(name);
    s.eat_until(|c| c == '<');
    
    if s.eat_if('<') {
        let contact = s.eat_until('>');

        if let Some(handle) = contact.strip_prefix('@') {
            validate_github_handle(handle).context("Accion de Github es invalido")?;
        } else if contact.starts_with("http") {
            validate_url(contact).context("URL Invalida")?;
        } else {
            let _addr: EmailAddress = contact.parse().context("El correo es invalido")?;
        }

        if !s.eat_if('>') {
            bail!("expected '>'");
        }
    }

    Ok(())
}

fn validate_github_handle(handle: &str) -> anyhow::Result<()> {
    if handle.len() > 39 {
        bail!("El nombre de usuario de github solo puede tener 39 caracteres");
    }
    if !handle.chars().all(|c| c.is_ascii_alphanumeric() || c == '-') {
        bail!("Debe contener caracteres alfanumericos y con un caracter '-'");
    }
    if handle.starts_with('-') || handle.ends_with('-') {
        bail!("No debe comenzar ni terminar con un guion");
    }

    Ok(())
}

fn validate_url(url: &str) -> anyhow::Result<()> {
    if !url.chars().all(is_legal_in_url) {
        bail!("La URL contiene caracter")
    }

    Ok(())
}

fn is_legal_in_url(c: char) -> bool {
    c.is_ascii_alphanumeric() || "-_.~:/?#[]@!$&'()*+,;=".contains(c)
}

#[cfg(test)]
mod tests {
    use super::validate_author;

    #[test]
    fn perse_author_name() {
        validate_author("Marco").unwrap();
        validate_author("Marco <@mark>").unwrap();
        validate_author("Marco <https://mark.ug>").unwrap();
        validate_author("Marco <marco.haug@typst.app>").unwrap();

        // Verificacion de nombres de usuario incorrectos de Github
        assert!(validate_author("Marco <@mark->").is_err());
        assert!(validate_author("Marco <@-mark>").is_err());
        assert!(validate_author("Marco <@märk>").is_err());
        assert!(validate_author("Marco <@mark").is_err());

        // Verificacion de correos de usuario incorrectos de Github
        assert!(validate_author("Marco <>").is_err());
        assert!(validate_author("Marco <mark>").is_err());
        assert!(validate_author("Marco <m@.de>").is_err());
        assert!(validate_author("Marco <m@hello.>").is_err());
        assert!(validate_author("Marco <  >").is_err());
        assert!(validate_author("Marco <mark@typst.app").is_err());

        // Validaciones para verificar URLs erroneas
        assert!(validate_author("Marco <http://mark ug>").is_err());
        assert!(validate_author("Marco <http://märk.ug>").is_err());
        assert!(validate_author("Marco <http://mark.ug").is_err());
    }
}