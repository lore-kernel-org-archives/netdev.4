Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853256;
	b=DOVGRvtvYz7gDPuVQukc/6E3fD+7QC1pL7J4l/QZwW2NgLdoI+Un7rI2hsRjMMQ4AT2r
	 AuRjFCnPB2lCwktQ+weQLpDgf1fPDsaULuO6WTJCsHWdYtbgNkGIqHggWdvYDbCtZ1QSU
	 lyaVDXKF/vG3w0S8tFEn3uA4BpFwI+sY6c5vZbLDb5bGMpC31GPzSfbgk2PPOUVsBEZa1
	 OELZj6BEBbgxOrPlqf5kvbdWZFAA/qxi42rmGdpp1bwudw77G5GFWOmzlRD9SbPUhisyI
	 4i70UdRoUgHEHHannHoDrSmQlhLGNA/a/toBjFtqNdqdGwGUU/BbSXLk43zYM9vrtBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
	b=EvCyjtz9SuuRJa/DIOwy+A00WkX4QktpC9UdF6LzYlX4valsPSR2NfQ0xW7ejynXW1A+
	 ph8oEBcetjlop404VfSSjhjSaejIfYBTV4BGKqjlLqqX2BY7zp/87L07XvNl60sPvtGKd
	 2qaYwS4Y80lcU3/DG3jKHo0znHwFDk3lbE8JhwXfQAQSIujHW3/hLXcd+nVBBdLcsWSw4
	 gRVsyOSRsJit3nPq3/Uz1uqb3/YsB4Dm2NMIlcw13gdm8x/ITPUHMeNcW7/Bvsx7LZJoT
	 OZv4DQ1Jt8XpJrPLXmsobrPElSkob6XBlCJQ/bxTZnLW/r62g8zXCyNMWe5nD/AcCnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZcOKoPd;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF73606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF73606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZcOKoPd
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3734941a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853255; x=1795458055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
        b=FZcOKoPdyh8jxOWwm3uzwkTqwjC+TAiZxkllwC2MJHka0GAWrgen4iEh4GgO+1671L
         p1L9sTf2+G6FEON6rfCJb3I8vs/0tYI1Ncb2weKHNOatzj88aUp5I//LV3zipxhWTMuj
         wLcGKa+sTCvppwq/CyxjGFdYqRgmkIAHwmx3Qz76wXrKibZ6VUwZ+qhnLe6DgIVY8r9v
         sYvAo3ORvnPKC1VnYIFsjFzOqgIkoAIFIZN3zCP8YfNBEtwfFxjCEw/tiC49VuW3hLpZ
         PRqMNqOI1deRKYqzGEtxG7qxPW09xOxey5xBQESHYhzxf6zTcfPlfGRLguwgnXmqLg/5
         H9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853255; x=1795458055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
        b=lR+FWu1CugMWyjs2heDSUlNt+j0oZ/Fph2Lz49SRUwSx4qlIC8Zn1lIoTUUIduRwJB
         Ud++Tna3lpWIwAHCC0ulbzK8PHqqs2TkBW0g94lNnOxdsH7g6uATG7fTbvk81QS1E4la
         dDXI/zIvY7gtPjHlozOpaecp5C+sAMSYIO3VEN2nBIxsFGULvI2vSisQ1LVjorFhszr5
         xb1FRJ/6OOlSljxSYpETIjK7n2WH3jjm47NIBh/k1HXKxcJxRxGWJWvE+QvSiSizkkY0
         ZqbFGQShkX2yKhTkAG9QYiXO2lYvbj+A54y4Sdx+5FAxW3yKzAn6QrWItRD2Xdm7ac45
         or6A==
X-Gm-Message-State: APuU4Z9VODZiqvZv0Hn3Z/MMu4FLJcfUR76Y43Zi4xUve57Qm4g/A0Jl
	kVOcmmY/BErmUacwAayzhAcbYpop+qF40AyaYGdpua+vnz81Cm84kcFVprmRbSim
X-Gm-Gg: AZFdTZcKUp7fgrr/AvHnUat3extmO4X+Qyno0GFfhtDSX1dNJMBXp5q4A4eIh/eyHpw
	vOip2v9l9WZOGplcMvkMjNDbcimpIhACtT6P+Sf5bUnQcDssxDtWmIoGdsx8hUJ/euTKGMPpfXe
	dpQwxlf6MYM57mEsgIGZ1V74ndy2VXZdmYwhsw2k/Zj1kNrFdsnVbJl+sEyi86mO65+F51Tmxlt
	t3Yt1R2E0HfarX4vdRtUhFueCNNSK57O6o2b++4py5nhrXprlexVeti8f8gGmzDGGXfClvZj72X
	1RmQzl575h5qpYsBH12gWoO/JO19beTSh+MWpvtoMytduO3Ujqf17FSSLOReczI5ffORigzEioc
	naMSjq2clgA0LBITmGS7hGFPGCihUUX1MaYUd+v7lHa5Tj4GdJZyJg1kHyz6KF1F/pA3C0dRHX8
	/vuoJ6RX1gu4UTW61T5UVrC0kOrzpdM6aQycbMZBmv9nJPaHq8xejSoj/1lujDW1OHSvLfE95DT
	A0b0y4j7gtnYmkXUA/g84nsG0FUCbfw5GTgBTG/+s5Xj49rOWAN31poGf0jfQ2Kq/b8HLTtxsu7
	z+LKg0bsAD7rfJGnF3PYUGKx7An6BVce6aYJ59jT3XDjMDN5yZd+XnLZB0M1wzGuckHJbPRM2Pj
	ZDLNDL24SPVdXwMPtz9alEo4uRfWqYhI6CYOXQ62fT78ZnBJhwQ8fC8LJSQ==
X-Received: by 2002:a17:90b:2f08:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b1b0a3c10cmr10695106a91.45.1794853255277;
        Mon, 16 Nov 2026 10:20:55 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac29a846sm304780a91.9.2026.11.16.10.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:54 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com
Subject: [PATCH net-next v3 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Mon, 16 Nov 2026 10:20:51 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
References: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
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

Exercise the driver's private register accessors with memory-backed
registers instead of physical hardware. Cover native byte/halfword and
forced 32-bit accesses in both register byte orders, across 22 register
offsets. Check payload truncation, high-bit values and neighboring
sentinels. These tests do not validate physical bus transaction widths
or hardware interrupt behavior.

An allocated RAM address is not a portable I/O cookie. Limit the test
to the direct x86-64 MMIO implementation, which uses ordinary memory
loads and stores at these addresses. Exclude UML (which can also set
X86_64) and indirect I/O. KUNIT_ALL_TESTS cannot enable the suite on
other architectures. This restriction does not apply to the driver.

Include the tests in the driver translation unit so no accessors need
to become exported interfaces. Require built-in KUnit to avoid a
built-in driver depending on a modular test framework. The tests follow
the driver into either its built-in image or module.

The four parameterized cases passed in an isolated x86-64 QEMU boot
with networking disabled and no physical-device passthrough.

Tool-origin disclosure, as required by generated-content.rst: Codex was
used to implement this test suite, run the KUnit build/boot and draft
this changelog, in response to a request for upstream-quality testing.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 MAINTAINERS                               |  1 +
 drivers/i2c/busses/Kconfig                | 15 ++++
 drivers/i2c/busses/i2c-xiic.c             |  4 +
 drivers/i2c/busses/tests/i2c_xiic_kunit.c | 91 +++++++++++++++++++++++
 4 files changed, 111 insertions(+)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c..4588569e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4018,6 +4018,7 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/edac/synopsys_edac.c
 F:	drivers/i2c/busses/i2c-cadence.c
 F:	drivers/i2c/busses/i2c-xiic.c
+F:	drivers/i2c/busses/tests/i2c_xiic_kunit.c
 F:	drivers/mmc/host/sdhci-of-arasan.c
 N:	zynq
 N:	xilinx
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 275aaa7f3..0a7a2aeb7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1322,6 +1322,21 @@ config I2C_XILINX
 	  This driver can also be built as a module.  If so, the module
 	  will be called xilinx_i2c.
 
+config I2C_XILINX_KUNIT_TEST
+	bool "KUnit tests for Xilinx I2C register accesses" if !KUNIT_ALL_TESTS
+	depends on I2C_XILINX && KUNIT=y
+	depends on X86_64 && !UML && !INDIRECT_IOMEM
+	default KUNIT_ALL_TESTS
+	help
+	  Test the Xilinx I2C driver's register accessors with both byte orders
+	  and with native-width or forced 32-bit accesses. The tests use
+	  allocated RAM in place of registers. This relies on the direct
+	  x86-64 MMIO accessor implementation; no controller is required.
+
+	  The tests are compiled into the driver to exercise its private
+	  accessors, and follow the driver's built-in or module configuration.
+	  If unsure, say N.
+
 config I2C_XLP9XX
 	tristate "Cavium ThunderX2 I2C support"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index edb5e271c..7e2ed61c6 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1650,3 +1650,7 @@ MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
+
+#if IS_ENABLED(CONFIG_I2C_XILINX_KUNIT_TEST)
+#include "tests/i2c_xiic_kunit.c"
+#endif
diff --git a/drivers/i2c/busses/tests/i2c_xiic_kunit.c b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
new file mode 100644
index 000000000..1b691de7e
--- /dev/null
+++ b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Included by i2c-xiic.c to exercise the driver's private accessors. */
+#include <kunit/test.h>
+
+struct xiic_access_param {
+	const char *name;
+	enum xiic_endian endianness;
+	bool force_32bit_access;
+};
+
+static const struct xiic_access_param xiic_access_params[] = {
+	{ "native_little_endian", LITTLE, false },
+	{ "native_big_endian", BIG, false },
+	{ "word_little_endian", LITTLE, true },
+	{ "word_big_endian", BIG, true },
+};
+
+KUNIT_ARRAY_PARAM_DESC(xiic_access, xiic_access_params, name);
+
+static void xiic_register_access(struct kunit *test)
+{
+	static const int offsets[] = {
+		XIIC_DGIER_OFFSET, XIIC_IISR_OFFSET, XIIC_IIER_OFFSET,
+		XIIC_RESETR_OFFSET, XIIC_CR_REG_OFFSET, XIIC_SR_REG_OFFSET,
+		XIIC_DTR_REG_OFFSET, XIIC_DRR_REG_OFFSET, XIIC_ADR_REG_OFFSET,
+		XIIC_TFO_REG_OFFSET, XIIC_RFO_REG_OFFSET, XIIC_TBA_REG_OFFSET,
+		XIIC_RFD_REG_OFFSET, XIIC_GPO_REG_OFFSET,
+		XIIC_TSUSTA_REG_OFFSET, XIIC_TSUSTO_REG_OFFSET,
+		XIIC_THDSTA_REG_OFFSET,
+		XIIC_TSUDAT_REG_OFFSET, XIIC_TBUF_REG_OFFSET,
+		XIIC_THIGH_REG_OFFSET, XIIC_TLOW_REG_OFFSET,
+		XIIC_THDDAT_REG_OFFSET,
+	};
+	const struct xiic_access_param *param = test->param_value;
+	struct xiic_i2c *i2c;
+	u32 expected;
+	u8 *mem;
+	size_t i;
+	int reg;
+
+	i2c = kunit_kzalloc(test, sizeof(*i2c), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, i2c);
+	mem = kunit_kmalloc(test, 0x200, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mem);
+	/* Only built for direct x86-64 MMIO, which accepts this RAM address. */
+	i2c->base = (void __force __iomem *)(mem + sizeof(u32));
+	i2c->endianness = param->endianness;
+	i2c->force_32bit_access = param->force_32bit_access;
+
+	for (i = 0; i < ARRAY_SIZE(offsets); i++) {
+		reg = offsets[i];
+		memset(mem, 0xa5, 0x200);
+
+		xiic_setreg8(i2c, reg, 0xc0);
+		expected = param->force_32bit_access ? 0xc0 : 0xa5a5a5c0;
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), expected);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xc0);
+
+		xiic_setreg16(i2c, reg, 0x03ff);
+		expected = param->force_32bit_access ? 0x03ff : 0xa5a503ff;
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), expected);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xff);
+
+		xiic_setreg32(i2c, reg, 0x12345678);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg),
+				0x12345678U);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0x78);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32)],
+				(u8)(param->endianness == BIG ? 0x12 : 0x78));
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) + 3],
+				(u8)(param->endianness == BIG ? 0x78 : 0x12));
+		xiic_setreg32(i2c, reg, 0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg),
+				0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xef);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) - 1], (u8)0xa5);
+		KUNIT_EXPECT_EQ(test, mem[reg + 2 * sizeof(u32)], (u8)0xa5);
+	}
+}
+
+static struct kunit_case xiic_access_test_cases[] = {
+	KUNIT_CASE_PARAM(xiic_register_access, xiic_access_gen_params),
+	{}
+};
+
+static struct kunit_suite xiic_access_test_suite = {
+	.name = "i2c_xiic",
+	.test_cases = xiic_access_test_cases,
+};
+
+kunit_test_suite(xiic_access_test_suite);
