const copied = (button, status) => {
  const svg = button.querySelector("span");
  svg.innerText = status ? "check" : "content_copy";
  if (!status && svg.classList.contains("text-green"))
    svg.classList.remove("text-green");
  if (status && !svg.classList.contains("text-green"))
    svg.classList.add("text-green");
};

const copyCodeToClipboard = (button) => {
  navigator.clipboard.writeText(
    button
      .closest(".codeblock")
      .querySelector("code")
      .innerText.replaceAll("\n\n", "\n"),
  );
  copied(button, true);
};

document.querySelectorAll(".codeblock").forEach((codeBlock) => {
  codeBlock.addEventListener("mouseleave", () =>
    copied(codeBlock.querySelector(".codeblock-copy"), false),
  );
});
document.querySelectorAll(".codeblock-copy").forEach((button) => {
  button.addEventListener("click", () => copyCodeToClipboard(button));
});
