Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212226;
	b=rUC9SQmin9gUFZjkMpuonxVaJDORhvrDsdMLc80nyxeoyvS2XYW/1dj8aDw+P8G36rFT
	 TsYxNUyt9sqCj1NprMWO/ofnxJVJmR1qdkpiPSExzha3R0et3mCBucKmSCmixZO+aM4m1
	 jzvoNOvyiqvFi1pebRNWSmCK/aatfpbdM/ragFacC+3pHsi+p7NUoUMgU0J0O2CNVmwrw
	 naQxNIFOzXxXTqk3EEYEutfti1SCrfQlpm6j00xP++s2gosnKv+906L0HUm1Bvpsp0QC1
	 8W2kANZUyYTy72RlPkdyWlin3p/t4YgUG+DhHnh7SEyyxpaiIEzHT97gLxmjBU7LBeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/eS/kYEg+SnNJxT3nwm1sLf+UOfr/jsxW42/srYOhI=;
	b=jdgyXculU88lSZ/MiwJOGs5ZgJnSQVSz7MVbeJq+ucm3ZFbuQniht11eEgy3NHs4oRXn
	 ZsKw6kFtYN/FiyhcjfnZtS0VFOiKpv1ifwS3FgrxCLSv0dPeA/oc0MsnV1RBouhd6L2mC
	 VlR7AxscYhoAmh7d+j8QWUhIyBmCS2TrSQ/05ftu/Hjl2/KTCqmv84XFFpoGBMZSDiECB
	 eARBADHx/AHq1xJHitnjAb0JgHE7FRGeMbINK0xEnGMdYjJcFceWv0WzE0/3ADohTGpaa
	 NQRBLIdl0z2qA2SRX/SHs/Mw6nD6amuDZtof7G9vgHHKzfcX4ASnsA4JZQ01d+Q1RHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTCw3ioN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C33606A69C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C33606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTCw3ioN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11518065e9.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212222; x=1795817022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/eS/kYEg+SnNJxT3nwm1sLf+UOfr/jsxW42/srYOhI=;
        b=dTCw3ioNfMlXLVP8P2olWV6HlNDISprIaF8npb7s+hpd6xVVTQAgZO87LpPXk9bVx/
         85SU8TFewOqCG2O/WV5juenQctvdej7jbBdMQeOCH1SvJ6F3r2Vqsn0JJtUgqTJNw3wy
         CyaH3TAl/tJMQRXU3u6WBZlz6Ws0lx4nJAo6EpzuIm0RKROGJQqqi65z7fF2xZIcX2Of
         ZNznhFHzvctw77RQkSaSuyR5Bd3/WQcestfO6pbU+wpO6ExxU2sLqphn71sDevSwSWfo
         lM2NkNMPY/K0q/HA823ym59LFcVpT/j4DNy4cRq8fzvzYYOtLbfoH3+OK83Ki2xG9dlX
         uwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212222; x=1795817022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/eS/kYEg+SnNJxT3nwm1sLf+UOfr/jsxW42/srYOhI=;
        b=1o934qdb4+qQEjKgsCu0BTHVv2oH/Le89set4nadiQ27WTAcDF+bC6+zU4jGKQuk92
         3GXS5cxD5VPs6KxItiozrdsGZPfdY24fbv782QYOnrxsTrj9F2kR6F7RLxsf+t+Noe9u
         RoWH89N7cqX9FIe5JqsMCCbC/eJLS+zsfdDj5BO4XkYeAqv0iny9WceIWfleIYVUG/j8
         9YdQmhFpVmyRJMsj+wNBoW4sFOkZ+7Hk0z9gfZ7VF9igcXX7iVa1No0VYLbuiJNxFH0R
         eDR3nN0jhfhUN19YuK9N+ApoRr6DXmmb4SVTSowLd0lfSkFKez/WqC2tcHqrc8MTfBMg
         Ypyw==
X-Forwarded-Encrypted: i=1; AL+hErHw8xywjpkbvtaN4dJHJKovLblS2Hy6R2Doxtv0Z+vUSndqGdcg4gVvjFrAEU144P2zm6tE7TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wj6SNzCZrlDAqSohDbrhjdY7MvNveWh1D9WJ9BxNTzR9FlCud
	3TUMieo8FZrjDjKHtAIBx5Wk8yertSKHCxYR+C90PXow7dGQ5uLxCAfj
X-Gm-Gg: AYBFou3wcYHyyA66nLpGhZzrOel8twcTer2L/wVFKVxq/v8aLUoMDXD0o2JbNPBJjyC
	csbPmzB/cjYZzC6fYT8w6winTmnu1NxH+F9l7IE3aF0/ru6SIUHjvmL+U77JdDl9WL5w0jfxPE4
	NTZYxUOWhhMkiJFR4gtO4EukCAUJzl2Qj4P3EPtljPRREuPsoEBBZZp6oZiMjv8z4EBV/RuHk+j
	q4d7aIfBEx9XTFlMjmBy9R7L06TCJLS5eKbpWWIu0ui6P0Zddx35BrPjEUpt+lPQOJBBjgxWF4A
	O/ZiZPsLzGsPjWJiMfw+l7BqjDdS7+NJMtNijhg++7uoAFQL6+LUmd5TUbfHvfnZCGgk6CmdYWv
	jfPBTlcEzHQ1VorIl/AeKXnaGxvPu6xI2dYhSWWHsiDIAhrpKyCmSJx/d7MURdHinXawrfZ4OOy
	7NlScsGdgu7INDv8C73sf2XOI0kLr6Pk4Sahyb0oVez7k3MWJLN2xSP8WAJ6WP8FPmGJukdvA+A
	kQLjWuPGv+6No/+NCzlfEpRvy/C0CRBY9h/YnJ/ut4aeK6j+K6wrwl0y+kBOgcHmnarOO0F1ubR
	ICMGOBJ31zFy0xV4hcWvn6c+z4Q69u/v4JvWDtzCeBk6f4zOK7alJX6QnB9iDis=
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr104087575e9.6.1795212221505;
        Fri, 20 Nov 2026 14:03:41 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:40 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
Date: Fri, 20 Nov 2026 23:03:24 +0100
Message-ID: <20261120220330.1067165-3-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120220330.1067165-1-demyansh@gmail.com>
References: <20261120220330.1067165-1-demyansh@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit tests for csum_partial_copy_nocheck() covering 0..64B
exhaustive alignments, threshold and MTU/page lengths up to 4352B,
carry-stressing patterns, vmalloc() guard pages and dst canaries,
zero-length calls, and task/softirq/hardirq execution.

Checksums are verified against a standalone C reference and
csum_partial(), canonicalizing 0xffff (-0) to 0x0000 (+0) per RFC 1071.
Also add an optional throughput benchmark gated behind
CONFIG_CHECKSUM_KUNIT_BENCHMARK (default n).

Signed-off-by: Demian Shulhan <demyansh@gmail.com>
---
 lib/Kconfig.debug          |  10 +
 lib/tests/checksum_kunit.c | 453 +++++++++++++++++++++++++++++++++++++
 2 files changed, 463 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..588343ced260 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2770,6 +2770,16 @@ config CHECKSUM_KUNIT
 
 	  If unsure, say N.
 
+config CHECKSUM_KUNIT_BENCHMARK
+	bool "Benchmark for the checksum functions"
+	depends on CHECKSUM_KUNIT
+	help
+	  Include a benchmark of csum_partial_copy_nocheck() against
+	  memcpy() followed by csum_partial() in the checksum KUnit test
+	  suite, for a range of buffer lengths and misalignments. The
+	  throughput of both is logged as test output. Only meaningful on
+	  real hardware and is not intended for production builds.
+
 config UTIL_MACROS_KUNIT
 	tristate "KUnit test util_macros.h functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/checksum_kunit.c b/lib/tests/checksum_kunit.c
index be04aa42125c..ac4be0a27c7d 100644
--- a/lib/tests/checksum_kunit.c
+++ b/lib/tests/checksum_kunit.c
@@ -3,8 +3,15 @@
  * Test cases csum_partial, csum_fold, ip_fast_csum, csum_ipv6_magic
  */
 
+#include <kunit/run-in-irq-context.h>
 #include <kunit/test.h>
+#include <linux/math64.h>
+#include <linux/prandom.h>
+#include <linux/preempt.h>
+#include <linux/string.h>
+#include <linux/vmalloc.h>
 #include <asm/checksum.h>
+#include <net/checksum.h>
 #include <net/ip6_checksum.h>
 
 #define MAX_LEN 512
@@ -619,18 +626,464 @@ static void test_csum_ipv6_magic(struct kunit *test)
 	}
 }
 
+/*
+ * csum_partial_copy_nocheck() tests: verify copied bytes, folded checksum
+ * against a standalone reference and csum_partial(), canary/guard-page
+ * bounds, and concurrent task/softirq/hardirq execution.
+ */
+#define COPY_MAX_OFF 16
+#define COPY_MAX_LEN 4352
+#define COPY_BENCH_MAX_LEN 16384
+#define COPY_GUARD 128 /* canary span on each side of dst */
+#define COPY_CANARY 0xa5
+#define COPY_SEED 0x5eed
+
+static struct rnd_state copy_rng;
+/* vmalloc()ed with a page-aligned length, so each is followed by a guard page */
+static u8 *copy_src_area;
+static u8 *copy_dst_area;
+static u8 *copy_shadow; /* expected contents of copy_src_area */
+static size_t copy_area_len;
+
+static int checksum_suite_init(struct kunit_suite *suite)
+{
+	copy_area_len = round_up(COPY_BENCH_MAX_LEN + COPY_MAX_OFF, PAGE_SIZE);
+	copy_src_area = vmalloc(copy_area_len);
+	copy_dst_area = vmalloc(copy_area_len);
+	copy_shadow = vmalloc(copy_area_len);
+	if (!copy_src_area || !copy_dst_area || !copy_shadow) {
+		vfree(copy_src_area);
+		vfree(copy_dst_area);
+		vfree(copy_shadow);
+		copy_src_area = NULL;
+		copy_dst_area = NULL;
+		copy_shadow = NULL;
+		return -ENOMEM;
+	}
+	prandom_seed_state(&copy_rng, COPY_SEED);
+	return 0;
+}
+
+static void checksum_suite_exit(struct kunit_suite *suite)
+{
+	vfree(copy_src_area);
+	vfree(copy_dst_area);
+	vfree(copy_shadow);
+	copy_src_area = NULL;
+	copy_dst_area = NULL;
+	copy_shadow = NULL;
+}
+
+static void copy_fill_random(void)
+{
+	prandom_bytes_state(&copy_rng, copy_src_area, copy_area_len);
+	memcpy(copy_shadow, copy_src_area, copy_area_len);
+}
+
+static void copy_fill_bytes(const u8 *pattern, int pattern_len)
+{
+	size_t i;
+
+	for (i = 0; i < copy_area_len; i++)
+		copy_src_area[i] = pattern[i % pattern_len];
+	memcpy(copy_shadow, copy_src_area, copy_area_len);
+}
+
+/* Place @len bytes at misalignment @off as close as possible to the guard page. */
+static u8 *copy_place_at_end(u8 *area, int off, int len)
+{
+	u8 *end = area + copy_area_len;
+	int pad;
+
+	/*
+	 * UML lacks EX_TYPE_ZEROPAD fixup on vmalloc guard pages in x86
+	 * csum_partial(), and RISC-V do_csum_no_alignment() over-reads up to
+	 * sizeof(unsigned long) - 1 bytes past the buffer end.
+	 */
+	if (IS_ENABLED(CONFIG_UML) || IS_ENABLED(CONFIG_RISCV))
+		end -= sizeof(unsigned long);
+
+	pad = ((unsigned long)(end - len) - off) & (COPY_MAX_OFF - 1);
+	return end - len - pad;
+}
+
+/* Naive reference: folded ones' complement sum, same semantics as csum_fold(). */
+static u16 ref_csum_fold(const u8 *buf, int len)
+{
+	u64 sum = 0;
+	u16 word;
+	int i;
+
+	for (i = 0; i + 1 < len; i += 2) {
+		memcpy(&word, buf + i, sizeof(word)); /* native endian */
+		sum += word;
+	}
+	if (len & 1) {
+		u8 pad[2] = { buf[len - 1], 0 };
+
+		memcpy(&word, pad, sizeof(word)); /* LE: low byte, BE: high byte */
+		sum += word;
+	}
+	while (sum >> 16)
+		sum = (sum & 0xffff) + (sum >> 16);
+
+	sum = ~sum & 0xffff;
+	return sum == 0xffff ? 0 : sum;
+}
+
+/*
+ * RFC 1071: 0xffff (-0) and 0x0000 (+0) are equivalent. Canonicalize to 0 so
+ * ~0U-seeded archs (e.g. x86_64) match 0-seeded refs on zero/all-zero inputs.
+ */
+static u16 fold_csum(__wsum csum)
+{
+	u16 sum = (__force u16)csum_fold(csum);
+
+	return sum == 0xffff ? 0 : sum;
+}
+
+static int first_non_canary(const u8 *p, int n)
+{
+	int i;
+
+	for (i = 0; i < n; i++)
+		if (p[i] != COPY_CANARY)
+			return i;
+	return -1;
+}
+
+/* Verify one csum_partial_copy_nocheck() call with @before/@after canaries. */
+static void check_csum_copy_at(struct kunit *test, const u8 *src, u8 *dst,
+			       int len, int before, int after)
+{
+	unsigned long src_off = (unsigned long)src & (COPY_MAX_OFF - 1);
+	unsigned long dst_off = (unsigned long)dst & (COPY_MAX_OFF - 1);
+	const u8 *lo, *hi;
+	u16 expect, got;
+	int bad;
+
+	memset(dst - before, COPY_CANARY, before + len + after);
+	expect = ref_csum_fold(src, len);
+
+	got = fold_csum(csum_partial_copy_nocheck(src, dst, len));
+
+	KUNIT_ASSERT_EQ_MSG(test, got, expect,
+			    "checksum mismatch src_off=%lu dst_off=%lu len=%d",
+			    src_off, dst_off, len);
+	KUNIT_ASSERT_EQ_MSG(test, memcmp(src, dst, len), 0,
+			    "copied data mismatch src_off=%lu dst_off=%lu len=%d",
+			    src_off, dst_off, len);
+
+	if (before > 0)
+		KUNIT_ASSERT_EQ_MSG(test, dst[-1], COPY_CANARY,
+				    "clobbered dst[-1] (src_off=%lu dst_off=%lu len=%d)",
+				    src_off, dst_off, len);
+	if (after > 0)
+		KUNIT_ASSERT_EQ_MSG(test, dst[len], COPY_CANARY,
+				    "clobbered dst[len] (src_off=%lu dst_off=%lu len=%d)",
+				    src_off, dst_off, len);
+
+	bad = first_non_canary(dst - before, before);
+	KUNIT_ASSERT_EQ_MSG(test, bad, -1,
+			    "wrote %d bytes before dst (src_off=%lu dst_off=%lu len=%d)",
+			    before - bad, src_off, dst_off, len);
+
+	bad = first_non_canary(dst + len, after);
+	KUNIT_ASSERT_EQ_MSG(test, bad, -1,
+			    "wrote at dst+len+%d (src_off=%lu dst_off=%lu len=%d)",
+			    bad, src_off, dst_off, len);
+
+	/* Source untouched, including a margin on either side. */
+	lo = max(src - COPY_GUARD, (const u8 *)copy_src_area);
+	hi = min(src + len + COPY_GUARD, (const u8 *)copy_src_area + copy_area_len);
+	KUNIT_ASSERT_EQ_MSG(test,
+			    memcmp(lo, copy_shadow + (lo - copy_src_area), hi - lo), 0,
+			    "source buffer modified (src_off=%lu dst_off=%lu len=%d)",
+			    src_off, dst_off, len);
+
+	/* Must be interchangeable with the arch csum_partial() semantics. */
+	KUNIT_ASSERT_EQ_MSG(test, got,
+			    fold_csum(csum_partial(src, len, 0)),
+			    "disagrees with csum_partial() src_off=%lu dst_off=%lu len=%d",
+			    src_off, dst_off, len);
+}
+
+/* Source against its guard page, destination between canaries. */
+static void check_csum_copy(struct kunit *test, int src_off, int dst_off,
+			    int len)
+{
+	KUNIT_ASSERT_TRUE(test, src_off >= 0 && src_off < COPY_MAX_OFF);
+	KUNIT_ASSERT_TRUE(test, dst_off >= 0 && dst_off < COPY_MAX_OFF);
+	KUNIT_ASSERT_TRUE(test, len >= 0 && len <= COPY_MAX_LEN);
+
+	check_csum_copy_at(test, copy_place_at_end(copy_src_area, src_off, len),
+			   copy_dst_area + COPY_GUARD + dst_off, len,
+			   COPY_GUARD, COPY_GUARD);
+}
+
+/* Representative source offsets used with all 16 destination offsets. */
+static const int copy_src_offs[] = { 0, 1, 3, 8, 15 };
+
+/* Every len 0..64 with every src/dst misalignment: the scalar tail ladder. */
+static void test_csum_copy_small_all_alignments(struct kunit *test)
+{
+	int len, src_off, dst_off;
+
+	copy_fill_random();
+	for (len = 0; len <= 64; len++)
+		for (src_off = 0; src_off < COPY_MAX_OFF; src_off++)
+			for (dst_off = 0; dst_off < COPY_MAX_OFF; dst_off++)
+				check_csum_copy(test, src_off, dst_off, len);
+}
+
+/* Threshold boundaries & large unaligned buffers across [0..15]x[0..7] and [0..15]. */
+static void test_csum_copy_large_unaligned(struct kunit *test)
+{
+	static const int threshold_lens[] = {
+		48, 63, 64, 65, 71, 72, 73, 79, 80, 96, 127, 128,
+		255, 256, 257, 271, 272, 273,
+		1368, 1448, 1500, 4096,
+	};
+	static const int extra_lens[] = {
+		1368, 1448, 1500, 2033, 2034, 2035, 2039, 2040, 2041, 2047,
+		2048, 2049, 2055, 2056, 2057, 2062, 2063, 3072, 4095, 4096,
+		4097, 4352,
+	};
+	int len, i, j, src_off, dst_off;
+
+	copy_fill_random();
+	for (j = 0; j < ARRAY_SIZE(threshold_lens); j++)
+		for (src_off = 0; src_off < COPY_MAX_OFF; src_off++)
+			for (dst_off = 0; dst_off < 8; dst_off++)
+				check_csum_copy(test, src_off, dst_off,
+						threshold_lens[j]);
+
+	for (len = 1024; len < 1024 + 80; len++)
+		for (i = 0; i < ARRAY_SIZE(copy_src_offs); i++)
+			for (dst_off = 0; dst_off < COPY_MAX_OFF; dst_off++)
+				check_csum_copy(test, copy_src_offs[i], dst_off,
+						len);
+
+	for (j = 0; j < ARRAY_SIZE(extra_lens); j++)
+		for (i = 0; i < ARRAY_SIZE(copy_src_offs); i++)
+			for (dst_off = 0; dst_off < COPY_MAX_OFF; dst_off++)
+				check_csum_copy(test, copy_src_offs[i], dst_off,
+						extra_lens[j]);
+}
+
+/* Patterns stressing carries, zero/MSB bytes, and odd-offset byte order. */
+static void test_csum_copy_patterns(struct kunit *test)
+{
+	static const u8 pat_ff[] = { 0xff };
+	static const u8 pat_00[] = { 0x00 };
+	static const u8 pat_80[] = { 0x80 };
+	static const u8 pat_ff00[] = { 0xff, 0x00 };
+	static const u8 pat_ramp[] = { 0x01, 0x02, 0x04, 0x08,
+				       0x10, 0x20, 0x40, 0x80 };
+	static const struct {
+		const u8 *pat;
+		int len;
+	} patterns[] = {
+		{ pat_ff, ARRAY_SIZE(pat_ff) },
+		{ pat_00, ARRAY_SIZE(pat_00) },
+		{ pat_80, ARRAY_SIZE(pat_80) },
+		{ pat_ff00, ARRAY_SIZE(pat_ff00) },
+		{ pat_ramp, ARRAY_SIZE(pat_ramp) },
+		{ NULL, 0 }, /* random */
+	};
+	static const int lens[] = {
+		1, 2, 3, 7, 8, 15, 16, 17, 31, 32, 33, 63, 64, 65, 127, 128,
+		255, 256, 511, 512, 1023, 1024, 1025, 1368, 1448, 1500, 2048,
+		4095, 4096, 4352,
+	};
+	static const int offs[][2] = {
+		{ 0, 0 }, { 1, 0 }, { 0, 1 }, { 1, 1 }, { 3, 7 }, { 7, 3 },
+		{ 9, 5 }, { 15, 15 },
+	};
+	int p, l, o;
+
+	for (p = 0; p < ARRAY_SIZE(patterns); p++) {
+		if (patterns[p].pat)
+			copy_fill_bytes(patterns[p].pat, patterns[p].len);
+		else
+			copy_fill_random();
+
+		for (l = 0; l < ARRAY_SIZE(lens); l++)
+			for (o = 0; o < ARRAY_SIZE(offs); o++)
+				check_csum_copy(test, offs[o][0], offs[o][1],
+						lens[l]);
+	}
+}
+
+/* Place dst against its trailing guard page so any over-write faults. */
+static void test_csum_copy_dst_guard_page(struct kunit *test)
+{
+	static const int lens[] = {
+		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
+		31, 32, 33, 63, 64, 65, 71, 72, 73, 79, 80, 81, 96, 127, 128,
+		129, 255, 256, 257, 271, 272, 273, 1023, 1024, 1025, 1368,
+		1448, 1500, 2048, 4095, 4096, 4097,
+	};
+	int l, src_off, dst_off;
+
+	copy_fill_random();
+	for (l = 0; l < ARRAY_SIZE(lens); l++)
+		for (dst_off = 0; dst_off < COPY_MAX_OFF; dst_off++) {
+			u8 *dst = copy_place_at_end(copy_dst_area, dst_off, lens[l]);
+			int after = copy_dst_area + copy_area_len - (dst + lens[l]);
+
+			src_off = (dst_off * 7 + lens[l]) & (COPY_MAX_OFF - 1);
+			check_csum_copy_at(test,
+					   copy_place_at_end(copy_src_area,
+							     src_off, lens[l]),
+					   dst, lens[l], COPY_GUARD, after);
+		}
+}
+
+/* len == 0: fold to 0 and never touch src or dst, even against guard pages. */
+static void test_csum_copy_zero_len(struct kunit *test)
+{
+	u8 *unmapped_end = copy_src_area + copy_area_len;
+	u8 *dst = copy_dst_area + COPY_GUARD;
+	__wsum sum;
+
+	copy_fill_random();
+	memset(copy_dst_area, COPY_CANARY, 2 * COPY_GUARD);
+	sum = csum_partial_copy_nocheck(unmapped_end, dst, 0);
+	KUNIT_EXPECT_EQ(test, fold_csum(sum), 0);
+	KUNIT_EXPECT_EQ(test, first_non_canary(copy_dst_area, 2 * COPY_GUARD), -1);
+}
+
+/* Concurrent execution across task, softirq, and hardirq contexts. */
+#define COPY_IRQ_NUM_MSGS 3
+#define COPY_IRQ_NUM_CTX 3 /* task, softirq, hardirq */
+
+static const int copy_irq_lens[COPY_IRQ_NUM_MSGS] = { 100, 1500, 4097 };
+
+struct copy_irq_test_state {
+	const u8 *src[COPY_IRQ_NUM_MSGS];
+	u16 expected[COPY_IRQ_NUM_MSGS];
+	u8 *dst[COPY_IRQ_NUM_CTX];
+	atomic_t seqno;
+};
+
+static bool copy_irq_test_func(void *state_)
+{
+	struct copy_irq_test_state *state = state_;
+	u32 i = (u32)atomic_inc_return(&state->seqno) % COPY_IRQ_NUM_MSGS;
+	int ctx = in_hardirq() ? 2 : in_serving_softirq() ? 1 : 0;
+	const u8 *src = state->src[i];
+	u8 *dst = state->dst[ctx];
+	int len = copy_irq_lens[i];
+	u16 got;
+
+	got = fold_csum(csum_partial_copy_nocheck(src, dst, len));
+	return got == state->expected[i] && memcmp(src, dst, len) == 0;
+}
+
+static void test_csum_copy_interrupt_context(struct kunit *test)
+{
+	struct copy_irq_test_state state = { };
+	int i;
+
+	copy_fill_random();
+	for (i = 0; i < COPY_IRQ_NUM_MSGS; i++) {
+		/* Distinct, misaligned messages. */
+		state.src[i] = copy_src_area + i * (COPY_MAX_LEN + 64) + 2 * i + 1;
+		state.expected[i] = ref_csum_fold(state.src[i], copy_irq_lens[i]);
+	}
+	for (i = 0; i < COPY_IRQ_NUM_CTX; i++)
+		state.dst[i] = copy_dst_area + i * (COPY_MAX_LEN + 64) + 2 * i + 1;
+
+	kunit_run_irq_test(test, copy_irq_test_func, 100000, &state);
+}
+
+/* Optional throughput benchmark vs memcpy() + csum_partial(). */
+static void test_csum_copy_benchmark(struct kunit *test)
+{
+	static const int lens[] = {
+		16, 40, 64, 128, 256, 512, 1000, 1024, 1368, 1448, 1500,
+		2048, 4096, 16384,
+	};
+	static const int offs[][2] = { { 0, 0 }, { 1, 3 } };
+	int l, o, i, len, num_iters;
+	u64 t, t_fused, t_split;
+	u32 acc = 0; /* keeps every call alive via OPTIMIZER_HIDE_VAR() */
+
+	if (!IS_ENABLED(CONFIG_CHECKSUM_KUNIT_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	copy_fill_random();
+
+	/* warm-up */
+	for (i = 0; i < 10000000; i += COPY_BENCH_MAX_LEN)
+		acc ^= (__force u32)csum_partial_copy_nocheck(copy_src_area,
+							      copy_dst_area,
+							      COPY_BENCH_MAX_LEN);
+	OPTIMIZER_HIDE_VAR(acc);
+
+	for (o = 0; o < ARRAY_SIZE(offs); o++) {
+		const u8 *src = copy_src_area + offs[o][0];
+		u8 *dst = copy_dst_area + offs[o][1];
+
+		for (l = 0; l < ARRAY_SIZE(lens); l++) {
+			len = lens[l];
+			num_iters = 10000000 / (len + 128);
+
+			preempt_disable();
+			t = ktime_get_ns();
+			for (i = 0; i < num_iters; i++)
+				acc ^= (__force u32)csum_partial_copy_nocheck(src, dst, len);
+			t_fused = ktime_get_ns() - t;
+			OPTIMIZER_HIDE_VAR(acc);
+
+			t = ktime_get_ns();
+			for (i = 0; i < num_iters; i++) {
+				memcpy(dst, src, len);
+				acc ^= (__force u32)csum_partial(dst, len, 0);
+			}
+			t_split = ktime_get_ns() - t;
+			OPTIMIZER_HIDE_VAR(acc);
+			preempt_enable();
+
+			kunit_info(test,
+				   "src+%d dst+%d len=%5d: csum_partial_copy_nocheck %6llu MB/s, memcpy+csum_partial %6llu MB/s\n",
+				   offs[o][0], offs[o][1], len,
+				   div64_u64((u64)len * num_iters * 1000,
+					     max_t(u64, t_fused, 1)),
+				   div64_u64((u64)len * num_iters * 1000,
+					     max_t(u64, t_split, 1)));
+		}
+	}
+	{
+		u32 ref_acc = acc;
+
+		OPTIMIZER_HIDE_VAR(acc);
+		KUNIT_ASSERT_EQ(test, acc, ref_acc);
+	}
+}
+
 static struct kunit_case __refdata checksum_test_cases[] = {
 	KUNIT_CASE(test_csum_fixed_random_inputs),
 	KUNIT_CASE(test_csum_all_carry_inputs),
 	KUNIT_CASE(test_csum_no_carry_inputs),
 	KUNIT_CASE(test_ip_fast_csum),
 	KUNIT_CASE(test_csum_ipv6_magic),
+	KUNIT_CASE(test_csum_copy_small_all_alignments),
+	KUNIT_CASE(test_csum_copy_large_unaligned),
+	KUNIT_CASE(test_csum_copy_patterns),
+	KUNIT_CASE(test_csum_copy_dst_guard_page),
+	KUNIT_CASE(test_csum_copy_zero_len),
+	KUNIT_CASE(test_csum_copy_interrupt_context),
+	KUNIT_CASE(test_csum_copy_benchmark),
 	{}
 };
 
 static struct kunit_suite checksum_test_suite = {
 	.name = "checksum",
 	.test_cases = checksum_test_cases,
+	.suite_init = checksum_suite_init,
+	.suite_exit = checksum_suite_exit,
 };
 
 kunit_test_suites(&checksum_test_suite);
-- 
2.53.0

