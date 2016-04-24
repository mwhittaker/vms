#! /bin/bash

set -euo pipefail

prep_submissions() {
    rm -rf Submissions
    unzip submissions.zip
}

grade_submissions() {
    submissions=()
    submissions+=(group_of_bz88_fw224)
    submissions+=(group_of_cj329_emk244_mc2363)
    submissions+=(group_of_jl3426_st765_yd275) # error
    submissions+=(group_of_jsm398_mgp64) # error
    submissions+=(group_of_jx255_xz485)
    submissions+=(group_of_xg229_xt85_yw747)

    neo4j-shell -file /vagrant/neo4j-solution/constraint.txt
    for student in "${submissions[@]}"; do
        echo "========================="
        echo "$student"
        echo "========================="

        echo "deleting everything"
        echo "-------------------"
        neo4j-shell -file /vagrant/neo4j-solution/delete_all.txt

        echo "creating database"
        echo "-----------------"
        neo4j-shell -file /vagrant/neo4j-solution/database.txt

        echo "running queries"
        echo "---------------"
        neo4j-shell -file "Submissions/$student/queries.txt" &> "$student-neo4j.txt"
        echo
    done
}

main() {
    # prep_submissions
    grade_submissions
}

main
