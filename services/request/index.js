var parseUserDetails = (req) => {
    return req.userDetails
}

var getUserId = (req) => {
    var details = parseUserDetails(req);
    return details.id
}
module.exports = {
    parseUserDetails,
    getUserId
}