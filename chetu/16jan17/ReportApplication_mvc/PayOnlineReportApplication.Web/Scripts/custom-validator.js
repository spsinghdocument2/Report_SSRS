(function () {
    $.validator.defaults.focusInvalid = false;
    $.validator.unobtrusive.adapters.add(
'isdateafter', ['propertytested', 'allowequaldates'], function (options) {
    options.rules['isdateafter'] = options.params;
    options.messages['isdateafter'] = options.message;
});
    $.validator.addMethod("isdateafter", function (value, element, params) {
        var startdatevalue = $('input[name="' + params.propertytested + '"]').val();
        if (!value || !startdatevalue) return true;
        return (params.allowequaldates) ? Date.parse(startdatevalue) <= Date.parse(value) : Date.parse(startdatevalue) < Date.parse(value);
    }, '');
})();