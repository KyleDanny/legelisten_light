
export const laptopSizeRemoveElement = (el) => {
  window.addEventListener('resize', () => {
    if (window.screen.width >= 1200) {
      el.style.display = "block";
    }
  })
}

export const laptopSizeAddElement = (el) => {
  window.addEventListener('resize', () => {
    if (window.screen.width < 1200) {
      el.style.display = "none";
    }
  })
}
