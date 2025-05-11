    const reveals = document.querySelectorAll(".reveal");
    window.addEventListener("scroll", () => {
        for (let i = 0; i < reveals.length; i++) {
            const windowHeight = window.innerHeight;
            const elementTop = reveals[i].getBoundingClientRect().top;
            if (elementTop < windowHeight - 100) {
                reveals[i].classList.add("active");
            }
        }
    });


    document.addEventListener("DOMContentLoaded", function () {
        const searchForm = document.getElementById("searchForm");
        const searchInput = document.getElementById("searchInput");
        const categoryFilter = document.getElementById("categoryFilter");
        const sortSelect = document.getElementById("sortSelect");
        const productContainer = document.getElementById("productContainer");
        const productCards = Array.from(document.querySelectorAll(".product-card_page"));
    
        // === GLOBAL SEARCH HANDLING ===
        if (searchForm && searchInput) {
            searchForm.addEventListener("submit", function (e) {
                e.preventDefault();
                const query = searchInput.value.trim();
                if (query) {
                    window.location.href = `/products/?search=${encodeURIComponent(query)}`;
                }
            });
        }
    
        // === PRODUCTS PAGE FILTERING + SORTING ===
        function getQueryParam(param) {
            const params = new URLSearchParams(window.location.search);
            return params.get(param) || "";
        }
    
        function filterProducts(searchTerm = "") {
            const selectedCategory = categoryFilter?.value || "all";
            const sortType = sortSelect?.value || "";
    
            let filtered = productCards.filter(card => {
                const name = card.querySelector(".product-name_page").textContent.toLowerCase();
                const category = card.dataset.category;
                return (
                    name.includes(searchTerm.toLowerCase()) &&
                    (selectedCategory === "all" || category === selectedCategory)
                );
            });
    
            // Sorting logic
            if (sortType === "price-asc") {
                filtered.sort((a, b) =>
                    parseFloat(a.querySelector(".product-price_page").textContent.replace("₹", "")) -
                    parseFloat(b.querySelector(".product-price_page").textContent.replace("₹", ""))
                );
            } else if (sortType === "price-desc") {
                filtered.sort((a, b) =>
                    parseFloat(b.querySelector(".product-price_page").textContent.replace("₹", "")) -
                    parseFloat(a.querySelector(".product-price_page").textContent.replace("₹", ""))
                );
            } else if (sortType === "az") {
                filtered.sort((a, b) =>
                    a.querySelector(".product-name_page").textContent.localeCompare(b.querySelector(".product-name_page").textContent)
                );
            } else if (sortType === "za") {
                filtered.sort((a, b) =>
                    b.querySelector(".product-name_page").textContent.localeCompare(a.querySelector(".product-name_page").textContent)
                );
            }
    
            productContainer.innerHTML = "";
            filtered.forEach(card => productContainer.appendChild(card));

            productContainer.innerHTML = "";

            // Show or hide "no results"
            const noResultsMsg = document.getElementById("noResults");
            if (filtered.length === 0) {
                noResultsMsg.style.display = "block";
            } else {
                noResultsMsg.style.display = "none";
                filtered.forEach(card => productContainer.appendChild(card));
            }
        }
    
        // Only run filtering logic on the products page
        if (productContainer) {
            const categoryFromURL = getQueryParam("category");
            if (categoryFromURL && categoryFilter) {
                categoryFilter.value = categoryFromURL;
            }
            const searchFromURL = getQueryParam("search");
            if (searchFromURL) {
                searchInput.value = searchFromURL;
                filterProducts(searchFromURL);
            } else {
                filterProducts();
            }
    
            categoryFilter?.addEventListener("change", () =>
                filterProducts(searchInput?.value.trim() || "")
            );
            sortSelect?.addEventListener("change", () =>
                filterProducts(searchInput?.value.trim() || "")
            );
        }

        
});
    