
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Teko:400,700"
	rel="stylesheet">
<spring:url value="/resources/bootstrap.css" var="bootstrapCSS" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="${bootstrapCSS}" rel="stylesheet" />

<title>ISS Consulting</title>
<style type="text/css">
body {
	background-image: url('https://crunchify.com/bg.png');
}
</style>
</head>

<section class="content">
	<h1 class="content__heading">Send Me a Message</h1>
	<p class="content__lede">Use this handy contact form to get in
		touch with me.</p>
	<form class="content__form contact-form">
		<div class="testing">
			<p>Does this do anything?</p>
		</div>
		<div class="contact-form__input-group">
				<input class="contact-form__input contact-form__input--radio" id="salutation-mr" name="salutation" type="radio" value="Mr." /> 
				<label class="contact-form__label contact-form__label--radio" for="salutation-mr">Mr.</label> 
				
				<input class="contact-form__input contact-form__input--radio" id="salutation-mrs" name="salutation" type="radio" value="Mrs." />
				<label class="contact-form__label contact-form__label--radio" for="salutation-mrs">Mrs.</label> 
				
				<input class="contact-form__input contact-form__input--radio" id="salutation-ms" name="salutation" type="radio" value="Ms." /> 
				<label class="contact-form__label contact-form__label--radio" for="salutation-ms">Ms.</label>
		</div>
		
		<div class="contact-form__input-group">
			<label class="contact-form__label" for="name">Name</label> 
			<input class="contact-form__input contact-form__input--text" id="name" name="name" type="text" />
		</div>
		
		<div class="contact-form__input-group">
			<label class="contact-form__label" for="email">Email Address</label>
			<input class="contact-form__input contact-form__input--email" id="email" name="email" type="email" />
		</div>
		
		<div class="contact-form__input-group">
			<label class="contact-form__label" for="subject">How can I
				help you?</label> <select
				class="contact-form__input contact-form__input--select" id="subject"
				name="subject">
				<option>I need a general advice.</option>
				<option>I need consulting serivces..</option>
				<option>I have a general question.</option>
				
			</select>
		</div>
		<div class="contact-form__input-group">
			<label class="contact-form__label" for="message">Enter a Message</label>
			<textarea class="contact-form__input contact-form__input--textarea" id="message" name="message" rows="6" cols="65"></textarea>
		</div>
		
		<div class="contact-form__input-group">
			<p class="contact-form__label--checkbox-group">Please send me:</p>
			<input class="contact-form__input contact-form__input--checkbox"
				id="snacks-pizza" name="snacks" type="checkbox" value="pizza" /> <label
				class="contact-form__label contact-form__label--checkbox"
				for="snacks-pizza">Pizza</label> <input
				class="contact-form__input contact-form__input--checkbox"
				id="snacks-cake" name="snacks" type="checkbox" value="cake" /> <label
				class="contact-form__label contact-form__label--checkbox"
				for="snacks-cake">Cake</label>
		</div>
		<input name="secret" type="hidden"
			value="1b3a9374-1a8e-434e-90ab-21aa7b9b80e7" />
		<button class="contact-form__button" type="submit">Send It!</button>
	</form>
</section>
<div class="results">
	<h2 class="results__heading">Form Data</h2>
	<pre class="results__display-wrapper">
		<code class="results__display"></code>
	</pre>
</div>

<script type="text/javascript">

const isValidElement = element => {
  return element.name && element.value;
};


const isValidValue = element => {
  return !["checkbox", "radio"].includes(element.type) || element.checked;
};

const isCheckbox = element => element.type === "checkbox";

const isMultiSelect = element => element.options && element.multiple;

const getSelectValues = options =>
  [].reduce.call(
    options,
    (values, option) => {
      return option.selected ? values.concat(option.value) : values;
    },
    []
  );


const formToJSON_deconstructed = elements => {
  // This is the function that is called on each element of the array.
  const reducerFunction = (data, element) => {
    // Add the current field to the object.
    data[element.name] = element.value;

    // For the demo only: show each step in the reducers progress.
    console.log(JSON.stringify(data));

    return data;
  };

  // This is used as the initial value of `data` in `reducerFunction()`.
  const reducerInitialValue = {};

  // To help visualize what happens, log the inital value, which we know is `{}`.
  console.log("Initial `data` value:", JSON.stringify(reducerInitialValue));

  // Now we reduce by `call`-ing `Array.prototype.reduce()` on `elements`.
  const formData = [].reduce.call(
    elements,
    reducerFunction,
    reducerInitialValue
  );

  // The result is then returned for use elsewhere.
  return formData;
};


const formToJSON = elements =>
  [].reduce.call(
    elements,
    (data, element) => {
      // Make sure the element has the required properties and should be added.
      if (isValidElement(element) && isValidValue(element)) {
        /*
     * Some fields allow for more than one value, so we need to check if this
     * is one of those fields and, if so, store the values as an array.
     */
        if (isCheckbox(element)) {
          data[element.name] = (data[element.name] || []).concat(element.value);
        } else if (isMultiSelect(element)) {
          data[element.name] = getSelectValues(element);
        } else {
          data[element.name] = element.value;
        }
      }

      return data;
    },
    {}
  );

const handleFormSubmit = event => {
  // Stop the form from submitting since we re handling that with AJAX.
  event.preventDefault();

  // Call our function to get the form data.
  const data = formToJSON(form.elements);

  // Demo only: print the form data onscreen as a formatted JSON object.
  const dataContainer = document.getElementsByClassName("results__display")[0];

  // Use `JSON.stringify()` to make the output valid, human-readable JSON.
  dataContainer.textContent = JSON.stringify(data, null, "  ");

  // ...this is where we d actually do something with the form data...
};

const form = document.getElementsByClassName("contact-form")[0];
form.addEventListener("submit", handleFormSubmit);

</script>