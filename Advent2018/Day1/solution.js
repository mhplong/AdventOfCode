#!/usr/local/bin/node

var fs = require('fs');
var readline = require('readline');

const rl = readline.createInterface({
    input: fs.createReadStream('input.txt'),
    crlfDelay: Infinity
})

var array = [];
var freqeuncies = {};

function addInput(input) {
    var number = Number(input)
    array.push(number);
}

rl.on('line', addInput)

new Promise(resolve => rl.on('close', resolve))
.then(() => {
    var base = 0;
    var foundDuplicate = false;
    var firstAnswer = 0;
    var secondAnswer = 0;

    while (!foundDuplicate) {
        for (var i = 0; i < array.length; i++) {
            base += array[i];
            freqeuncies[base] = freqeuncies[base] ? freqeuncies[base] + 1 : 1;
            if (freqeuncies[base] > 1) {
                foundDuplicate = true;
                secondAnswer = base;
                break;
            }
        }
        firstAnswer = firstAnswer == 0 ? base : firstAnswer;
    }

    console.log('First Answer: ' + firstAnswer);
    console.log('Second Answer: ' + secondAnswer);
});