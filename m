Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851152;
	b=ZKJjYIc2cBa8+tjGF0cnqogQNI7NqvuWrioSbgghuSbhRVCFzHZbCq2NM2bYFAH66I3y
	 ISuBUCxyEaovGR86jDi8lpLeezmBFIXn+JjWH5jqRMeaOcriDOc0mKqP7KP8i+ymNjfo9
	 W9uS5CV5I5dPkBNsuBHPCdtLpBxHmdqz+zUBrcwFMo4gpiXRaGWiaMHPuV6KI4OqCarHi
	 qvKCkmd/GkQ+h92tPDhPu1RtJGLxSIQksAkwGQC9Bw0859Eshgf7XeFVYL1gCnes4/BAr
	 Wgdjd/Q6INkA78ZGEtkF7a2ow1dgJQ5QV+aAyja7SnLay5Z19e2mUOqtpKABEU0CzEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
	b=PDlVzgKGHwDnngTGSRZ18kWM2aXibMSPuecMkUwRyXPPQbKGvFaTIo0M/+bmLvMNpuP5
	 9J4eEaYtpYvugWybJthuBtEDvmAdNuOXhAJ1FgcV0BS5GdoMvZiI2URQSqqwxYLGT7ejX
	 JVpvT0+16/3lersYdyHVlOCXDTk0PvSdJJrn5g+lMMGC5pN6c+XSqoJ6e5Rd2FRwcZf5L
	 4Z3Bn0nkK14TSLME+LOapY4/MHnQHhwbw+o4mZLQVOlyuuR7uuik9ApYm/VxJW++5eshd
	 zPCPf+wbwZa5S8c6GsUUgDpp8HSQ43B6fqccdqOvr4xhZ2x/CiRPynzThxBtIJSgDGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=bXROrsO+;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4920606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4920606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=bXROrsO+
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed408b0d9dso13916865ad.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794851151; x=1795455951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
        b=bXROrsO+wwimWeKgADw4fy8uKkZqT4nN5h7Z9Gfj5Dm0cJCp24/JgxlKewPlqmQuo2
         fq6AqRlj2oGVnUJ2phj4pNySDc6GS3swscs3cy1MiIrIMdaypynqcnDHGQTB6BBj9AO8
         sFZQwotGZXXdq+zia9tl+jg8wCJoMX2yMgsdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851151; x=1795455951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
        b=HAZVlpM2q0Eg/tq07cfrMDTSSz/Sgf3VqCl5ivXDnCmf3yeUoDayIt2cdS2Ym/58VI
         Zz67RniHRE4nIzHnFxZv+u45Dr/tFgmtWp4uYrwPOC+b/vYWMjICxrB3clBEkj3/OwvF
         rQ02dcxQqkOHrvNeyT8LMwWszZobwv4oxUN1bJ1p63BvSzxGc+ySfNY/m4qtCh/wOtnh
         PNPlqiSFNXl3YJnTlF91y4E46BqWq+YIMkmTvQn4XMNZlRCuEeXa+aMfnkzucKtthXKY
         9Cf1NOyUye9eUZddg/7sVNTWi1Uji8zgcwLSCgML1UbgebeKJvt04T01hqNUxChSick4
         qGaA==
X-Forwarded-Encrypted: i=1; AL+hErHP3yqrFA1IqT9W65DAL0+kMPZgr5aa+vY/L/hHoJTOBeulTjbZg8ib0W3NkDImGZ5ZaQLguV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SwHJsDx8jCU6ooI4NE36NtMDslg9UydscAVyOJl2oEKKI0cMr
	Wgl8GPjof6SSjISZsc/h6DrbOaaEL6Bkter2+hdzE1sAFraly/IsInwou1W+CzzS3W4=
X-Gm-Gg: AZFdTZemfXwv9v4f0NST+a5n4dIJwf/7RXfuKe3B4R3u25o2TWotSyN0XYa4xr7yIEb
	HEHxQDEVs5Td08Z0m9NaNIU7TbiLRwwm0XNX90NQD9CtNQ1a4ZPgVFSNNr85F823D9GdlTMoG8Q
	JgNjEpxlCHdeop/kaWMTRwpRzsCF9zokVzk2yzqdx7ITNOuqCey30XuaoxKISnhOkLi0Y72qS7C
	9Wx8bFtY3/0J8EPDOVzd9Phvah4ohvfJ7Pk0PUkEK1PwqPgKIgLOZDeKgRCGdBECXBj6nL/ICPh
	HUmjE8BNOLCoACqPjW+csWQ7i8rtSMYE4gDZEP8k3iA0CMyC785uiPIePSdcPYDu5FirN1Sjd36
	xkAfLYsKm9eJmEca6THBY9S0AZr7eUIDD3LYwLCzcDXvK+tCjKtKbhcY94bK2q1ndKBcFGMFvEi
	PXdDdQ9zxq28eSg5xdcFLfAhaLl3hyUDteZZ9Vj4UMjbkNKtCP4bPGV55msXyNJolsqvfB66ybC
	TIW3TYUfhnEcok1UKCuOfwt3QXMSiwqHwyV6fV7TUzLIp1KcGVf+icZOKkiIjbCP88fiiQ8vzCf
	NY7U4T62KjUBjdpQ5ZJLUkY85t4S8RnwHoW5Go4iuQvXCROlMeoVxxi180KBjBtsF1wkaoaeJW0
	OjoOZzlxB7oSrLcnT0RKvl+pffoLikLR0LB+vFJftZCc6yB1yh93i6G74oGJ3PVoo
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr106958285ad.22.1794851148382;
        Mon, 16 Nov 2026 09:45:48 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7ab901dsm2577055ad.74.2026.11.16.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:45:47 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH] xfrm: do not write the ethernet header when the mac header is unset
Date: Mon, 16 Nov 2026 23:15:31 +0530
Message-Id: <20261116174531.2540348-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174531.2540348-1-piyus@iiitd.ac.in>
References: <20261116174531.2540348-1-piyus@iiitd.ac.in>
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

xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() restore the
mac header after removing the tunnel header and then stamp the protocol
into it:

	skb_reset_network_header(skb);
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

skb_mac_header_rebuild() does nothing at all when the mac header was
never set:

	static inline void skb_mac_header_rebuild(struct sk_buff *skb)
	{
		if (skb_mac_header_was_set(skb)) {
			...
		}
	}

and it does not clear skb->mac_len either, so on an skb whose mac header
has been unset while mac_len stayed behind, the guard is true and the
store goes through an unset header.  skb_mac_header() is
skb->head + skb->mac_header and the unset value of that u16 is 0xffff,
so eth_hdr(skb)->h_proto is 65535 + offsetof(struct ethhdr, h_proto)
bytes past skb->head: a two-byte out-of-bounds write landing far outside
the skb, in whatever object happens to be there.

skb_unset_mac_header() leaves skb->mac_len alone, and of its callers only
skb_carve_reset_headers() clears mac_len by hand.  end_dt_vrf_rcv()
(SRv6 End.DT4/End.DT6) unsets the mac header on the receive path so the
VRF device can rebuild it, and leaves mac_len at the value the original
ethernet frame had, which is how an skb in this state reaches xfrm input:

  tun_get_user -> netif_receive_skb -> lwtunnel_input
    -> seg6_local_input_core -> End.DT4 -> end_dt_vrf_rcv
    -> skb_unset_mac_header (mac_len stays 14)
    -> VRF l3_rcv -> ip_local_deliver_finish -> xfrm4_esp_rcv
    -> xfrm_input -> xfrm4_remove_tunnel_encap

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
       net/xfrm/xfrm_input.c:258
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
  ...
  The buggy address belongs to the object at ffff88805f858000
   which belongs to the cache zswap_entry of size 56

The address does not depend on mac_len - it is always
skb->head + 0xffff + offsetof(struct ethhdr, h_proto), since the unset
sentinel is what mac_header holds - and mac_len only decides whether the
write happens.  The value is skb->protocol.  It is two bytes at a fixed
64KB offset, crossing into an unrelated slab cache.

Only write the ethernet header when there is one.  This mirrors what
xfrm4_transport_input() already does, where the header length is taken as
skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and it leaves
the behaviour of every well-formed skb unchanged.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---

Tested at runtime on mainline itself, before and after.  Both kernels were
built from aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
CONFIG_NET_VRF, so each image is provably from its own commit.  Six boots
each, injecting after the uptime passed 130s.

The skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the
control: they fire when the unset-header skb reaches the receive path, and
this patch does not touch that site.

                  skb came through   reached the write   KASAN
  unpatched         5 of 6 boots       5 of 5             1
  patched           2 of 6 boots       0 of 2             0

Every unpatched boot in which the skb arrived reached the write; no patched
boot did, including the two in which the control shows the same skb
arriving.  The assertion inside skb_mac_header() disappears from the patched
runs for the reason the change implies - eth_hdr(skb) is no longer evaluated
when the header is unset, so skb_mac_header() is not called at that site -
while the unrelated warnings remain.

checkpatch reports one thing, the missing Fixes: tag.  Neither tree we
reproduced on carries history for the file, so we could not determine the
introducing commit; we will add the tag if you can name it.

 net/xfrm/xfrm_input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d513..624ff8055 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
@@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
-- 
2.34.1

