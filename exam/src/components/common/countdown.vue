<template>
  <div>
    <div v-if="showWarning">
      <p>你已经离开了考试系统。</p>
      <p>你有 {{ timeLeft }} 秒返回系统，否则将自动提交考试。</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showWarning: false,
      timeLeft: 3, // 5分钟，单位：秒
      timer: null
    };
  },
  created() {
    this.startTimer();
    window.addEventListener('mousemove', this.resetTimer);
  },
  destroyed() {
    window.removeEventListener('mousemove', this.resetTimer);
  },
  methods: {
    startTimer() {
      this.timer = setInterval(() => {
        this.timeLeft--;
        if (this.timeLeft <= 0) {
          this.leaveExam();
        } else if (this.timeLeft <= 60) {
          this.showWarning = true;
        }
      }, 1000);
    },
    resetTimer() {
      this.showWarning = false;
      this.timeLeft = 300;
    },
    leaveExam() {
      clearInterval(this.timer);
      // 跳回原来的页面的代码
      window.location.href = "https://chat18.aichatos.xyz";
    }
  }
};
</script>
