<template>
  <div>
    <div v-if="isLoading" class="block-in-center">
      <my-loader />
    </div>
    <div class="container mt-5 content">
      <div class="d-flex justify-content-end sm-2 mb-5 container search-hover">
        <form @submit.prevent>
          <div class="navbar-nav align-items-center">
            <div class="nav-item d-flex align-items-center">
              <i class="bx bx-search fs-4 lh-0"></i>
              <input
                type="text"
                class="form-control border-0 shadow-none"
                placeholder="Search..."
                aria-label="Search..."
                v-model="searchQuery"
              />
            </div>
          </div>
        </form>
      </div>
      <div v-if="searchedProducts.length > 0">
        <div v-if="searchQuery === ''">

          <div class="row">
            <TransitionGroup name="list" tag="">
            <div
              class="col-md-4 col-lg-3 mb-5"
              v-for="product in allProducts"
              :key="product.id"
            >
              <product-card
                :id="product.id"
              />
            </div>
            </TransitionGroup>
          </div>
          <div class="my-3 d-flex justify-content-center">
            <my-paginate
              :total-items="allProductCount"
              :current-page="1"
              :items-per-page="allPaginatorPageSize"
              :max-pages-shown="3"
              :hide-prev-next="true"
              @change="changePage"
            />
          </div>
        </div>
        <div v-else>
          <div class="row">
            <TransitionGroup name="list" tag="">
            <div
              class="col-md-4 col-lg-3 mb-5"
              v-for="product in searchedProducts"
              :key="product.id"
            >
              <product-card
                :id="product.id"
              />
            </div>
            </TransitionGroup>
          </div>
        </div>
      </div>

      <div v-if="isLoading" class="block-in-center">
        <my-loader />
      </div>
    </div>
  </div>
</template>

<script>
import MyLoader from "@/components/loader/MyLoader.vue";
import ProductCard from "@/components/product/ProductCard.vue";
import { mapGetters, mapActions } from "vuex";
import MyPaginate from "@/components/paginate/MyPaginate.vue";
import isLoading from "@/mixins/isLoading";

export default {
  mixins: [isLoading],
  components: {
    ProductCard,
    MyLoader,
    MyPaginate,
  },
  data() {
    return {
      searchQuery: "",
      page: 1,
      isLoading: true
    };
  },
  methods: {
    ...mapActions(["getProducts", "getProductsForSearch"]),
    changePage(page) {
      this.getProducts(page);
    },
  },
  async mounted() {
    await this.getProducts();
    await this.getProductsForSearch();
    this.isLoading = false;
  },
  computed: {
    ...mapGetters([
      "allProducts",
      "allPageCount",
      "allProductCount",
      "allProductsForSearch",
      "allPaginatorPageSize",
    ]),
    searchedProducts() {
      return this.allProductsForSearch.filter((p) =>
        p.name.toLowerCase().includes(this.searchQuery.toLowerCase())
      );
    },
  },
};
</script>

<style lang="scss" scoped>
.list-move, /* apply transition to moving elements */
.list-enter-active,
.list-leave-active {
  transition: all 1s ease;
}

.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(100%);
  transform: translateY(100%);
}

.list-leave-active {
  position: absolute;
}

.search-hover :hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  transition: 0.6s;
}

// center loader
.block-in-center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>