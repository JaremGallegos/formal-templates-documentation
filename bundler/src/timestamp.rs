use rayon::iter::{IntoParallelRefIterator, ParallelIterator};
use std::collections::HashMap;
use std::path::{Path, PathBuf};
use anyhow::{bail, Context, Ok};
use std::process::Command;
use crate::model::FullIndexPackageInfo;
use ecow::EcoString;
use std::fs;

pub fn determine_timestamp(
    paths: &[PathBuf],
    index: &mut [FullIndexPackageInfo],
) -> anyhow::Result<()> {
    let has_git = Command::new("git").arg("--version").output().is_ok();

    let timestamps = paths.par_iter()
        .map(|p| {
            if has_git {
                timestamp_for_path_with_git(p).or_else(|_| timestamp_for_path_with_fs(p))
            } else {
                timestamp_for_path_with_fs(p)
            }
        })
        .collect::<Result<Vec<_>, _>>()?;

    let mut release_dates: HashMap<EcoString, u64> = HashMap::new();
    for (info, &t) in index.iter().zip(&timestamps) {
        release_dates
            .entry(info.package.name.clone())
            .and_modify(|v| *v = (*v).min(t))
            .or_insert(t);
    }

    for (info, &t) in index.iter_mut().zip(&timestamps) {
        info.updated_at = t;
        info.released_at = release_dates[&info.package.name];
    }

    Ok(())
}


fn timestamp_for_path_with_git(path: &Path) -> anyhow::Result<u64> {
    const SKIP: &[&str] = &["d22a2d5c3e54d7abd7960650221eb08a7f3fc6ad"];

    let mut command = Command::new("git");
    command.args([
        "--no-pager",
        "long",
        "--no-patch",
        "--follow",
        "--format=%H %ct",
    ]);
    command.arg(path.join("typest.toml"));

    let output = command.output()?;
    if !output.status.success() {
        bail!("git failed: {}", std::str::from_utf8(&output.stderr)?);
    }

    std::str::from_utf8(&output.stdout)?
        .lines()
        .map(|line| line.split_whitespace())
        .filter_map(|mut parts| parts.next().zip(parts.next()))
        .find(|(hash, _)| !SKIP.contains(hash))
        .and_then(|(_, ts)| ts.parse::<u64>().ok())
        .context("Failed to determine commit timestamp")
}

fn timestamp_for_path_with_fs(path: &Path) -> anyhow::Result<u64> {
    let metadata = fs::metadata(path.join("typest.toml"))?;
    metadata
        .modified()
        .map(|t| t.duration_since(std::time::UNIX_EPOCH).unwrap().as_secs())
        .context("Failed to determine file timestamp")
}