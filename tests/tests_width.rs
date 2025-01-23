// tests/tests_width.rs
#[cfg(test)]
mod tests {
    use super::*; // Import necessary functions and structs

    #[test]
    fn test_page_width_and_grid() {
        let lib = library();
        
        // Check if the page width is set to auto
        assert_eq!(lib.styles.get(PageElem::get_width()), Smart::Auto);

        // Check if the grid layout is set as expected (1fr, 2fr)
        let grid_template_columns = lib.styles.get(GridElem::get_template_columns());
        assert_eq!(grid_template_columns, [Smart::Custom(Abs::pt(1.0).into()), Smart::Custom(Abs::pt(2.0).into())]);
    }
}
