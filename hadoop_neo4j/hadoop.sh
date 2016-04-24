#! /bin/bash

set -euo pipefail

prep_submissions() {
    rm -rf Submissions
    unzip submissions.zip
    cd Submissions

    for d in *; do
        cd "$d"
        unzip page_rank.zip
        cd ..
    done

    # group_of_bz88_fw224
    d="group_of_bz88_fw224"
    mv "$d/submission/src" "$d"
    mv "$d/submission/Makefile" "$d"

    # group_of_cj329_emk244_mc2363
    nothing_to_do=""

    # group_of_jl3426_st765_yd275
    nothing_to_do=""

    # group_of_jsm398_mgp64
    d="group_of_jsm398_mgp64"
    mv "$d/skeleton/src" "$d"
    mv "$d/skeleton/Makefile" "$d"

    # group_of_jx255_xz485
    nothing_to_do=""

    # group_of_xg229_xt85_yw747
    nothing_to_do=""

    cd ..
}

grade_submissions() {
    submissions=(
        group_of_bz88_fw224
        group_of_cj329_emk244_mc2363
        group_of_jl3426_st765_yd275
        group_of_jsm398_mgp64
        group_of_jx255_xz485
        group_of_xg229_xt85_yw747
    )

    for d in "${submissions[@]}"; do
        d="Submissions/$d"
        student="$(basename $d)"
        echo "Grading $student"

        rm -rf solution
        cp -r /vagrant/solution .
        cp "$d/Makefile" solution
        cp -r "$d/src" solution
        cd solution
        java PageRankTest &> "../$student.txt"
        # java PageRankTest
        cd ..
    done
}

main() {
    prep_submissions
    grade_submissions
}

main
