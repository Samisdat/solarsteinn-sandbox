//! A larger Rust file for chunking and structure detection.

use std::collections::BTreeMap;

/// Shape number 0.
#[derive(Debug, Clone, Default)]
pub struct Shape0 {
    pub id: u32,
    pub label: String,
}

impl Shape0 {
    pub fn new(label: &str) -> Self {
        Self { id: 0, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 1.0 * self.id as f64
    }
}

/// Shape number 1.
#[derive(Debug, Clone, Default)]
pub struct Shape1 {
    pub id: u32,
    pub label: String,
}

impl Shape1 {
    pub fn new(label: &str) -> Self {
        Self { id: 1, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 2.0 * self.id as f64
    }
}

/// Shape number 2.
#[derive(Debug, Clone, Default)]
pub struct Shape2 {
    pub id: u32,
    pub label: String,
}

impl Shape2 {
    pub fn new(label: &str) -> Self {
        Self { id: 2, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 3.0 * self.id as f64
    }
}

/// Shape number 3.
#[derive(Debug, Clone, Default)]
pub struct Shape3 {
    pub id: u32,
    pub label: String,
}

impl Shape3 {
    pub fn new(label: &str) -> Self {
        Self { id: 3, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 4.0 * self.id as f64
    }
}

/// Shape number 4.
#[derive(Debug, Clone, Default)]
pub struct Shape4 {
    pub id: u32,
    pub label: String,
}

impl Shape4 {
    pub fn new(label: &str) -> Self {
        Self { id: 4, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 5.0 * self.id as f64
    }
}

/// Shape number 5.
#[derive(Debug, Clone, Default)]
pub struct Shape5 {
    pub id: u32,
    pub label: String,
}

impl Shape5 {
    pub fn new(label: &str) -> Self {
        Self { id: 5, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 6.0 * self.id as f64
    }
}

/// Shape number 6.
#[derive(Debug, Clone, Default)]
pub struct Shape6 {
    pub id: u32,
    pub label: String,
}

impl Shape6 {
    pub fn new(label: &str) -> Self {
        Self { id: 6, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 7.0 * self.id as f64
    }
}

/// Shape number 7.
#[derive(Debug, Clone, Default)]
pub struct Shape7 {
    pub id: u32,
    pub label: String,
}

impl Shape7 {
    pub fn new(label: &str) -> Self {
        Self { id: 7, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 8.0 * self.id as f64
    }
}

/// Shape number 8.
#[derive(Debug, Clone, Default)]
pub struct Shape8 {
    pub id: u32,
    pub label: String,
}

impl Shape8 {
    pub fn new(label: &str) -> Self {
        Self { id: 8, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 9.0 * self.id as f64
    }
}

/// Shape number 9.
#[derive(Debug, Clone, Default)]
pub struct Shape9 {
    pub id: u32,
    pub label: String,
}

impl Shape9 {
    pub fn new(label: &str) -> Self {
        Self { id: 9, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 10.0 * self.id as f64
    }
}

/// Shape number 10.
#[derive(Debug, Clone, Default)]
pub struct Shape10 {
    pub id: u32,
    pub label: String,
}

impl Shape10 {
    pub fn new(label: &str) -> Self {
        Self { id: 10, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 11.0 * self.id as f64
    }
}

/// Shape number 11.
#[derive(Debug, Clone, Default)]
pub struct Shape11 {
    pub id: u32,
    pub label: String,
}

impl Shape11 {
    pub fn new(label: &str) -> Self {
        Self { id: 11, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 12.0 * self.id as f64
    }
}

/// Shape number 12.
#[derive(Debug, Clone, Default)]
pub struct Shape12 {
    pub id: u32,
    pub label: String,
}

impl Shape12 {
    pub fn new(label: &str) -> Self {
        Self { id: 12, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 13.0 * self.id as f64
    }
}

/// Shape number 13.
#[derive(Debug, Clone, Default)]
pub struct Shape13 {
    pub id: u32,
    pub label: String,
}

impl Shape13 {
    pub fn new(label: &str) -> Self {
        Self { id: 13, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 14.0 * self.id as f64
    }
}

/// Shape number 14.
#[derive(Debug, Clone, Default)]
pub struct Shape14 {
    pub id: u32,
    pub label: String,
}

impl Shape14 {
    pub fn new(label: &str) -> Self {
        Self { id: 14, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 15.0 * self.id as f64
    }
}

/// Shape number 15.
#[derive(Debug, Clone, Default)]
pub struct Shape15 {
    pub id: u32,
    pub label: String,
}

impl Shape15 {
    pub fn new(label: &str) -> Self {
        Self { id: 15, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 16.0 * self.id as f64
    }
}

/// Shape number 16.
#[derive(Debug, Clone, Default)]
pub struct Shape16 {
    pub id: u32,
    pub label: String,
}

impl Shape16 {
    pub fn new(label: &str) -> Self {
        Self { id: 16, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 17.0 * self.id as f64
    }
}

/// Shape number 17.
#[derive(Debug, Clone, Default)]
pub struct Shape17 {
    pub id: u32,
    pub label: String,
}

impl Shape17 {
    pub fn new(label: &str) -> Self {
        Self { id: 17, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 18.0 * self.id as f64
    }
}

/// Shape number 18.
#[derive(Debug, Clone, Default)]
pub struct Shape18 {
    pub id: u32,
    pub label: String,
}

impl Shape18 {
    pub fn new(label: &str) -> Self {
        Self { id: 18, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 19.0 * self.id as f64
    }
}

/// Shape number 19.
#[derive(Debug, Clone, Default)]
pub struct Shape19 {
    pub id: u32,
    pub label: String,
}

impl Shape19 {
    pub fn new(label: &str) -> Self {
        Self { id: 19, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 20.0 * self.id as f64
    }
}

/// Shape number 20.
#[derive(Debug, Clone, Default)]
pub struct Shape20 {
    pub id: u32,
    pub label: String,
}

impl Shape20 {
    pub fn new(label: &str) -> Self {
        Self { id: 20, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 21.0 * self.id as f64
    }
}

/// Shape number 21.
#[derive(Debug, Clone, Default)]
pub struct Shape21 {
    pub id: u32,
    pub label: String,
}

impl Shape21 {
    pub fn new(label: &str) -> Self {
        Self { id: 21, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 22.0 * self.id as f64
    }
}

/// Shape number 22.
#[derive(Debug, Clone, Default)]
pub struct Shape22 {
    pub id: u32,
    pub label: String,
}

impl Shape22 {
    pub fn new(label: &str) -> Self {
        Self { id: 22, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 23.0 * self.id as f64
    }
}

/// Shape number 23.
#[derive(Debug, Clone, Default)]
pub struct Shape23 {
    pub id: u32,
    pub label: String,
}

impl Shape23 {
    pub fn new(label: &str) -> Self {
        Self { id: 23, label: label.to_string() }
    }

    pub fn area(&self, scale: f64) -> f64 {
        scale * 24.0 * self.id as f64
    }
}

pub fn registry() -> BTreeMap<u32, String> {
    let mut m = BTreeMap::new();
    m.insert(0, Shape0::new("shape-0").label);
    m.insert(1, Shape1::new("shape-1").label);
    m.insert(2, Shape2::new("shape-2").label);
    m.insert(3, Shape3::new("shape-3").label);
    m.insert(4, Shape4::new("shape-4").label);
    m.insert(5, Shape5::new("shape-5").label);
    m.insert(6, Shape6::new("shape-6").label);
    m.insert(7, Shape7::new("shape-7").label);
    m.insert(8, Shape8::new("shape-8").label);
    m.insert(9, Shape9::new("shape-9").label);
    m.insert(10, Shape10::new("shape-10").label);
    m.insert(11, Shape11::new("shape-11").label);
    m.insert(12, Shape12::new("shape-12").label);
    m.insert(13, Shape13::new("shape-13").label);
    m.insert(14, Shape14::new("shape-14").label);
    m.insert(15, Shape15::new("shape-15").label);
    m.insert(16, Shape16::new("shape-16").label);
    m.insert(17, Shape17::new("shape-17").label);
    m.insert(18, Shape18::new("shape-18").label);
    m.insert(19, Shape19::new("shape-19").label);
    m.insert(20, Shape20::new("shape-20").label);
    m.insert(21, Shape21::new("shape-21").label);
    m.insert(22, Shape22::new("shape-22").label);
    m.insert(23, Shape23::new("shape-23").label);
    m
}
