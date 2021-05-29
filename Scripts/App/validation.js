$(function () {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form[id='ctl01']").validate({
        // Specify validation rules
        rules: {
            /*MainContent_TextBox1
            Model: {
                required: true,
                maxlength: 20
            },
            Year: "required",
            Color: "required"*/
            MainContent_TextBox1: {
                required: true,
                maxlength: 20
            },
            MainContent_TextBox2: "Required",
            MainContent_TextBox3: "Required"
        },
        // Specify validation error messages
        messages: {
            MainContent_TextBox1: "Favor, insira um modelo",
            MainContent_TextBox2: "Favor, insira um ano",
            MainContent_TextBox3: "Favor, insira uma cor"
            /*
            Model: "Favor, insira um modelo",
            Year: "Favor, insira um ano",
            Color: "Favor, insira uma cor"
            */
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function (form) {

            console.log("oi");
            form.submit();
        }
    });
});