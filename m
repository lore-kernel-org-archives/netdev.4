Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694540;
	b=ruPtr5lFUN0jc8hiL0ZIM4raJq34pBq9zWVsyxVUnu3ALHUGXeLPvZ4FBAuzj26qa58U
	 5RNCVItTlUXUJal8aL5meUYx9Hpfk7/pII7HWmg/OkT9DKfDmU7rd3ePwuWakKJ+H60+Q
	 lOXg8KjX1GiKE8OpQhIjm71XXh77nZRqnHbhiUnqH2bV94tUTwk9MUk9h3RdW3kfYC9Ds
	 hClhGKTU4BQ+puTmjgI8fHyBvQIKOluR3oS13zX3J4uxCzJt3Sq/fKmaqUcuEYLjdHPCc
	 9MvbnFymflJxlyUUfXS1Tp22DKAufqdpBs1rLTtPBeue9dmG3ZuUkuW5pxLSOfzR6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
	b=h/hq3Y4tAxWk0RKLiHFVX+OvLB7kUWyy1YIGrwC5OmFaUOxmxDQyOHa5DhuPcqSO5CxI
	 EFGOLhAQ7KqW+PX4JqP6rR8AnDPaJbM6e13miknMqaW8NuzwBZOWOVb5bvpnIQLUtZkrr
	 Q6c8jQJwKXdsCUcvfoDZMJW3PWiK6JA+THXuJb0PlI6NQeszPVBear6jADLWskhM+q/a7
	 2WFIJaj5R/sasKpg5kOYCWUECv6A71lAD1Pne39qVBiu6MDQog07O8nPmnKZZnyrnNB1p
	 Zu9rT1PUDlHB0uXyy3nYFMSze0WWQqp8AyCNhpOFc9ycgNXDLfOHCTByI1bQDCqC4kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/K1wA+c";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973A606A8AC
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1973A606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/K1wA+c
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1308463f8f.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694537; x=1795299337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
        b=Z/K1wA+c9M8ZoVEMzAW/MJN2cc/MHNIHXgX7e6wrmviCoQnd9rkEueIEds04sClxQ6
         pNAosYQGXAollc5mcZGQ1Lc4Ej3/oOiMr0das1d+tu4z4uBDATVZcBXwugtg/Vnftjy4
         kAV6nyktK08YSlyJhMkeQPPszNU/ZZ3uClrQRV3+cfM3oPwnt5XqGKrbDaAf1SOmksIs
         nwtI2Wy5V/cH5IgbPIN3nnhZYLbRzm2x1h0eVqeWDriImmlu0RPHKCqH974ZMhBwKiW/
         i6POuGtxEKVv++durHl7+OB5+czet5fp1zIj4y9fZ1GkgQJM+0unAzycwtHGIfnbekgG
         GuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694537; x=1795299337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
        b=PlXaSyXFkIeqyJl5qRseowh1vhb750w/HOYsC/GunpCM3hGX1IgGjjUGD7mQsqWJsB
         Wkr/YluQlewmUW/pGHHum6elMVaOqoRfQ9jWsRd3EyXaFwYQpi9rU0oIzfoYaDn9ot00
         ANMzA7VfZ20Y7jc8REEjZPX1Ivb7AlUVpa2N2at35sm54yywjaHOE6nBFSQ4DC71OVP7
         fCh+nWT125BSocZ+dCgdwToQU9sJe9yEjsPvbGSVUSgNwijSdR816Np/ygPPjjb3+6R3
         IWZeHMqkjxcmfxv6PxVYlt/aiencw4W7RmfuC5Ey+LAaX75iAXEeuIEneE+fZ9OJV9AD
         We6g==
X-Gm-Message-State: APuU4Z9jvUCmmOOLrE2QkHnfRQNei3JtzYRkla13Chlv5JQOooaHvQrs
	Dlm6LY7BCBFQKDnkUnXYn0yttUwb3bFkI//4hm/IkmEJX3qvO5h7Pd/zeilro5yaqXE=
X-Gm-Gg: AYBFou1ZABMfy2KW89Skh58CrAasKKvv4zcz5XZiSoekPCFRIgh6jg3nOVRTNR5ejgF
	5QvzeSfQzMJKI+ZttVSx1fHoytI8Tet1wRbBAVqwmGFnpqjjhKadIrSX92VORH5P/T1AFrVx6Fa
	f18Tjft/F59Rd6pN/AE5F4MKrqwuQTOnLzRBfkEZyLerWpVwXyS6RnU8I8T3QDMptq0frCDwrmT
	s6+L6D3ymOopo1C2MGzXpRRt36joNXnhptaFuVmjWMjZkecM0oBG6FNwGBL4EjPQoAHCJBeLWdG
	NHHgUf2lx1z8AMm5ejffGzfjyG4yXS1Cg1VuUoes3KU/Q2TLp8g7a+zi/BXB/Xr35XHObYujXmO
	9tEMziZCMLegH4kAtg/SlKNcE+XeH0EHkZioR92u8EKukvIttTJkFvgzWuou0r2sc7IJ0KOr25X
	K7CmhMaqCM8Vlw1EUbSKocBrQJ79SFps6If2e5+r2fgZHtSkuuYKSba0wnYkbRjAHaPRv2zmaI0
	DtGiL0j7IdYydw/bbtygF4aZOxEZla28LKFP0jxM5zK1Vm0IJUxpNGjysSAkncCTihNGwC6pRX3
	an/aZM4qoO1Gdt+IuKHujnY=
X-Received: by 2002:a05:6000:40dd:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-49c723fb6ebmr14182597f8f.38.1794694537395;
        Sat, 14 Nov 2026 14:15:37 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:37 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 2/8] vxlan: vnifilter: clamp the dumped VNI range to the request limit
Date: Sun, 15 Nov 2026 01:14:06 +0300
Message-ID: <20261114221412.255825-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_vnifilter_dump_dev() coalesces a contiguous run of VNIs sharing a
remote into one VXLAN_VNIFILTER_ENTRY, and packs as many entries into a
netlink message as the skb holds, with no bound on either. The patch
that follows, "vxlan: vnifilter: bound the number of VNIs one request
may touch", bounds a single request to VXLAN_VNI_FILTER_MSG_MAX VNIs
summed over its entries; without a matching bound on the dump, a device
holding more than that -- populated by several requests -- would dump a
run, or a message, that the input path then refuses on replay.

Introduce VXLAN_VNI_FILTER_MSG_MAX here and clamp the dump to it first, so
the series never passes through a commit where the kernel reports a range
its own input path rejects. Bound the two ways the dump can exceed the
limit:

  - end a coalesced run once it reaches the limit, in the merge condition,
    even when the next VNI is contiguous and shares the remote; and
  - carry a per-message VNI budget, ending the message once its entries
    would sum past the limit, the same way the loop already ends it when
    the skb is full.

cb->args[1] continues to count the VNI nodes already dumped and is
advanced only when a completed entry is written, so the budget break and
the skb-full break share one resume path; a run stays a gapless block,
so while the VNI set does not change between messages the dump never
drops a VNI and never emits one twice. A VNI added or deleted between
messages is flagged with NLM_F_DUMP_INTR, as before.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: the VXLAN_VNI_FILTER_MSG_MAX comment states what the dump does
instead of pointing at "a later patch", and the changelog names the cap
patch by subject (review of v4); the no-drop/no-repeat claim is scoped
to a VNI set that does not change between messages; one line wrapped to
80 columns. v4: moved before the input cap; now introduces
VXLAN_VNI_FILTER_MSG_MAX and adds a per-message VNI budget (v3 clamped
per entry only), so the dump never emits a message the input path
rejects.

 drivers/net/vxlan/vxlan_vnifilter.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 2b02f448c3e9..66a27198c65d 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,6 +17,11 @@
 
 #include "vxlan_private.h"
 
+/* The most VNIs one dumped entry, or one dumped message, carries: the dump ends
+ * a coalesced run, and a message, before either would exceed it.
+ */
+#define VXLAN_VNI_FILTER_MSG_MAX	4096
+
 static inline int vxlan_vni_cmp(struct rhashtable_compare_arg *arg,
 				const void *ptr)
 {
@@ -342,6 +347,7 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 	struct nlmsghdr *nlh;
 	int idx = 0, s_idx;
 	bool dump_stats;
+	u32 vnis = 0;
 	int err = 0;
 
 	if (cb->args[2] != dev->ifindex) {
@@ -388,15 +394,29 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 			continue;
 		}
 		if (!dump_stats && vnirange(vend, v) == 1 &&
+		    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&
 		    vxlan_addr_equal(&v->remote_ip, &vend->remote_ip)) {
 			goto update_end;
 		} else {
+			u32 sz = vnirange(vbegin, vend) + 1;
+
+			/* End this message on its VNI budget the same way we
+			 * end it when the skb is full, so a dumped message
+			 * never sums to more VNIs than the input path accepts
+			 * in one request. Resume re-emits this run as the
+			 * first entry of the next message.
+			 */
+			if (vnis + sz > VXLAN_VNI_FILTER_MSG_MAX) {
+				err = -EMSGSIZE;
+				break;
+			}
 			if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend,
 							 dump_stats)) {
 				err = -EMSGSIZE;
 				break;
 			}
-			idx += vnirange(vbegin, vend) + 1;
+			vnis += sz;
+			idx += sz;
 			vbegin = v;
 		}
 update_end:
@@ -404,7 +424,11 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 	}
 
 	if (!err && vbegin) {
-		if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend, dump_stats))
+		if (vnis + vnirange(vbegin, vend) + 1 >
+		    VXLAN_VNI_FILTER_MSG_MAX)
+			err = -EMSGSIZE;
+		else if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend,
+						      dump_stats))
 			err = -EMSGSIZE;
 	}
 
-- 
2.53.0

