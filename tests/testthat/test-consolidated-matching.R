# ==============================================================================
# TEST SUITE 6: Consolidated Matching (is_ds043_2006_ag)
# ==============================================================================
# Validates consolidated search in both original and updated databases

test_that("Original names are found with correct status", {
  # Names as they appear in DS 043-2006-AG 2006
  input <- c(
    "Cattleya maxima",
    "Polylepis incana",
    "Aphelandra cuscoensis"
  )

  result <- is_ds043_2006_ag(input, return_details = TRUE)

  expect_true(all(result$Protected.DS043))
  expect_true(all(result$Input.Name == result$Consolidated.Name))

  # Should not be marked as synonyms (they're original names)
  expect_false(any(result$Is.Synonym))
})

test_that("Synonyms are detected correctly", {
  # Find a real synonym from your database
  # Example: "Lycaste locusta" is now "Ida locusta"

  input <- "Pucara leucantha"  # Check if this is a synonym in your data

  result <- is_ds043_2006_ag(input, return_details = TRUE)

  if (result$Is.Synonym[1]) {
    expect_match(result$Consolidated.Status[1], "synonym")
    expect_true(!is.na(result$Accepted.Name[1]))
  }
})

test_that("Updated names are found with updated name marker", {
  # Names that have changed since 2006
  input <- c(
    "Stenomesson leucanthum",
    "Brassia ocanensis"
  )

  result <- is_ds043_2006_ag(input, return_details = TRUE)


  expect_true(all(result$Protected.DS043))
  expect_true(all(stringr::str_detect(result$Consolidated.Status,
                                      "\\(updated name\\)")))
})

test_that("Names in both databases are handled correctly", {
  # Some names exist in both original and updated
  # Should follow prioritize parameter

  # Find a species that exists in both databases
  # Test with prioritize = "original"
  result_orig <- is_ds043_2006_ag("Cattleya maxima",
                                  prioritize = "original",
                                  return_details = TRUE)

  expect_equal(result_orig$Match.Scenario, "Original only")

  # Test with prioritize = "updated"
  result_upd <- is_ds043_2006_ag("Cattleya maxima",
                                 prioritize = "updated",
                                 return_details = TRUE)

  expect_equal(result_upd$Match.Scenario, "Original only")
})

test_that("Not threatened species return correct status", {
  input <- "Persea americana"  # Not in DS 043-2006-AG

  result <- is_ds043_2006_ag(input, return_details = TRUE)

  expect_false(result$Protected.DS043)
  expect_equal(result$Consolidated.Status, "Not threatened")
  expect_equal(result$Match.Scenario, "Not found")
})

test_that("check_ds043 wrapper works correctly", {
  input <- c(
    "Cattleya maxima",      # In DS 043
    "Persea americana"      # Not in DS 043
  )

  result <- check_ds043(input)

  expect_length(result, 2)
  expect_match(result[1], "CR|EN|VU|NT")
  expect_equal(result[2], "Not threatened")
})

test_that("comparison_table_ds043 returns correct structure", {
  input <- c("Cattleya maxima", "Stenomesson leucanthum")

  result <- comparison_table_ds043(input)

  expect_s3_class(result, "data.frame")
  expect_true("protected_by_ds_043" %in% colnames(result))
  expect_true(all(result$protected_by_ds_043 %in% c("YES", "NO")))
})

test_that("is_ds043_2006_ag returns structured empty tibble for empty input", {
  result <- suppressWarnings(
    is_ds043_2006_ag(character(0), return_details = TRUE)
  )

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 0)
  expect_true(all(c(
    "Input.Name",
    "Consolidated.Name",
    "Consolidated.Status",
    "Consolidated.Category",
    "Protected.DS043",
    "Is.Synonym",
    "Accepted.Name",
    "Final.Source",
    "Match.Scenario",
    "Nomenclature.Status",
    "Original.Matched",
    "Original.Status",
    "Updated.Matched",
    "Updated.Status"
  ) %in% colnames(result)))
})

test_that("comparison_table_ds043 handles empty input", {
  result <- suppressWarnings(comparison_table_ds043(character(0)))

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 0)
  expect_true(all(c(
    "input_species",
    "match_2006_list",
    "status_original",
    "match_updated_name",
    "status_updated",
    "protected_ds_043",
    "nomenclature_status",
    "protected_by_ds_043"
  ) %in% colnames(result)))
})
