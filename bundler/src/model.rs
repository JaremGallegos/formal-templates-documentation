use serde::Serialize;
use typst_syntax::package::{PackageInfo, TemplateInfo};

#[derive(Debug, Clone, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct IndexPackageInfo {
    #[serde(flatten)]
    pub package: PackageInfo,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub template: Option<TemplateInfo>,
    pub updated_at: u64,
}

impl From<&FullIndexPackageInfo> for IndexPackageInfo {
    fn from(info: &FullIndexPackageInfo) -> Self {
        IndexPackageInfo {
            package: info.package.clone(),
            template: info.template.clone(),
            updated_at: info.updated_at,
        }
    }
}

#[derive(Debug, Clone, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct FullIndexPackageInfo {
    #[serde(flatten)]
    pub package: PackageInfo,
    #[serde(skip_serializing_if = "Option::is_none")] 
    pub template: Option<TemplateInfo>,
    pub size: usize,
    pub readme: String,
    pub updated_at: u64,
    pub released_at: u64,
}