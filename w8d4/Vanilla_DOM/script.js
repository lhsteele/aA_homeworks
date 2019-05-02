document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const placeFormSubmit = (e) => {
      event.preventDefault();

      const placeInput = document.querySelector(".favorite-input");
      const placeName = placeInput.value;
      placeInput.value = "";

      const ul = document.getElementById("sf-places");
      const li = document.createElement("li");

      li.textContent = placeName;

      ul.appendChild(li);

    };
  
  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", placeFormSubmit);


  // adding new photos

  const showPhotoForm = (e) => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container") {
      photoForm.className = "photo-form-container-hidden";
    } else {
      photoForm.className = "photo-form-container";
    }
  };

  const photoShowButton = document.querySelector(".photo-show-button");
  photoShowButton.addEventListener("click", showPhotoForm);

  const photoFormSubmit = (e) => {
    event.preventDefault();

    const photoInput = document.querySelector(".photo-url-input");
    const imageURL = photoInput.value;
    photoInput.value = "";

    const newPhoto = document.createElement("img");
    newPhoto.src = imageURL;

    const li = document.createElement("li");
    li.appendChild(newPhoto);

    const ul = document.querySelector(".dog-photos");
    ul.appendChild(li);
  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", photoFormSubmit);


});
