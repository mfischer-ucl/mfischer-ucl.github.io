
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

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
  margin-bottom: 33px;
}

.collapsible {
  background-color: #f1f1f1;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: center;
  outline: none;
  font-size: 15px;
  position: relative;
  margin-bottom: 10px;
}

.collapsible::before {
  content: '\002B';
  color: #777;
  font-weight: bold;
  margin-right: 5px;
}

.active::before {
  content: "\2212";
}

sup {
    text-decoration: none; 
    color: black;
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
    margin-top: 33px; /* Spacing between the images and the video containers */
    width: 50%; /* Reducing the container's width to 50% */
    margin-left: auto; /* Auto-adjusting left margin */
    margin-right: auto; /* Auto-adjusting right margin */
}

.top-image-container img {
    margin: 0 30px; /* Adjust space between the images */
    max-width: 60%; /* Ensure images don't overflow their container */
    height: auto; /* Maintain aspect ratio */
}

.videos-flex-container {
    display: flex;
    justify-content: center; /* Adjust this to change the alignment of videos */
    flex-wrap: wrap; /* Allows the items to wrap to the next line */
    margin-bottom: 10px;
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
    flex: 0 0 20%; /* Allow each container to grow and shrink as needed */
    max-width: 20%; /* Adjust this value based on your layout */
    box-sizing: border-box; /* Ensure padding and borders are included */
    padding: 0; /* Remove any default padding */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
}

.NAvideo-container video {
    max-width: 100%;
    max-height: 100%;
    height: auto;
    object-fit: contain;
}

.caption {
    text-align: center;
    margin-top: 5px;
    max-width: 100%;
    overflow: hidden; /* Hide any overflowed caption text */
    text-overflow: ellipsis; /* Add an ellipsis for long captions */
    white-space: nowrap; /* Prevent captions from wrapping to the next line */
}

.media-flex-container {
    flex-basis: calc(48.0% - 20px);
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

.parent-flex-container {
    margin-top: 10px;
    margin-bottom: 50px;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 50px;
}

video {
    max-width: 100%;
    height: auto;
    box-sizing: border-box; /* Ensure padding and borders are included in the element's total width and height */
}

.radio-buttons {
    margin-top: 2px;
}


.row {
  margin-left: -15px;
  margin-right: -15px;
}

h2, h3, h4 {
  text-align: center;
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


.media-item {
    margin: 0 10px;
    text-align: center;
    flex-basis: 33%;
}

.media-item img, .media-item video {
    max-width: 100%;
    height: auto;
}

/* Media query for tablets */
@media (max-width: 768px) {
    .teaserbutton {
        height: 60px; /* Smaller height for tablets */
    }
  .media-flex-container {
        flex-basis: 100%;
    }
}

/* Media query for mobile devices */
@media (max-width: 480px) {
    .teaserbutton {
        height: 40px; /* Even smaller height for mobile devices */
    }
  .media-flex-container {
        flex-basis: 100%;
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

    .caption {
        max-width: 100%;
    }

    .globaldiv {
        max-width: 100%;
        margin-left: 0%;
    }
}

</style>