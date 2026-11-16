Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793242;
	b=kwpMBPwIoHGLjn/WHW5IKbvePTDbyFFFdP5Fd8cKdQIuakI8eL/Dw5+InkkYG2OoBSux
	 DxpeKlEyJHIzEym4UgvPEN/CKPaQdx2NsgUkezG7Pd0dzO93QdvhQRAzPB6fc1tOMlK78
	 4nuzsiKNrPIpeUCstN/z6zcnsYNTBxzGvNkArAOpAUxjA28+YQn2lFAIRbXkyNSwF+lH+
	 TzDUIR5//ZHN7yvRlt7R9hzgLS0IPArJ0yx6xjS6w+JWsbTFL/yaqPiRBS8vkkAlRp1OC
	 O1fKnH7PIsiXHu10CQ0V+mAxA48NKCX0pxol5GX+LX5Sn9VFT2o7n7go8Uh52XuXQbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793242;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:Received:
	 From:To:Cc:Subject:MIME-Version:X-Mailer:Date:Message-Id:
	 Content-Transfer-Encoding:Content-Type;
	bh=2jbiTHxABRnF0p0UohwE6J8FYpheO9Ckmg68bOdoYz8=;
	b=pV/7cT0o39pByleUlBfvk71KDC9JIjUL7mCQPXCF9V6Dj4Zbm5FbxkjNmSNWU2vT81sF
	 qCDs2lO/4FGYldkWNk/niim9YFS8zPBHOb8U+xYXrHptBcbbgr74CuLjLmYrTWB0hD9PZ
	 1uML7EFmTycOG7AW+DsbgDaJEFjA0CgrneoxborLTpvY0bAJ0GeqmowQykewZZqbB82AV
	 LMTOb62A02HqhGG3UBBj/wJSsYAkUhggkzBHJ0IdD/7In0G1sN5mEzqoMLA87D9oxGJ7H
	 Vk/CzDkwzOS0uS5RjpJwn/a5jvbSEGxOkm0Sbl8wcn57IMvsIw0avYNwNeJ+5AKik9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telsoft.org;
	spf=pass smtp.mailfrom=telsoft.org;
	dkim=pass header.d=telsoft.org header.i=@telsoft.org header.a=rsa-sha256 header.s=mail header.b=QJ8di9ZQ;
	arc=none smtp.remote-ip=51.250.60.161
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [51.250.60.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21546606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21546606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telsoft.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telsoft.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telsoft.org header.i=@telsoft.org header.a=rsa-sha256 header.s=mail header.b=QJ8di9ZQ
Received: from mail-nwsmtp-mxback-production-main-70 (mail-nwsmtp-mxback-production-main-70.yp-c.yandex.net)
	by forward101d.mail.yandex.net (postfix) with ESMTPS id E15DFC0043;
	Mon, 16 Nov 2026 04:40:28 +0300 (MSK)
Received: from mail.360.yandex.ru
	by mail-nwsmtp-mxback-production-main-70 with HTTPS id AeMs8bFcuuQ0-tjCieGOv;
	Mon, 16 Nov 2026 04:40:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telsoft.org; s=mail;
	t=1794793228; bh=2jbiTHxABRnF0p0UohwE6J8FYpheO9Ckmg68bOdoYz8=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=QJ8di9ZQTAT6EZVaN7FQSKJmbGFjlm9HtQU6UZf535Yipk1jlsk15Q/AfMZ4TAb87
	 gjUvd68IKcfxszIMHTHqISfNJFUA4923dnM8mVa8LeMVkPgI6L9wWEdlAkV5/4YKcS
	 LCKPWqu0lF9Hgj2MzZkVlQY2uftXhM4kiszheJUs=
Authentication-Results: mail-nwsmtp-mxback-production-main-70; dkim=pass header.i=@telsoft.org
Received: by mail-sendbernar-production-main-55 with HTTPS id 25009eeb71366bcba824ccf37a9c73a3;
	Mon, 16 Nov 2026 04:40:26 +0300
From: Dmitry Vasilkov <dvasilkov@telsoft.org>
To: devel@linux-ipsec.org
Cc: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	netdev@vger.kernel.org
Subject: xfrm: inbound per-CPU state cache makes ESP input O(number of SAs) with 10^5+ SAs (6.12.13+)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 16 Nov 2026 10:40:26 +0900
Message-Id: <1409971794793226@526cea60-1695-45d2-82c7-21555f54496c>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8

Hello,

We would like to report a performance regression in the xfrm input path, which we hit on 6.12.73+deb13-amd64 (Debian 13). 
We also share the 
livepatch we use as a temporary workaround, in case it helps others or the discussion of a proper fix.

Setup

Host: an IMS P-CSCF (Kamailio with ims_ipsec_pcscf), a VM with about 33 CPUs and 128 GB RAM.
Every VoLTE UE gets its own transport-mode ESP SAs (hmac-sha1-96, null encryption in the lab), 
4 SAs and the matching policies per UE.
Lab load: a UE emulator on the same host registers UEs over IPsec through lo, 
from 2500 to 3000 registrations per second. This builds up to 1.2 million SAs.
The SAD and SPD hash tables grow as expected (524288 buckets), so the hash itself is not the problem.

Symptom

During the test the user time of the receiving processes stays flat, but their 
system time grows linearly with the number of SAs:

SAs	SIP worker (sys)	UE emulator (sys)
28k  57%                45%
425k 325%               418%

Host CPU rose to 54%, the p99 of the REGISTER transaction grew to 465 ms, and the 
test failed with replies later than SIP T1. The CPU was not exhausted: 65–70% of the host stayed idle. 
Only the cost of one ESP input operation kept growing.


Cause

Since 6.12.13 (6.12.12 does not have it), the inbound SA 
is looked up via xfrm_input_state_lookup(). 
That function first walks net->xfrm.state_cache_input, a per-CPU list, 
and falls back to the SPI hash only on a miss. On a successful hash 
lookup the state is added to the per-CPU list under the global xfrm_state_lock:


hlist_for_each_entry_rcu(x, state_cache_input, state_cache_input) {
	if (x->props.family != family || x->id.spi != spi || ...)
		continue;
	...
}
x = __xfrm_state_lookup(...);                 /* hash */
if (x && x->km.state == XFRM_STATE_VALID) {
	spin_lock_bh(&net->xfrm.xfrm_state_lock);
	hlist_add_head_rcu(&x->state_cache_input, state_cache_input);
	...
	
As far as we can see:

The list is unbounded. Every inbound SA that has ever received a packet on that CPU stays on 
the list until the SA is deleted. There is no size limit and no aging.
A cold SA walks the whole list. The first packet of a cold SA (and on a busy server almost 
every SA is cold) walks about SAs/CPUs entries before the O(1) hash lookup, and each entry is a cache miss.
Every miss takes the global xfrm_state_lock. With many receiving threads this adds contention on top.
This matters even more in production than in our lab. On a P-CSCF with several hundred 
thousand registered UEs, each UE sends packets rarely (re-REGISTER, INVITE, keepalive). 
By the time its next packet arrives its SA is deep in the list, so practically every inbound ESP 
packet pays the linear walk. The cache helps a small number of hot SAs and hurts hosts with many 
mostly idle SAs.

We checked the current mainline code of xfrm_input_state_lookup() and it looks the same, so newer 
kernels are probably affected as well.


Micro-benchmark

Same kernel, transport-mode ESP SAs (null encryption) on lo, one packet per SA, sender pinned to one CPU:

SAs	stock 6.12.73	with the workaround
10 000 150 us/packet 17 us/packet
20 000 730 us/packet 18 us/packet
The cost grows faster than linearly once the list no longer fits in the CPU caches. 
With plain hash lookup it does not depend on the number of SAs. 
The per-SA counters (ip -s xfrm state) confirmed that the packets really went through ESP.

Workaround: livepatch

We replaced xfrm_input_state_lookup() with the plain xfrm_state_lookup(), i.e. the hash 
lookup the input path used up to 6.12.12. SAs that are already on the per-CPU lists stay 
there until deleted; nothing adds them any more. The module can be unloaded at any time.

// SPDX-License-Identifier: GPL-2.0
/*
 * Livepatch for 6.12.13+ kernels (checked against 6.12.73+deb13).
 *
 * xfrm_input_state_lookup() first walks net->xfrm.state_cache_input, a per-CPU
 * list that keeps every inbound SA ever looked up on that CPU and has no size
 * limit; the hash lookup comes only after a miss, and a hit or a miss also
 * takes the global xfrm_state_lock. With 10^5 SAs the first packet of every
 * cold SA walks SAs/CPUs entries. Replace it with the plain hash lookup the
 * input path used up to 6.12.12. SAs already on the lists stay there until
 * deleted, as before; nothing adds or moves them any more.
 *
 *   insmod klp_xfrm_input.ko
 *   cat /sys/kernel/livepatch/klp_xfrm_input/enabled   # 1
 *   echo 0 > /sys/kernel/livepatch/klp_xfrm_input/enabled; rmmod klp_xfrm_input
 */
#include <linux/module.h>
#include <linux/livepatch.h>
#include <net/xfrm.h>

static struct xfrm_state *klp_xfrm_input_state_lookup(struct net *net, u32 mark,
						      const xfrm_address_t *daddr,
						      __be32 spi, u8 proto,
						      unsigned short family)
{
	return xfrm_state_lookup(net, mark, daddr, spi, proto, family);
}

static struct klp_func funcs[] = {
	{
		.old_name = "xfrm_input_state_lookup",
		.new_func = klp_xfrm_input_state_lookup,
	},
	{ }
};

static struct klp_object objs[] = {
	{
		/* vmlinux */
		.funcs = funcs,
	},
	{ }
};

static struct klp_patch patch = {
	.mod = THIS_MODULE,
	.objs = objs,
};

static int __init klp_xfrm_input_init(void)
{
	return klp_enable_patch(&patch);
}

static void __exit klp_xfrm_input_exit(void)
{
}

module_init(klp_xfrm_input_init);
module_exit(klp_xfrm_input_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("xfrm: input SA lookup by hash only, without the per-CPU state cache");
MODULE_INFO(livepatch, "Y");

The system time of the receivers no longer grows with the number of SAs.

Possible proper fixes

This is only a workaround: it disables the cache completely. 
Possible directions for a real fix, in no particular order:

bound the per-CPU list (a small fixed size, LRU-like replacement), so the walk is O(1) 
and a hit still benefits;
do the hash lookup first and use the cache only where it is cheaper, or skip 
the cache when the number of inbound SAs is large;
avoid the global xfrm_state_lock on the input path when adding to the per-CPU cache;
a sysctl or per-netns knob to turn the input cache off for hosts with very many SAs.
We can test patches on the same setup (up to 1.2 million SAs at 3000 new UEs per second) 
and report the numbers.

Thank you for your work on the xfrm subsystem.

Best regards, Dmitry
