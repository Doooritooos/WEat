function validateForm() {
    var business = document.forms["frmSearch"]["txtBusinessName"].value;
    var city = document.forms["frmSearch"]["txtCity"].value;
    var rdo = document.forms["frmSearch"]["rdoSearchMethod"].value;

    if (rdo == "SearchByBusinessName") {
        if (business == null || business == "" || city == "" || city == null) {
            alert("Please fill out both the business name and the location!");
            return false;
        }
    } else if (rdo == "SearchByCategory") {
        if (business == null || business == "" || city == "" || city == null ) {
            alert("Please fill out both the category and the location!");
            return false;
        }
    } else if (rdo == "SearchByCity") {
        if (city == null || city == "") {
            alert("Please fill out the city!");
            return false;
        }
    } else {
        if (city == null || city == "") {
            alert("Please fill out the city!");
            return false;
        }
    }
}


