<template>
  <img v-if="img" :src="img" alt="bg" />
  <div class="bg-dark"></div>
  <div class="indecision-container">
    <input type="text" placeholder="Haz una pregunta" v-model="question" />
    <p>Termina tu pregunta con un signo de interrogación (?)</p>

    <div v-if="isValid">
      <h2>{{ question }}</h2>
      <h1>{{ answer }}</h1>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      question: "",
      answer: null,
      img: null,
      isValid: false,
    };
  },
  methods: {
    async getAnswer() {
      this.answer = "Pensando...";

      const { answer, image } = await fetch("https://yesno.wtf/api").then(
        (res) => res.json()
      );

      this.img = image;
      this.answer = answer === "yes" ? "Si" : "No";
    },
  },
  watch: {
    question(value, oldValue) {
      this.isValid = false;
      if (value.includes("?")) {
        this.isValid = true;
        this.getAnswer();
      }
    },
  },
};
</script>

<style scoped>
img,
.bg-dark {
  height: 100vh;
  left: 0px;
  max-height: 100%;
  max-width: 100%;
  position: fixed;
  top: 0px;
  width: 100vw;
}

.bg-dark {
  background-color: rgba(0, 0, 0, 0.4);
}

.indecision-container {
  position: relative;
  z-index: 99;
}

input {
  width: 400px;
  padding: 10px 15px;
  margin: 10% 0 2% 0;
  border-radius: 5px;
  border: none;
}
input:focus {
  outline: none;
}

p {
  color: white;
  font-size: 20px;
  margin-top: 0px;
}

h1,
h2 {
  color: white;
}

h2 {
  margin-top: 150px;
}
</style>
