document.addEventListener("DOMContentLoaded", () => {
  // Quarto stdout outputs: <div class="cell-output cell-output-stdout"><pre>...</pre></div>
  const pres = document.querySelectorAll(".cell-output-stdout pre");

  pres.forEach((pre) => {
    pre.setAttribute("tabindex", "0");
    pre.setAttribute("role", "region");

    if (!pre.hasAttribute("aria-label") && !pre.hasAttribute("aria-labelledby")) {
      pre.setAttribute("aria-label", "Scrollable console output");
    }
  });
});
