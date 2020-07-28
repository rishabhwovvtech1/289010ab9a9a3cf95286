//= require chosen-jquery

var ChosenApplier = {
  init: function ($selectBox, placeholder, options) {
    this.selectBox = $selectBox;
    this.applyChosenOnSelectBox(placeholder, options);
  },

  applyChosenOnSelectBox: function (placeholderText, options) {
    options = options || {};
    this.selectBox.chosen({
      placeholder_text_multiple: placeholderText,
      width: options.width || "100%",
      search_contains: true
    });
  }
};