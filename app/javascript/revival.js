function check() {
  const posts = document.querySelectorAll(".revival");
  posts.forEach(function (post) {
    if (post.getAttribute("data-load") != null) {
      return null;
    }
    post.setAttribute("data-load", "true");
    post.addEventListener("click", () => {
      const postId = post.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/notes/dust/${postId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const box = XHR.response.post;
        if (box.trash === true) {
          post.setAttribute("data-check", "true");
        } else if (box.trash === false) {
          post.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);