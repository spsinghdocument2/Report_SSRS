﻿/*
Author: Tristan Denyer (based on Charlie Griefer's original clone code, and some great help from Dan - see his comments in blog post)
Plugin repo: https://github.com/tristandenyer/Clone-section-of-form-using-jQuery
Demo at http://tristandenyer.com/using-jquery-to-duplicate-a-section-of-a-form-maintaining-accessibility/
Ver: 0.9.5.0
Last updated: Oct 23, 2015
The MIT License (MIT)
Copyright (c) 2011 Tristan Denyer
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
$(document).ready(function () {

    $('.clonedInput').hide();
});
$(function () {
    $('#AddContact').click(function () {
        var num = $('.clonedInput').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#entry' + num).clone().attr('id', 'entry' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value
        newElem.find(".minus-btn").attr("id", "DeleteContact" + newNum);
        // Insert the new element after the last "duplicatable" input field
        $('#entry' + num).after(newElem);
        newElem.find(".empty").val('');
        $('#ID' + newNum + '_title').focus();
        // Enable the "remove" button. This only shows once you have a duplicated section.
        //$('#DeleteContact').attr('disabled', false);
        // Right now you can only add 4 sections, for a total of 10. Change '10' below to the max number of sections you want to allow.
        if (newNum == 10)
            $('#AddContact').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
        if ($('.clonedInput').length == 0)
            $('#DeleteContact').show();
    });
    $(document).on("click", ".minus-btn", function () {
        var num = $('.clonedInput').length;
        // how many "duplicatable" input fields we currently have
        $(this).parent().parent().slideUp('slow', function () {
          //  $(this).remove();
            //if only one element remains, disable the "remove" button
            if (num - 1 === 1)
                $('#DeleteContact').hide();
            //// enable the "add" button
            //$('#AddContact').attr('disabled', false).prop('value', "Add New Address");
        });
        return false; // Removes the last section you added
    });
});
