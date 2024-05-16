
<style>

.mybutton {
  background-color: #fff;
  border: 1px solid #d5d9d9;
  border-radius: 5px;
  box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
  box-sizing: border-box;
  color: #000000;
  cursor: pointer;
  display: inline-block;
  font-family: "Amazon Ember", sans-serif;
  font-size: 10.5px;
  line-height: 18px;
  padding: 0 10px 0 10px;
  position: relative;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: middle;
  width: width: fit-content;
}

.mybutton:hover {
  background-color: #f7fafa;
}

.mybutton:focus {
  border-color: #008296;
  box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
  outline: 0;
}

.top-image-container {
    display: flex;
    justify-content: center; /* Center the images horizontally */
    align-items: center; /* Center the images vertically */
    margin-bottom: 0px; /* Spacing between the images and the video containers */
    width: 100%; /* Ensuring the container takes full width */
}

.top-image-container img {
    margin: 0 30px; /* Adjust space between the images */
    max-width: 30%; /* Ensure images don't overflow their container */
    height: auto; /* Maintain aspect ratio */
}


#NAvideoForm {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;
    flex-wrap: wrap;
    margin-top: 5px;
    margin-bottom: 25px;
    background-color: #F8F8F8;
    padding: 20px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
    border-radius: 10px;
}

.NAvideo-container {
    margin: 3px;
    text-align: center;
    flex: 1; /* Allow each container to grow and shrink as needed */
    max-width: 20%; /* Adjust this value based on your layout */
}

video {
    max-width: 100%;
    height: auto;
}

.radio-buttons {
    margin-top: 2px;
}


.row {
  margin-left: -15px;
  margin-right: -15px;
}

h4, .h4, h5, .h5, h6, .h6 {
  margin-top: 10.5px;
  margin-bottom: 10.5px;
}

.horizItem {
    display: inline-block; 
    margin-left: 3%; 
    margin-right: 3%;
}

.grey-box {
  background-color: #f2f2f2;
  padding: 20px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
  border-radius: 10px;
}

figure{
display: inline-block;
}

.cite-box {
  background-color: #f7f7f7; 
  line-height: 110%;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
  border-radius: 3px;
  padding: 10px;
}

.vidcontainer {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 15px;
}

.teaserbutton {
    height: 80px; /* Default height for larger screens */
    width: auto; /* Maintain aspect ratio */
}

/* Media query for tablets */
@media (max-width: 768px) {
    .teaserbutton {
        height: 60px; /* Smaller height for tablets */
    }
}

/* Media query for mobile devices */
@media (max-width: 480px) {
    .teaserbutton {
        height: 40px; /* Even smaller height for mobile devices */
    }
}

.globaldiv {
    font-size: 16px; 
    margin-left: -25%;
}

@media screen and (max-width: 768px) {
    
    .grey-box {
        max-width: 100%;
    }

    .cite-box {
        max-width: 100%;
    }    

    .vidcontainer {
        max-width: 100%;
    }

    .globaldiv {
        max-width: 100%;
        margin-left: 0%;
    }
}

</style>