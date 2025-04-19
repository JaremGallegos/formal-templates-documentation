module.exports = {
    getNextHeadingLevel(currentlevel) {
        return parseInt(currentlevel, 10) + 1;
    },
    getReadingTime(text) {
        const wordsPerMinute = 200;
        const numberOfWords = text.split(/\s/g).length;
        return Math.ceil(numberOfWords / wordsPerMinute);
    }
};