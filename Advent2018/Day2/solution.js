#!/usr/local/bin/node

var fs = require('fs');
var readline = require('readline');
var assert = require('assert')

const rl = readline.createInterface({
    input: fs.createReadStream('input.txt'),
    crlfDelay: Infinity
})

var boxIds = [];

function addInput(input) {
    boxIds.push(input);
}

rl.on('line', addInput)

new Promise(resolve => rl.on('close', resolve))
    .then(runUnitTests)
    .then(() => console.log("\n---Unit Tests Passed---\n"))
    .then(processInput);

function processInput() {
    var times2 = 0;
    var times3 = 0;
    for (boxId of boxIds) {
        var result = collectCounts(boxId)
        times2 += result.countTwo ? 1 : 0;
        times3 += result.countThree ? 1 : 0;
    }

    console.log('2 times: ', times2, ': 3 times: ', times3, ' Answer = ', times2 * times3);

    // console.log('First Answer: ' + firstAnswer);
    // console.log('Second Answer: ' + secondAnswer);
}

function collectCounts(boxId) {
    var countTwo = false;
    var countThree = false;
    var dictionary = {};
    for (char of boxId) {
        dictionary[char] = dictionary[char] == undefined ? 1 : dictionary[char] + 1;

        if (dictionary[char] == 3) {
       //     console.log(char, '3 times: ', dictionary[char]);
            countThree = true;
        }
    }

    dictionary = {};
    for (char of boxId) {
        dictionary[char] = dictionary[char] == undefined ? 1 : dictionary[char] + 1;

        if (dictionary[char] == 2) {
        //    console.log(char, '2 times: ', dictionary[char]);
            countTwo = true;
        }
    }
    return {
        countTwo,
        countThree,
        boxId
    }
}

function runUnitTests() {
    var assertion = collectCounts("abcdef")
    assert(!assertion.countTwo && !assertion.countThree, assertion)
    assertion = collectCounts("bababc")
    assert(assertion.countTwo && assertion.countThree, assertion)
    assertion = collectCounts("abbcde")
    assert(assertion.countTwo && !assertion.countThree, assertion)
    assertion = collectCounts("abcccd")
    assert(!assertion.countTwo && assertion.countThree, assertion)
    assertion = collectCounts("abcdee")
    assert(assertion.countTwo && !assertion.countThree, assertion)
    assertion = collectCounts("ababab")
    assert(!assertion.countTwo && assertion.countThree, assertion)
}