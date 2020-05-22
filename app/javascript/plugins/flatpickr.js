import flatpickr from "flatpickr";

// flatpickr(".datepicker", {
//   altInput: true,
//   allowInput: true,
//   enableTime: true
// });

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true
  });
};

export { initFlatpickr };
