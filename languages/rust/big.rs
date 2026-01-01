//! A larger Rust file for chunking and structure detection.

use std::collections::BTreeMap;

/// Figure number 0.
#[derive(Debug, Clone, Default)]
pub struct Figure0 {
    pub id: u32,
    pub label: String,
}

impl Figure0 {
    pub fn new(label: &str) -> Self {
        Self { id: 0, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 1.0 * self.id as f64
    }
}

/// Figure number 1.
#[derive(Debug, Clone, Default)]
pub struct Figure1 {
    pub id: u32,
    pub label: String,
}

impl Figure1 {
    pub fn new(label: &str) -> Self {
        Self { id: 1, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 2.0 * self.id as f64
    }
}

/// Figure number 2.
#[derive(Debug, Clone, Default)]
pub struct Figure2 {
    pub id: u32,
    pub label: String,
}

impl Figure2 {
    pub fn new(label: &str) -> Self {
        Self { id: 2, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 3.0 * self.id as f64
    }
}

/// Figure number 3.
#[derive(Debug, Clone, Default)]
pub struct Figure3 {
    pub id: u32,
    pub label: String,
}

impl Figure3 {
    pub fn new(label: &str) -> Self {
        Self { id: 3, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 4.0 * self.id as f64
    }
}

/// Figure number 4.
#[derive(Debug, Clone, Default)]
pub struct Figure4 {
    pub id: u32,
    pub label: String,
}

impl Figure4 {
    pub fn new(label: &str) -> Self {
        Self { id: 4, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 5.0 * self.id as f64
    }
}

/// Figure number 5.
#[derive(Debug, Clone, Default)]
pub struct Figure5 {
    pub id: u32,
    pub label: String,
}

impl Figure5 {
    pub fn new(label: &str) -> Self {
        Self { id: 5, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 6.0 * self.id as f64
    }
}

/// Figure number 6.
#[derive(Debug, Clone, Default)]
pub struct Figure6 {
    pub id: u32,
    pub label: String,
}

impl Figure6 {
    pub fn new(label: &str) -> Self {
        Self { id: 6, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 7.0 * self.id as f64
    }
}

/// Figure number 7.
#[derive(Debug, Clone, Default)]
pub struct Figure7 {
    pub id: u32,
    pub label: String,
}

impl Figure7 {
    pub fn new(label: &str) -> Self {
        Self { id: 7, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 8.0 * self.id as f64
    }
}

/// Figure number 8.
#[derive(Debug, Clone, Default)]
pub struct Figure8 {
    pub id: u32,
    pub label: String,
}

impl Figure8 {
    pub fn new(label: &str) -> Self {
        Self { id: 8, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 9.0 * self.id as f64
    }
}

/// Figure number 9.
#[derive(Debug, Clone, Default)]
pub struct Figure9 {
    pub id: u32,
    pub label: String,
}

impl Figure9 {
    pub fn new(label: &str) -> Self {
        Self { id: 9, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 10.0 * self.id as f64
    }
}

/// Figure number 10.
#[derive(Debug, Clone, Default)]
pub struct Figure10 {
    pub id: u32,
    pub label: String,
}

impl Figure10 {
    pub fn new(label: &str) -> Self {
        Self { id: 10, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 11.0 * self.id as f64
    }
}

/// Figure number 11.
#[derive(Debug, Clone, Default)]
pub struct Figure11 {
    pub id: u32,
    pub label: String,
}

impl Figure11 {
    pub fn new(label: &str) -> Self {
        Self { id: 11, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 12.0 * self.id as f64
    }
}

/// Figure number 12.
#[derive(Debug, Clone, Default)]
pub struct Figure12 {
    pub id: u32,
    pub label: String,
}

impl Figure12 {
    pub fn new(label: &str) -> Self {
        Self { id: 12, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 13.0 * self.id as f64
    }
}

/// Figure number 13.
#[derive(Debug, Clone, Default)]
pub struct Figure13 {
    pub id: u32,
    pub label: String,
}

impl Figure13 {
    pub fn new(label: &str) -> Self {
        Self { id: 13, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 14.0 * self.id as f64
    }
}

/// Figure number 14.
#[derive(Debug, Clone, Default)]
pub struct Figure14 {
    pub id: u32,
    pub label: String,
}

impl Figure14 {
    pub fn new(label: &str) -> Self {
        Self { id: 14, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 15.0 * self.id as f64
    }
}

/// Figure number 15.
#[derive(Debug, Clone, Default)]
pub struct Figure15 {
    pub id: u32,
    pub label: String,
}

impl Figure15 {
    pub fn new(label: &str) -> Self {
        Self { id: 15, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 16.0 * self.id as f64
    }
}

/// Figure number 16.
#[derive(Debug, Clone, Default)]
pub struct Figure16 {
    pub id: u32,
    pub label: String,
}

impl Figure16 {
    pub fn new(label: &str) -> Self {
        Self { id: 16, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 17.0 * self.id as f64
    }
}

/// Figure number 17.
#[derive(Debug, Clone, Default)]
pub struct Figure17 {
    pub id: u32,
    pub label: String,
}

impl Figure17 {
    pub fn new(label: &str) -> Self {
        Self { id: 17, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 18.0 * self.id as f64
    }
}

/// Figure number 18.
#[derive(Debug, Clone, Default)]
pub struct Figure18 {
    pub id: u32,
    pub label: String,
}

impl Figure18 {
    pub fn new(label: &str) -> Self {
        Self { id: 18, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 19.0 * self.id as f64
    }
}

/// Figure number 19.
#[derive(Debug, Clone, Default)]
pub struct Figure19 {
    pub id: u32,
    pub label: String,
}

impl Figure19 {
    pub fn new(label: &str) -> Self {
        Self { id: 19, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 20.0 * self.id as f64
    }
}

/// Figure number 20.
#[derive(Debug, Clone, Default)]
pub struct Figure20 {
    pub id: u32,
    pub label: String,
}

impl Figure20 {
    pub fn new(label: &str) -> Self {
        Self { id: 20, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 21.0 * self.id as f64
    }
}

/// Figure number 21.
#[derive(Debug, Clone, Default)]
pub struct Figure21 {
    pub id: u32,
    pub label: String,
}

impl Figure21 {
    pub fn new(label: &str) -> Self {
        Self { id: 21, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 22.0 * self.id as f64
    }
}

/// Figure number 22.
#[derive(Debug, Clone, Default)]
pub struct Figure22 {
    pub id: u32,
    pub label: String,
}

impl Figure22 {
    pub fn new(label: &str) -> Self {
        Self { id: 22, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 23.0 * self.id as f64
    }
}

/// Figure number 23.
#[derive(Debug, Clone, Default)]
pub struct Figure23 {
    pub id: u32,
    pub label: String,
}

impl Figure23 {
    pub fn new(label: &str) -> Self {
        Self { id: 23, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 24.0 * self.id as f64
    }
}

pub fn registry() -> BTreeMap<u32, String> {
    let mut m = BTreeMap::new();
    m.insert(0, Figure0::new("shape-0").label);
    m.insert(1, Figure1::new("shape-1").label);
    m.insert(2, Figure2::new("shape-2").label);
    m.insert(3, Figure3::new("shape-3").label);
    m.insert(4, Figure4::new("shape-4").label);
    m.insert(5, Figure5::new("shape-5").label);
    m.insert(6, Figure6::new("shape-6").label);
    m.insert(7, Figure7::new("shape-7").label);
    m.insert(8, Figure8::new("shape-8").label);
    m.insert(9, Figure9::new("shape-9").label);
    m.insert(10, Figure10::new("shape-10").label);
    m.insert(11, Figure11::new("shape-11").label);
    m.insert(12, Figure12::new("shape-12").label);
    m.insert(13, Figure13::new("shape-13").label);
    m.insert(14, Figure14::new("shape-14").label);
    m.insert(15, Figure15::new("shape-15").label);
    m.insert(16, Figure16::new("shape-16").label);
    m.insert(17, Figure17::new("shape-17").label);
    m.insert(18, Figure18::new("shape-18").label);
    m.insert(19, Figure19::new("shape-19").label);
    m.insert(20, Figure20::new("shape-20").label);
    m.insert(21, Figure21::new("shape-21").label);
    m.insert(22, Figure22::new("shape-22").label);
    m.insert(23, Figure23::new("shape-23").label);
    m
}
