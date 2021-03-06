const datasets = {
    "registration-summary": {
        operator_type: "A company",
        operator_company_name: "My company Ltd.",
        operator_first_line: "First line",
        operator_street: "Street",
        operator_town: "Town",
        operator_postcode: "AA11 1AA",
        operator_company_house_number: "AA123456",
        operator_charity_name: "My charity",
        operator_charity_number: "123456",
        operator_first_name: "Joe",
        operator_last_name: "Bloggs",
        operator_primary_number: "01234567890",
        operator_email: "email@email.com",
        registration_role: "Representative",
        establishment_trading_name: "Trading name",
        establishment_first_line: "First line",
        establishment_street: "Street",
        establishment_town: "Town",
        establishment_postcode: "AA11 1AA",
        establishment_type: "domestic"
    },
    declaration: {
        operator_first_line: "First line",
        operator_postcode: "AA11 1AA",
        operator_type: "A company",
        operator_company_name: "My company Ltd.",
        operator_company_house_number: "AA123456",
        operator_primary_number: "01234567890",
        operator_email: "email@email.com",
        registration_role: "Representative",
        establishment_trading_name: "Trading name",
        establishment_first_line: "First line",
        establishment_street: "Street",
        establishment_town: "Town",
        establishment_postcode: "AA11 1AA",
        establishment_type: "domestic"
    }
};

module.exports = (url, selectedDataset) => {
    const dataToInject = datasets[selectedDataset];

    const encode = obj => {
        var str = [];
        for (var p in obj)
            str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
        return str.join("&");
    };

    if (process.env.QA_KEY) {
        dataToInject.QA_KEY = process.env.QA_KEY;
    } else {
        throw new Error(
            "process.env.QA_KEY not found. Please check your local .env file."
        );
    }

    browser.url(`${url}?${encode(dataToInject)}`);
};
