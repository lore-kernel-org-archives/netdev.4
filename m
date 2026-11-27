Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818730;
	b=ICds0XWOoAYdGGUXPVM87nMc8KukpJWH+ts1wyr3Cr3dbhqDXratXLsspVQoeStgQ958
	 CfgzS2rcf0T110awIn0YjLw63TsLwXq2Sd3hfCLflT9k/kNOwoTrv5BLOQ+8QaVxC0GjH
	 ZiOstXg1awkMUiZhJDIPmhK7IJJrsf4JspcmxTJW6j8o9UeXWyKC7BYPULWDBXlVIxlGF
	 nPN7C97xv90pdjhihUOCtcuKxvl7KLtbfQ/d+RLZ3OlsTSohm+05VvVKQ1OttOkZ14xFR
	 LqV6SbNLMFL91FEbRwSmBPWVILYSyF2jQwUFF3t9GvOvzSHvhcW1xzgRGQk6QHN+iHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JkfqMAYa303IAXL1Qwk53rqN6BbVqNVDCZjhNvYLNXg=;
	b=Bol8w9IY8811yyCibsIlSXiGLntbX4lhyDzrlsX39ylAeyjn9/UP0dT5CPwYNxKi+AdL
	 XVYCzFOxH+A0mJVvp0QSyU0P53hi1mBi7+QCxDSeKiLcnephc3/f9689Z0kGHLF/+HQok
	 Byqry4uMxB7Y4W2WtAHmh1ocD1fB24Bo0LNVWVzRrxh20B4LbWPaNEEo4ALBCuhqbjjnO
	 V1und10QZTwD86mjVE5NHq0ef6rNp3pE2WGUK0GZl0c/5OPtpyEI82ntNT37f9jUURfUc
	 0z+DDJoslD1J+KS0eYAl+mHz4EzHHNu1gK/5z/Di2frhzWdt+zIDiavk9gy8WeKaz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=dSzEPUbF;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739E606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A739E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=dSzEPUbF
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3932173a91.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795818729; x=1796423529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkfqMAYa303IAXL1Qwk53rqN6BbVqNVDCZjhNvYLNXg=;
        b=dSzEPUbFLfoKeZQxnAG9QqWHbOj8cv5Kaqd11peIcu5btYU9rDWRJX7Xr0IJoeuyJr
         iOZJuJm5lXcHHXSczkdFuXIwaF95duee69xoVEwfNKKjqNpxplfm/TIMG9cY7JevTvCg
         qxcssLKWV2xo9PCqYR572cSZp0u8ALAF4YY66x7xkrQMGrK6AZJwZWL86ze43b3n2kzX
         O9TIkHPfXVjNxNS9u7h8oIRRQO9nHIVtJAXqUs+wADNGHcXa+a6rYLo4HfEvRSjRCoic
         cgvr691f1z4dgwNyc4PXSyfPls9LodqgKBYOk1nHuZoZ74QIVNQatf0CvlyJx6r/u5RI
         fH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818729; x=1796423529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkfqMAYa303IAXL1Qwk53rqN6BbVqNVDCZjhNvYLNXg=;
        b=Px1aOutyf9n7TpZO1iee7VEpMgdtEZ8fbb2gE8ttOTj6xDObKmmTs4MLjbuPIxdqTu
         ZDhrGYmGoqs30NU59y/c6M7cL+A5LU+UNWFPAitWFvt/4vgDPgIGZxH2gZX5UN9B6Wk3
         6ppYb2B+pjiyMSMgWQ+hn2IzEoePRuc6yekUZop0raLQD51IQ3b1fIQtDOqSTUe+TqME
         FK778JgcllQh6F/OdQPqcLXacH0ZiWtYe36VFykwiI44S0uhXvdvjDe9SThKholiZ1bQ
         BmAWzhY0dB2Z2noRWzKqW1RAPaIAaS0RKnPNcszPrCkIUc6aKtlamgtMsEYbinuiRmac
         Dlbw==
X-Forwarded-Encrypted: i=1; AL+hErGrtazGIMjjOOIFKMNFbFg1QjYzwsbxq9UHeLd7ytsnGhH+K2rRjZ1ZkSUv9AKQQDp/t+vSDRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P6Wbn8cv65R9Qnvc+Hyw7lDNhVX1kKQbLzAZTjLZE+tu/LIQf
	8hJ/53nI413OT5W31uHb0C807kb6MYghkyVBFS6lSsClIn/2VeyFJYeLQ95Dx7owbTuDvVivoEu
	694GZWcOUpmQihY73nNNinygOYChI/yDBe6z7PQhzZA5Q6ngnajA4
X-Gm-Gg: AZFdTZdHJYbl/j3DacdqwIo77g+Dq4CVycUWIL3ewd42WwWHt/YX4BKJq2DgJmNraJ+
	hBYhs2CsI/5IDSILwyRuEPWJR5b7kEZV9oYikepB9wokK+9U4q8g3sVqdkiNETUz2mhYb0hSnSp
	Xsd1zLz+3wifxI+yjJVZmT22BsOstKWvZjyJzXh5ly7g/FGv3vShwca+H1JNHwc7Wwz5woXNOPM
	paAlZjydYguhxaxfX9msZL2P3Uc43mM82v4GqKiVqv0oBJ9/oDZTuQpKDvr2v/LVTOx0hdYtjCL
	tFTv9TWik+1wQEkX0K+HRF3L+p0P/I4hBz1rL6FtiRv5E6FUAqVI4QPMHrPM9yQjcGvSPjVCT+N
	yWVc7qbjgPOEAWR8BbjxN8GUBGJ8=
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr26944682a91.54.1795818728866;
        Fri, 27 Nov 2026 14:32:08 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4d00c6137sm8742684a91.5.2026.11.27.14.32.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 14:32:08 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: give a runt-started inner packet a MAC header
Date: Fri, 27 Nov 2026 14:32:05 -0800
Message-ID: <e7d0ab12-61be-4ba7-9a2d-4a71ca73dc4e@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

When an inner packet's IP header is split across two outer packets (a
runt, which RFC 9347 allows), iptfs_reassem_cont() allocates the skb
for the rest but never sets its MAC header. Any packet socket on the
device then pushes back toward the unset header and panics:

  skbuff: skb_under_panic: text:ffffffff82071ea5 len:-65455 put:-65455
   skb_push+0x53/0x60
   tpacket_rcv+0x91f/0xee0
   netif_receive_skb_list_internal+0x49b/0x10e0

An unprivileged user can set the whole thing up (both tunnel ends and
the capture in its own namespaces). With GRO on the ingress device,
gro_list_prepare() reads past the head the same way, with no socket
at all. Rebuild the MAC header from the outer packet.

The patch was written with an AI coding assistant and reviewed by the
submitter.

Fixes: 075694765446 ("xfrm: iptfs: handle received fragmented inner packets")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
Found by an AI code review agent while testing an unlocked runt state.
Validated with a shell + Python (cryptography) + C netlink reproducer,
no kernel changes or fault injection; a sender without the SA's keys
cannot reach it (ESP drops forged runts). Tested: the reproducer
panics unmodified kernels, as root and as an unprivileged uid, and
passes with the fix, with well-formed frames; KASAN and lockdep
builds, panic_on_warn=1 on the fixed kernel. GRO evidence (no packet
socket needed), on f0e68014f4ac: IPv6 ESP-in-UDP with runts through
GRO + rx-gro-list at ingress triggers KASAN slab reports in
dev_gro_receive() (read of size 8); the same traffic with runts=0 is
clean, and the fixed stack forwards everything with no report. Also
reproduced with the sender on one host and a KASAN victim on another,
needing only CONFIG_XFRM_IPTFS (the xfrm_iptfs module, or built in);
present since v6.14. A reproducer is available to the maintainers on
request. Depends-on
note: this copy relies on C1
([PATCH ipsec] xfrm: iptfs: reserve room for the outer MAC header in
new inner skbs, patchwork 15029420, posted 11-27) for long MAC headers.

 net/xfrm/xfrm_iptfs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 3fff835497b9..28b9fa109251 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -845,6 +845,20 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 		}
 		xtfs->ra_newskb = newskb;
 
+		/* Rebuild the mac header from the outer packet, as
+		 * __input_process_payload() does for the skbs it allocates;
+		 * packet taps push back to it on receive.
+		 */
+		if (skb_mac_header_was_set(skb)) {
+			skb_set_mac_header(newskb, -skb->mac_len);
+			memcpy(skb_mac_header(newskb), skb_mac_header(skb),
+			       skb->mac_len);
+			if (skb->mac_len)
+				eth_hdr(newskb)->h_proto =
+					(xtfs->ra_runt[0] >> 4) == 6 ?
+					htons(ETH_P_IPV6) : htons(ETH_P_IP);
+		}
+
 		/* Copy the runt data into the buffer, but leave data
 		 * pointers the same as normal non-runt case. The extra `rrem`
 		 * recopied bytes are basically cacheline free. Allows using

base-commit: 1213df0bc5993e479706c5eba5830243d778f164
--
2.53.0
