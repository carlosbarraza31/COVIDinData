//
//  DataStructures.swift
//  COVID19inData
//
//  Created by Carlos Barraza on 07/01/21.
//

import Foundation

// MARK: - CountryData
struct CountryData: Codable {
    let afg: Afg
    let alb: Alb
    let dza: Dza

    enum CodingKeys: String, CodingKey {
        case afg = "AFG"
        case alb = "ALB"
        case dza = "DZA"
    }
}

// MARK: - Afg
struct Afg: Codable {
    let continent, location: String
    let population: Int
    let populationDensity, medianAge, aged65_Older, aged70_Older: Double
    let gdpPerCapita, cardiovascDeathRate, diabetesPrevalence, handwashingFacilities: Double
    let hospitalBedsPerThousand, lifeExpectancy, humanDevelopmentIndex: Double
    let data: [AFGDatum]

    enum CodingKeys: String, CodingKey {
        case continent, location, population
        case populationDensity = "population_density"
        case medianAge = "median_age"
        case aged65_Older = "aged_65_older"
        case aged70_Older = "aged_70_older"
        case gdpPerCapita = "gdp_per_capita"
        case cardiovascDeathRate = "cardiovasc_death_rate"
        case diabetesPrevalence = "diabetes_prevalence"
        case handwashingFacilities = "handwashing_facilities"
        case hospitalBedsPerThousand = "hospital_beds_per_thousand"
        case lifeExpectancy = "life_expectancy"
        case humanDevelopmentIndex = "human_development_index"
        case data
    }
}

// MARK: - AFGDatum
struct AFGDatum: Codable {
    let date: String
    let totalCases, newCases: Int
    let totalCasesPerMillion, newCasesPerMillion: Double
    let stringencyIndex, newCasesSmoothed, newDeathsSmoothed, newCasesSmoothedPerMillion: Double?
    let newDeathsSmoothedPerMillion: Double?
    let totalDeaths, newDeaths: Int?
    let totalDeathsPerMillion, newDeathsPerMillion, reproductionRate: Double?
    let totalVaccinations, totalVaccinationsPerHundred, newVaccinations, newVaccinationsSmoothed: Int?
    let newVaccinationsSmoothedPerMillion: Int?

    enum CodingKeys: String, CodingKey {
        case date
        case totalCases = "total_cases"
        case newCases = "new_cases"
        case totalCasesPerMillion = "total_cases_per_million"
        case newCasesPerMillion = "new_cases_per_million"
        case stringencyIndex = "stringency_index"
        case newCasesSmoothed = "new_cases_smoothed"
        case newDeathsSmoothed = "new_deaths_smoothed"
        case newCasesSmoothedPerMillion = "new_cases_smoothed_per_million"
        case newDeathsSmoothedPerMillion = "new_deaths_smoothed_per_million"
        case totalDeaths = "total_deaths"
        case newDeaths = "new_deaths"
        case totalDeathsPerMillion = "total_deaths_per_million"
        case newDeathsPerMillion = "new_deaths_per_million"
        case reproductionRate = "reproduction_rate"
        case totalVaccinations = "total_vaccinations"
        case totalVaccinationsPerHundred = "total_vaccinations_per_hundred"
        case newVaccinations = "new_vaccinations"
        case newVaccinationsSmoothed = "new_vaccinations_smoothed"
        case newVaccinationsSmoothedPerMillion = "new_vaccinations_smoothed_per_million"
    }
}

// MARK: - Alb
struct Alb: Codable {
    let continent, location: String
    let population: Int
    let populationDensity: Double
    let medianAge: Int
    let aged65_Older, aged70_Older, gdpPerCapita, extremePoverty: Double
    let cardiovascDeathRate, diabetesPrevalence, femaleSmokers, maleSmokers: Double
    let hospitalBedsPerThousand, lifeExpectancy, humanDevelopmentIndex: Double
    let data: [ALBDatum]

    enum CodingKeys: String, CodingKey {
        case continent, location, population
        case populationDensity = "population_density"
        case medianAge = "median_age"
        case aged65_Older = "aged_65_older"
        case aged70_Older = "aged_70_older"
        case gdpPerCapita = "gdp_per_capita"
        case extremePoverty = "extreme_poverty"
        case cardiovascDeathRate = "cardiovasc_death_rate"
        case diabetesPrevalence = "diabetes_prevalence"
        case femaleSmokers = "female_smokers"
        case maleSmokers = "male_smokers"
        case hospitalBedsPerThousand = "hospital_beds_per_thousand"
        case lifeExpectancy = "life_expectancy"
        case humanDevelopmentIndex = "human_development_index"
        case data
    }
}

// MARK: - ALBDatum
struct ALBDatum: Codable {
    let date: String
    let newTests, totalTests: Int?
    let totalTestsPerThousand, newTestsPerThousand: Double?
    let testsUnits: TestsUnits?
    let stringencyIndex: Double?
    let newTestsSmoothed: Int?
    let newTestsSmoothedPerThousand: Double?
    let totalCases, newCases: Int?
    let totalCasesPerMillion, newCasesPerMillion: Double?
    let totalDeaths, newDeaths: Int?
    let totalDeathsPerMillion, newDeathsPerMillion, newCasesSmoothed, newDeathsSmoothed: Double?
    let newCasesSmoothedPerMillion, newDeathsSmoothedPerMillion, positiveRate, testsPerCase: Double?
    let reproductionRate: Double?

    enum CodingKeys: String, CodingKey {
        case date
        case newTests = "new_tests"
        case totalTests = "total_tests"
        case totalTestsPerThousand = "total_tests_per_thousand"
        case newTestsPerThousand = "new_tests_per_thousand"
        case testsUnits = "tests_units"
        case stringencyIndex = "stringency_index"
        case newTestsSmoothed = "new_tests_smoothed"
        case newTestsSmoothedPerThousand = "new_tests_smoothed_per_thousand"
        case totalCases = "total_cases"
        case newCases = "new_cases"
        case totalCasesPerMillion = "total_cases_per_million"
        case newCasesPerMillion = "new_cases_per_million"
        case totalDeaths = "total_deaths"
        case newDeaths = "new_deaths"
        case totalDeathsPerMillion = "total_deaths_per_million"
        case newDeathsPerMillion = "new_deaths_per_million"
        case newCasesSmoothed = "new_cases_smoothed"
        case newDeathsSmoothed = "new_deaths_smoothed"
        case newCasesSmoothedPerMillion = "new_cases_smoothed_per_million"
        case newDeathsSmoothedPerMillion = "new_deaths_smoothed_per_million"
        case positiveRate = "positive_rate"
        case testsPerCase = "tests_per_case"
        case reproductionRate = "reproduction_rate"
    }
}

enum TestsUnits: String, Codable {
    case testsPerformed = "tests performed"
}

// MARK: - Dza
struct Dza: Codable {
    let continent, location: String
    let population: Int
    let populationDensity, medianAge, aged65_Older, aged70_Older: Double
    let gdpPerCapita, extremePoverty, cardiovascDeathRate, diabetesPrevalence: Double
    let femaleSmokers, maleSmokers, handwashingFacilities, hospitalBedsPerThousand: Double
    let lifeExpectancy, humanDevelopmentIndex: Double
    let data: [AFGDatum]

    enum CodingKeys: String, CodingKey {
        case continent, location, population
        case populationDensity = "population_density"
        case medianAge = "median_age"
        case aged65_Older = "aged_65_older"
        case aged70_Older = "aged_70_older"
        case gdpPerCapita = "gdp_per_capita"
        case extremePoverty = "extreme_poverty"
        case cardiovascDeathRate = "cardiovasc_death_rate"
        case diabetesPrevalence = "diabetes_prevalence"
        case femaleSmokers = "female_smokers"
        case maleSmokers = "male_smokers"
        case handwashingFacilities = "handwashing_facilities"
        case hospitalBedsPerThousand = "hospital_beds_per_thousand"
        case lifeExpectancy = "life_expectancy"
        case humanDevelopmentIndex = "human_development_index"
        case data
    }
}
