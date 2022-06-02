function() {

var uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lowercase = "abcdefghijklmnopqrstuvwxyz"
    numeric = "0123456789"
    special = "!@#$%^&()_+"



    makeRandomId = function(pattern) {
        var s= '';
        // all true by default
        if (pattern.uppercase !== false && pattern.numeric !== true) s += uppercase;
        if (pattern.lowercase !== false && pattern.numeric !== true) s += uppercase;
        if (pattern.numbers !== false && pattern.alpha !== true) s += numeric;
        if (pattern.special === true && pattern.numeric !== true && pattern.alpha !== true) s += special; //false by default
        return(pattern.prefix || '') + Array.apply(null, Array(pattern.length || 40)).map(function(){
        return s.charAt(Math.floor(Math.random() * s.length));
        }).join('');
    },

    makeFormattedDate = function (offset) {
    var date = new Date();
    date.setDate(date.getDate() + (offset || 0));
    return date.toISOString().slice(0,10);
    };

    return{
    makeRandomId: makeRandomId,
    makeFormattedDate: makeFormattedDate
    }
}