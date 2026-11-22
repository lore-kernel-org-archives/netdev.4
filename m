Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795311537;
	b=sMjAhyNsH4fXZVqx0vjPDWBKgJF3uO22mBBeLI6cK9xlE4Pct8nbqPPPTPTB7da9LLRf
	 Hg01zbSR/UyJ7q5z6bg7AKMZhgxiBt2bCdkXjuU7AS/K66iVerIxz6hRr8mSp1nrW4xPd
	 +X3RbTbQYJT15b0VCs0Cm/jKlL+uFvJV0swbX4jYeQlRHtQxuPx/0NDQqTxeKqFPsaSG6
	 XFt9J3Ug/S4CmI6oDVI2xx2MYVdS+RuUMnOs5PJaWHFfIAQyGM4XY6N86wdMD5p8toazK
	 9Ih+kkXcYPocVp8pW4QlNgXJVsOGISI7Prl02rN02lcwauY96TgOKrv+x28PibE5sfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795311537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PrK1kSxztn5T+MuJ04ncYiEqzZVjZOIR+C9onJtmWmw=;
	b=E5+xeHf5a0Tnrq5pIwMLiJ13PttPNuIhc7PE16NJcF5WR0plRtlYBsGAtwRf72tuKQ5Z
	 FNo5PrpGLd13P1A1w+4APgL/Ouw/fqL3T9qZMj8wIiwW1+QuZULsVV2Vap8pRVMluKkmA
	 MkFYM9SjC5gx73Y7/Y01CtLq7zpSLcFGOOonZzMpTdA5SoOCQPcCr67iCRpF/MROluq3x
	 0Obug/UNypWbwu0ZO7vIZrdv1oSYCDi5mkhxcl0cygUKweu98Q/VZwajS+ny1MLmDvBBS
	 +Ok7Aqoi6QHB9/qqJ+RBmMsbGJI7K3bmhfEhJ3lCWIFrRB6Ias9QtbBD19hooXybnuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUl2yLPI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811D606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1811D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUl2yLPI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so2614380eec.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795311536; x=1795916336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrK1kSxztn5T+MuJ04ncYiEqzZVjZOIR+C9onJtmWmw=;
        b=PUl2yLPIULUEycaRT6c+ort4b1uQJfbZEunLbcd3oOdRwmTtRRMFoeEna0GkOOg+ES
         xOXnoMsHd9qWAdTcPydNIc7pkdUQu/FRSkh/gGsxcoAGa0UpPmKl1wZ630UMLfyS85MT
         9lbvChmEHtt74xYDEhqi0jQjRmG2UJ/AeYD/1i0Xuhaglysa3TsIr6OcripXlLrjgoQ8
         XVL7ScXjRfyj29OcBiKbNavTxTymUROvOq4tgn59I2EpmlcZUv/xxKiJwC441Do7MNXi
         PiA6C/DzoA6hMrYvPkMrFYtNgfvpbqMslWlGYGm07fUEltIb2XPL55vM5Mc/0HkcgC7X
         0SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795311536; x=1795916336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrK1kSxztn5T+MuJ04ncYiEqzZVjZOIR+C9onJtmWmw=;
        b=gT3hZnGFUphXTZZ8y2NWYZqqLfMgWjZw8FQ/WBIKyJ6MSYfhfMmxOHodtIx41aLgD2
         DFy3SN6UWkFJZn0jQOI0A9HlF30d98j1t7vCPsLTDEiMNMP4mqATQowCz1sXg3pr+loN
         8gPxxOLGaYgwXBgWklFAJng1Ot1c0Q2ji3KYgpCeIuH+66FO4j2LIpXMFrFO4cTh6l0o
         K+29K0krTuJPcJV0W0EKuQIbiSyOZh5U6+LOzxHW9JpUGoieT/kSRvF/FqjGZHAIZWOe
         rb3ZI4XXCXgHCVnviH6fgmwVBTZbms+kL2qSgoWW5dk8tWbmd08GXepFKwWizsIBEDug
         VyZA==
X-Forwarded-Encrypted: i=1; AL+hErGlkPxEDaKU8iWF18RoNG7hUEh1x8Q08vgLpPP7woS4WGFYnlJJTquzgEj2ZKTr864bnZ7rRBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I0pfbxD4v4UDg+J4TG6HGfAKDREameupMtkdefrMOzHGNoLQ8
	XQo0exfTCLLCyT2SbAZ0f9EbzB0X8zCQysVU17FAkLrivSpLuMDzkb+7KGtb0fx2xko=
X-Gm-Gg: AZFdTZeZZhWZQoylLTST/vYXXqfEq0HyC8GVLAEpXLQ/GWIyNwy6E3uew+1B1IV+XqS
	qCCJGHSMii2Y8J6+YriyQoSE2pQ1zGHMvwJWufiFQ/CZhLFBj6C3ZYGDf9BQ1+xyPNsDWArvTtp
	0TfIBpQIE9YHP7IX6X2j5R4O4tyYj8+qoFQGfrQSM6S9Hcp6vApdEcPSmHYtxRpgVAGeEbICx6M
	zXDrp6xLTbyhL7sMJC8wqDM/UZhNj7aC/BBA779rS+Viq228vbEb0hYUVvlptEADaE+BbP1SSB1
	6FXbEXvliXRhmoJ40TOWvD7HVnLvDbaTiFMUNKUFYKo6pxoGQKnEUIwSyNYYXqkosHvZ9IWHd/Y
	aCpGeo1wE7AuJut4LlnbVLVlyF0H6HmDVY9aMd/GkWWXsibQdx/xEQ/+OdE2lfirX8OLqDbxsq4
	Hta86DYT6iJu/vLYzwpGsuN+vn8cCkn4cbE5hdD3kSwyk2RWc5EdLIs2mdWe+B33BW9AEu2iDW6
	qWxZvmyF4i+opm5MHa2ENmWcgP5Y+MLXRXsLrh/O3Bp/5lZRzIG5R81p3rZXfWpL8mD+6N+axwE
	obTXBY0NEfQHkqf805eci6m9POEUyVat0AsQjoCPmQtpUgulZuZqB19W9zXRq0lxcEMC2+Wo8B7
	i5xgfCQPNyJVTwtoCFZxdhpxvdME7bIIp6SYpsWBYtVudNPCIR42TnF0JNW+R4fWtQNLp039GEp
	b+5zVGTNXDuj+uXLs0BF3N1YPSaiBivd9jlYj8jg69UmExThgalR9izu+E7UibN78eBCnd79cLv
	zBdjbAlx6IWBFxJ75QJ6O4k7OW3FnXc9A==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr7725889eec.29.1795311535953;
        Sat, 21 Nov 2026 17:38:55 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm25330517eec.10.2026.11.21.17.38.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 17:38:55 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Justin Iurman <justin.iurman@gmail.com>
Cc: Simon Horman <horms@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
Date: Sun, 22 Nov 2026 07:08:48 +0530
Message-ID: <20261122013848.14287-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
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

net.ipv6.ioam6_id_wide stores a u64 (netns_sysctl_ipv6.ioam6_id_wide),
but its table entry uses proc_doulongvec_minmax() with .maxlen =
sizeof(u64) and .extra2 pointing at a u64. On 32-bit, unsigned long is
4 bytes, so the handler treats the field as a vector of two 32-bit
values and reads the u64 max through an unsigned long pointer:

 - reading prints two numbers ("4294967295 16777215" by default on
   little-endian);
 - writing one value only replaces one half of the u64: on
   little-endian "echo 5 >" leaves 0x00ffffff00000005; on big-endian it
   sets the upper half, and the range check uses the upper word of
   ioam6_id_wide_max (0x00ffffff).

The wide namespace ID emitted in IOAM trace data is then not the
configured value. Same class of issue as commit 162cf592b577
("net/smc: fix limit_smc_hs sysctl on big-endian architecture").

There is no u64 variant of proc_doulongvec_minmax(), so use a small
local handler that goes through proc_dostring() and kstrtou64(). A
generic u64 helper in kernel/sysctl.c would be a larger change for net
and stable; it can follow in net-next. For normal input the handler
behaves as the 64-bit one does today: base 0 parsing (decimal, hex or
octal), surrounding white space is accepted, values above
IOAM6_DEFAULT_ID_WIDE return -EINVAL, and a write of only "\n" returns
-EINVAL. A continued write at a non-zero offset in strict mode is
ignored, as before. Input too long for the 24-byte buffer is rejected
rather than truncated by proc_dostring().

One change on 64-bit: a write of two numbers such as "5 6" is now
rejected with -EINVAL, instead of being a partial write that sets the
value to 5.

The bug was discovered by an AI coding agent (Claude Code) reading the
code. It was confirmed and the fix tested on i386 and x86_64 kernels
under QEMU, with a small static test program as init: before the fix,
i386 reads "4294967295 16777215", and after "echo 5" it reads
"5 16777215". With the fix, i386 reads and writes a single 64-bit value
and gives the same results as x86_64, and on x86_64 reads, writes and
range checks behave as before. No kernel change was needed to
reproduce it.

Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
v2:
 - Keep -EINVAL for a write of only "\n", as before; a continued write
   at a non-zero offset in strict mode is still ignored (Justin Iurman).
 - Changelog: say that on 64-bit "5 6" is now rejected with -EINVAL
   instead of being a partial write that sets 5 (Justin Iurman).
 - Changelog: describe how the bug was found and how the fix was tested
   in plain English, instead of an Assisted-by tag.
 - Cc the sysctl maintainers.
v1: https://lore.kernel.org/netdev/20261118042958.83243-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Tested on net.git main d5b89d55a322: x86_64 and i386 defconfig builds,
plus a build-only 32-bit big-endian powerpc (pmac32_defconfig). W=1
shows no warnings for sysctl_net_ipv6.o before or after.
Under QEMU (TCG) with a small static test program as init, i386 now
gives the same results as x86_64. On x86_64 vs unpatched: a lone "\n"
still returns -EINVAL, a continued write at a non-zero offset with
sysctl_writes_strict=1 is still ignored and succeeds, "5 6" now returns
-EINVAL instead of setting 5, and 21 to 23 digit input is now accepted.
Other changes seen: a lone "\n" at a non-zero offset with
sysctl_writes_strict=0 is ignored instead of returning -EINVAL, and a
read in small chunks returns the whole value.
The big-endian kernel was built only, not run.

I did not add Cc: stable; please add it if you think it fits.

 net/ipv6/sysctl_net_ipv6.c | 45 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
index 1a0a36dcda..61c28df64d 100644
--- a/net/ipv6/sysctl_net_ipv6.c
+++ b/net/ipv6/sysctl_net_ipv6.c
@@ -30,6 +30,48 @@ static u32 rt6_multipath_hash_fields_all_mask =
 static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
 static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
 
+/* unsigned long is 32-bit on some arches, so handle the u64 here */
+static int proc_ioam6_id_wide(const struct ctl_table *table, int write,
+			      void *buffer, size_t *lenp, loff_t *ppos)
+{
+	u64 *valp = table->data;
+	char buf[24] = "";
+	const struct ctl_table tmp = {
+		.data	= buf,
+		.maxlen	= sizeof(buf),
+	};
+	loff_t pos = *ppos;
+	u64 val;
+	int ret;
+
+	if (!write) {
+		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
+		return proc_dostring(&tmp, write, buffer, lenp, ppos);
+	}
+
+	/* an empty write changes nothing, as with proc_doulongvec_minmax() */
+	if (!*lenp)
+		return 0;
+
+	/* proc_dostring() would silently truncate a longer input */
+	if (*lenp >= sizeof(buf))
+		return -EINVAL;
+
+	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
+	if (ret)
+		return ret;
+
+	/* a lone "\n" is invalid, a continued write in strict mode is ignored */
+	if (!buf[0])
+		return pos ? 0 : -EINVAL;
+
+	if (kstrtou64(strim(buf), 0, &val) || val > ioam6_id_wide_max)
+		return -EINVAL;
+
+	WRITE_ONCE(*valp, val);
+	return 0;
+}
+
 static int proc_rt6_multipath_hash_policy(const struct ctl_table *table, int write,
 					  void *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -210,8 +252,7 @@ static const struct ctl_table ipv6_table_template[] = {
 		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
 		.maxlen		= sizeof(u64),
 		.mode		= 0644,
-		.proc_handler	= proc_doulongvec_minmax,
-		.extra2		= &ioam6_id_wide_max,
+		.proc_handler	= proc_ioam6_id_wide,
 	},
 };
 
-- 
2.54.0 (Apple Git-157)

