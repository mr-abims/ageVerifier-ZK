use dep::std;

fn main(age: u32, birth_year: Field, ageHash: pub Field) {
    assert(2024 - age == birth_year as u32);
    assert(age >= 21);

    // Check integrity of birth year hash
    let computed_hash = std::hash::pedersen_commitment([birth_year]);
    assert(computed_hash.x == ageHash);
}

#[test]
fn test_main() {
    let birth_hash = std::hash::pedersen_commitment([2000]);
    std::println(birth_hash);
    main(24, 2000, birth_hash.x);
}
