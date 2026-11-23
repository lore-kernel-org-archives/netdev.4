Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401044;
	b=mVPjDtlBlb6PsBDDzVtrXsBH0UVM/LlGJS04RzyK8xEE9W9nNghYHpIXO4neeN2Lbyuq
	 0HhDG7Bn8PP6Rn0yAT06TAaNwHgnTE39h28LZLrPsa0G5mGcMXM9OAiRiXV9APKUuB/WE
	 MQ68tqxEysjgyGggDhnc5u1VWxPSA1uv2mbjebtXX5y15FE3O3WlEZQbr21t3dBDjyMbw
	 0DRlEz8FeC80srbeJdeK4kxtDrwiWSMLPXrt0oONQb//HZUSmXYvzR+L8fb/d5TWO+1E/
	 gvxE9hnq+limHDKPdjTN19HUB595dPUde4r3KbOSsHYqC6rEtMyvXBv9vjo/+Q1MtUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=glbFFS+aXGpCoXPzQsQfZyiNK3IdL0vGW5/m3ogOzuE=;
	b=UbLwfu2OIAyp0D5wiWMM+E8eKfL3mH+Z0AvkzmvsK0ggZsxt5HM/drqvCNDeE5lOIENl
	 dFrg6+VePCaNSLYe1EvsFo2SQhHfU9QAoX+OEZN6DmblyAns2mXMKO7M4FkAiTCtqjcdS
	 4q7qx7xWiD9TOzM1dhiQN0WdE8c/4jq0IrlAjHNiL6JlJMhMwDslSXVZTAwOWF+7Oic4q
	 xzZxrHAJXbgP9+2c142SYk0pOIBwqISTyHuEfvJAkx2tDZdb6S4vfXC6CMFpe/RvR7MOB
	 WNwLqv4Li+tMFkSfNMZLqKR7AmJcUbwUsztVwTz5au6ZAWTHmgtFy4SaSSfRZR2rO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suY6Eqvf;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31708606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31708606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suY6Eqvf
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4973567c88.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795401043; x=1796005843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=glbFFS+aXGpCoXPzQsQfZyiNK3IdL0vGW5/m3ogOzuE=;
        b=suY6Eqvf8YS4cgAPHyjGGg/8HZlfk7ma3mdfGUqeG6njl02vO/IEU9cYa9mLpKLbcg
         YK9T6x3PRtsv0Fjhrgcucl+BEObjHPIpUpjPefVOT7ByclehITj1YSMWV1glG/3qvgAC
         m/ThWNYBY8CBSfE5SIONUastTwM3zu0Rc79DbohO15WpXMf974IMx7/uudO+wAl9g02w
         MZwHOYe32l3bK3jL1I3EtQHeqrYLJe/pkzjcTDGH/Bp651+OOcsewztG4wlI7XvatUWY
         1wX0dMqUR2DT66s6U1NskkDPgMFMeNgEWBofw8D92dfow3+IQQRBrGxlbTeMkLSrQbF/
         zHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401043; x=1796005843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glbFFS+aXGpCoXPzQsQfZyiNK3IdL0vGW5/m3ogOzuE=;
        b=Vrfr6wXQz2/OY7BmSnRnTNFb+d9pgvTSgJoNFVds8v3sr+/qSfIY27R6OyTdC8GM6V
         wAcS6wCWJqIxh6SlUtuIc9ba0Y7DEwEXZR9+akxGNtkgZj2ez5VFnoiPDjGRRgICJ/+k
         ON/xQFsmXS1xLXUz4rsx+CGxNzBwgotU4YOhdnOtUO/FkudhmcWlpKeaj0ZR+SYibhRG
         /HI+yxBggeJo6AI5Uyj7WvxXVNY/EcuCyu5C/PUO4qrVYYLcrFz7VeIxXoiCpjLPHSjL
         +yDzUx+qt40I8xgeo5rM0lg9ELN2C6hTcOdr/PlydyMWPe0ePfoO3F1HQC+NeEP1rjz3
         Ylkw==
X-Forwarded-Encrypted: i=1; AL+hErHlA2O3x75M8Iz4x1CSJtgopB7l3jRwq43bd5o1S4Cj/DCtoL1MDqBMugFpu4Iu6CJxv5XGtt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MsxF+RFabZaNC7m9/YUSBwizdnRO3Pgz+KhHEkj8dSa+z2W85
	i/CopNJWpJY8XCFpZeNCD6Wi7BIMVx6Y3bLGB8lZ9TjLADa+jk3jHas9
X-Gm-Gg: AZFdTZc6+bSXlu2UlfsLGKkaG/xvJZKFqEEk3ZsfhpaPhedMfLLs0Hgk/AHw2NVP09Q
	U2lm/z2SBW794lqHJ5zPjuwSkRzmX1oiXyPp3QK7OueEr20HONsTnUIp2b/dfYuKXrWqDFlAt/k
	sDpEyf9yAxR4Nk6yw4qUG9M/XK/ApC7xH2HadTxrCZaP0Iai54V2tnQ0JzidRg0X0+XrVFzavXH
	jBD8Ddi9QiVAS6IarPK8VOToxyomfMOXd/qvz5+S1zZAYgZUOav07WWUkC3kYanwkkiOlBtLjrp
	g96O7KUwLYeXvhCKSodBEnkFylqzZQnpq5mhmD1HnMIEmMftzCln1x7PNh2qrivE+hpQiHXH/or
	GGaIrGfMwj/DipBwm6b+4ShXShRNkLJNH7wzognFoXlTmfx6g2wnqOPRgjWkBk8GFAprBuQXq4a
	nvwHAJp1behsMXup2Gi1Vr6GHVJKOo49fMumXHkwyzQVifsLTVr1GT+Pb5fCdmB11x3xbaI0XBI
	hA+8DXKEbsOGYsXwq3WULcaobsnNbl9FgYEC5SzCJUHPReMCiAFzBtIFuE0AHGF3qOc9QYElC/G
	wBzpc4KZuEUgpm+YX510BxDZuwMDe75svOFWGj70QisZrA8rz1FbSpEvVObUv28FSEChyZbygCe
	gM7Pu0WHYuRFZXu6feIIyKq/j9fYZfOecXt2RFFPor6MBUC0h2IQGuXhq37/jFCJVsq0TPaHicr
	sLL78y4liy46/0f06dXLhu6VGAG7nTH7K/OobNSvtXuFWl+OQX1irPKfajQiexKRI4bHwhj6l3S
	94ILmOdI8ZOkB3o4ZXsQQTPmb8fE4t7xg==
X-Received: by 2002:a05:7022:4398:b0:1b2:610b:878 with SMTP id a92af1059eb24-1b556877921mr13816034c88.6.1795401043135;
        Sun, 22 Nov 2026 18:30:43 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm25943813c88.6.2026.11.22.18.30.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 18:30:42 -0800 (PST)
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
Subject: [PATCH net v3] ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
Date: Mon, 23 Nov 2026 08:00:36 +0530
Message-ID: <20261123023036.88754-1-jain.sm@gmail.com>
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

There is no u64 variant of proc_doulongvec_minmax(), so add a small
local handler. On 64-bit it calls proc_doulongvec_minmax() as before,
so nothing changes there. On 32-bit it goes through proc_dostring() and
kstrtou64(): it reads and writes one value, parses it with base 0
(decimal, hex or octal), accepts surrounding white space, and returns
-EINVAL for a value above IOAM6_DEFAULT_ID_WIDE, for a write of only
"\n", and for a write of 24 bytes or more. A generic u64 helper in
kernel/sysctl.c would be a larger change for net and stable; it can
follow in net-next.

The 32-bit parser is not identical to proc_doulongvec_minmax() for
unusual input: a second value after a space is rejected rather than
ignored, and a leading "+" is accepted. As the sysctl did not work on
32-bit before, this only affects input that was already broken there.

The bug was discovered by an AI coding agent (Claude Code) reading the
code. It was confirmed and the fix tested on i386 and x86_64 kernels
under QEMU, with a small static test program as init: before the fix,
i386 reads "4294967295 16777215", and after "echo 5" it reads
"5 16777215". With the fix, i386 reads and writes a single 64-bit value,
and x86_64 behaves exactly as before. No kernel change was needed to
reproduce it.

Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
v3:
 - Keep proc_doulongvec_minmax() on 64-bit, so 64-bit parsing does not
   change at all; the string based parser is used on 32-bit only
   (Sashiko review of v2 listed several 64-bit parsing differences).
 - Set .procname in the temporary table, so the sysctl write warning
   names ioam6_id_wide (Sashiko review of v2).
v2: https://lore.kernel.org/netdev/20261122013848.14287-1-jain.sm@gmail.com/
 - Keep -EINVAL for a write of only "\n", as before; a continued write
   at a non-zero offset in strict mode is still ignored (Justin Iurman).
 - Changelog: describe how the bug was found and how the fix was tested
   in plain English, instead of an Assisted-by tag.
 - Cc the sysctl maintainers.
v1: https://lore.kernel.org/netdev/20261118042958.83243-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Tested on net.git main af6737b90668: x86_64 and i386 defconfig builds,
plus a build-only 32-bit big-endian powerpc (pmac32_defconfig). W=1
shows no warnings for sysctl_net_ipv6.o before or after.
Under QEMU (TCG) with a small static test program as init, x86_64 gives
exactly the same output as the unpatched kernel for every case. i386
reads and writes one 64-bit value, with the same results as v2. With
sysctl_writes_strict=0, the "file position was not 0" warning names
ioam6_id_wide on i386, as it does on x86_64.
The big-endian kernel was built only, not run.

I did not add Cc: stable; please add it if you think it fits.

 net/ipv6/sysctl_net_ipv6.c | 49 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
index 1a0a36dcda..c93ccf7e98 100644
--- a/net/ipv6/sysctl_net_ipv6.c
+++ b/net/ipv6/sysctl_net_ipv6.c
@@ -30,6 +30,53 @@ static u32 rt6_multipath_hash_fields_all_mask =
 static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
 static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
 
+/* unsigned long is 32-bit on some arches, so handle the u64 here */
+static int proc_ioam6_id_wide(const struct ctl_table *table, int write,
+			      void *buffer, size_t *lenp, loff_t *ppos)
+{
+	u64 *valp = table->data;
+	char buf[24] = "";
+	const struct ctl_table tmp = {
+		.procname	= table->procname,
+		.data		= buf,
+		.maxlen		= sizeof(buf),
+	};
+	loff_t pos = *ppos;
+	u64 val;
+	int ret;
+
+	/* on 64-bit, unsigned long is a u64: keep the generic handler */
+	if (IS_ENABLED(CONFIG_64BIT))
+		return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
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
+	/* reject what may not fit in buf, proc_dostring() would truncate it */
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
@@ -210,7 +257,7 @@ static const struct ctl_table ipv6_table_template[] = {
 		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
 		.maxlen		= sizeof(u64),
 		.mode		= 0644,
-		.proc_handler	= proc_doulongvec_minmax,
+		.proc_handler	= proc_ioam6_id_wide,
 		.extra2		= &ioam6_id_wide_max,
 	},
 };
-- 
2.54.0 (Apple Git-157)

